package musicher.music.dao;

import java.util.List;

import musicher.music.dto.mylistDTO;

public interface musicDAO {
	public List<mylistDTO> mymusicList(String mem_id);
	public void delmymusic(String music_id,String mem_id);
	public void insertmymusic(String music_id,String mem_id);
	public void multiInsert(String playlist_id, String music_id, String mem_id);

}
