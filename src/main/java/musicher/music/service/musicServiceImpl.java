package musicher.music.service;

import java.util.List;

import musicher.music.dao.musicDAO;
import musicher.music.dto.mylistDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service("musicService")
public class musicServiceImpl implements musicService {
	
	@Autowired
	musicDAO musicdao;
	
	@Override
	public List<mylistDTO> mymusicList(String mem_id) {
		
		return musicdao.mymusicList(mem_id);
	}

	@Override
	public void delmymusic(String music_id, String mem_id) {
		musicdao.delmymusic(music_id, mem_id);
	}

	@Override
	public void insertmymusic(String music_id, String mem_id) {
		musicdao.insertmymusic(music_id, mem_id);
		
	}
	@Override
	public void multiInsert(String playlist_id, String music_id, String mem_id) {
		musicdao.multiInsert(playlist_id,music_id, mem_id);
		
	}

}
