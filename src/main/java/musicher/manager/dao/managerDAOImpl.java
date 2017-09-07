package musicher.manager.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import musicher.manager.controller.StampInsert;
import musicher.manager.dto.MusicListDTO;
import musicher.manager.dto.MusicRepository;
import musicher.manager.dto.MusicStampDTO;
import musicher.manager.dto.UploadDbDTO;
import musicher.manager.dto.rankDTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository("managerdao")
public class managerDAOImpl implements managerDAO {
	
	@Autowired
	SqlSession sqlSession;
	HttpServletRequest request;
	FileOutputStream fos;
	@Autowired
	StampInsert tempstamp;
	
	public void upload(MultipartFile file, String path, String fileName){
		//실제 위치에 저장하는 로직 구현
		
		Map<String, String> stampData = new HashMap<String, String>();
		try{
			byte[] data = file.getBytes();
			fos= new FileOutputStream(path+File.separator+fileName);
			fos.write(data);
			System.out.println(data);
			//StampInsert tempstamp = new StampInsert();
            stampData = tempstamp.insert(data);
		}catch(IOException e){
			e.printStackTrace();
		}finally{
			try{
				if(fos!=null){
					fos.close();
				}
			}catch(IOException e){
				e.printStackTrace();
			}
		}
	}
	
/*
	@Override
	public List<MusicListDTO> getMusiclist(int pageno) {
		List<MusicListDTO> list = sqlSession.selectList("musicher.manager.dto.musiclist");
		return list;
	}
	*/
	
	@Autowired
	MusicRepository musicRepository;
	public List<MusicListDTO> getMusiclist(int pageno) {
		Page<MusicListDTO> page = musicRepository.findAll(new PageRequest(
				pageno, 15));

		List<MusicListDTO> data = page.getContent();

		return data;
	}
	
	@Override
	   public List<rankDTO> getRanklist(String group) {
	      List<rankDTO> list=null;
	      if(group.equals("m")){
	         list = sqlSession.selectList("musicher.manager.dto.musicRank",group);
	      }
	      else{
	         list = sqlSession.selectList("musicher.manager.dto.ranklist",group);
	      }
	      
	      return list;
	   }


	@Override
	public void insert(String music_id, String title, String save,
			String gerne_id, String singer_id) {
		
		UploadDbDTO dto = new UploadDbDTO(music_id, title, save, gerne_id, singer_id);
		sqlSession.insert("musicher.manager.dto.musicinsert",dto);
	}


	@Override
	public int musiccount() {
		return sqlSession.selectOne("musicher.manager.dto.musiccount");
	}
	
	@Override
	public int membercount() {
		return sqlSession.selectOne("musicher.manager.dto.membercount");
	}

	@Override
	public int blockinsert(MusicStampDTO stamp) {
		return sqlSession.insert("musicher.manager.dto.blockmusicinsert",stamp);
	}
}
