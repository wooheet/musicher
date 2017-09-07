package musicher.manager.service;


import java.util.List;

import musicher.manager.dao.managerDAO;
import musicher.manager.dto.MusicListDTO;
import musicher.manager.dto.MusicStampDTO;
import musicher.manager.dto.rankDTO;
import musicher.member.dao.memberDAO;
import musicher.member.dto.memberDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


@Service
public class managerServiceImpl implements managerService {
	
	@Autowired
	@Qualifier("managerdao")
	managerDAO managerdao;
	
	@Autowired
	@Qualifier("memberdao")
	memberDAO memberdao;
	
	public void upload(MultipartFile file, String path, String fileName){
		managerdao.upload(file, path, fileName);
	}

	@Override
	public List<rankDTO> getRanklist(String group) {
	//	List<rankDTO> ranklist =;
		return managerdao.getRanklist(group);
	}

	@Override
	public List<memberDTO> memberlist(int pageno) {
		return memberdao.memberlist(pageno);
	}
	
	/*@Override
	public List<memberDTO> memberlist() {
		return memberdao.memberlist();
	}*/
	
	
	@Override
	public List<MusicListDTO> getMusiclist(int pageno) {
		return managerdao.getMusiclist(pageno);
	}
	public void insert(String music_id,String title,String save,String gerne_id,String singer_id){
		managerdao.insert(music_id, title, save, gerne_id, singer_id);
		
	}

	@Override
	public int musiccount() {
		return managerdao.musiccount();
	}
	
	@Override
	public int membercount() {
		return managerdao.membercount();
	}

	@Override
	public int blockinsert(MusicStampDTO stamp) {
		return managerdao.blockinsert(stamp);
	}
}
