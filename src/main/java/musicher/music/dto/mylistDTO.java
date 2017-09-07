package musicher.music.dto;

public class mylistDTO {
	String music_id;
	String title;
	String singer;
	public mylistDTO() {
		super();
	}
	public mylistDTO(String music_id, String title, String singer) {
		super();
		this.music_id = music_id;
		this.title = title;
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
	public String getSinger() {
		return singer;
	}
	public void setSinger(String singer) {
		this.singer = singer;
	}
	@Override
	public String toString() {
		return "mylistDTO [music_id=" + music_id + ", title=" + title
				+ ", singer=" + singer + "]";
	}
	
	
	
	
}
