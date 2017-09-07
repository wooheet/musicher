package musicher.manager.service;

import java.util.List;




import musicher.manager.dto.MusicListDTO;
import musicher.manager.dto.MusicStampDTO;
import musicher.manager.dto.rankDTO;
import musicher.member.dto.memberDTO;

import org.springframework.web.multipart.MultipartFile;



public interface managerService {
	public void upload(MultipartFile file, String path, String fileName);
	public List<rankDTO> getRanklist(String group);
	public List<memberDTO> memberlist(int pageno);
	//public List<memberDTO> memberlist();
	public int musiccount();
	public List<MusicListDTO> getMusiclist(int pageno);
	public void insert(String music_id,String title,String save,String gerne_id,String singer_id);
	public int membercount() ;
	int blockinsert(MusicStampDTO stamp);
}	
