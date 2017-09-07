package musicher.manager.dto;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="music")
public class MusicListDTO {
	@Id	
	String music_id;
	String title;
	String save;
	String genre_id;
	String singer_id;
	public MusicListDTO() {
		super();
	}
	public MusicListDTO(String music_id, String title, String save,
			String genre_id, String singer_id) {
		super();
		this.music_id = music_id;
		this.title = title;
		this.save = save;
		this.genre_id = genre_id;
		this.singer_id = singer_id;
	}
	public String getMusic_id() {
		return music_id;
	}
	public void setMusic_id(String music_id) {
		this.music_id = music_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSave() {
		return save;
	}
	public void setSave(String save) {
		this.save = save;
	}
	public String getGenre_id() {
		return genre_id;
	}
	public void setGenre_id(String genre_id) {
		this.genre_id = genre_id;
	}
	public String getSinger_id() {
		return singer_id;
	}
	public void setSinger_id(String singer_id) {
		this.singer_id = singer_id;
	}
	
	
	
	
}
