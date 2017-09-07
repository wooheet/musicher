package musicher.manager.dto;

public class MusicListDTO2 {
	String music_id;
	String title;
	String save;
	String genre;
	String singer;
	public MusicListDTO2() {
		super();
	}
	public MusicListDTO2(String music_id, String title, String save,
			String genre, String singer) {
		super();
		this.music_id = music_id;
		this.title = title;
		this.save = save;
		this.genre = genre;
		this.singer = singer;
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
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	
	
}
