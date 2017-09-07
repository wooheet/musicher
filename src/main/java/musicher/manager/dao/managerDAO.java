package musicher.manager.dao;


import java.util.List;

import musicher.manager.dto.MusicListDTO;
import musicher.manager.dto.MusicStampDTO;
import musicher.manager.dto.rankDTO;

import org.springframework.web.multipart.MultipartFile;


public interface managerDAO {
	
	public void upload(MultipartFile file, String path, String fileName);

	public List<rankDTO> getRanklist(String group);
	public List<MusicListDTO> getMusiclist(int pageno);
	public void insert(String music_id,String title,String save,String gerne_id,String singer_id);
	public int musiccount();	
	public int membercount() ;
	int blockinsert(MusicStampDTO stamp);
	}
	

