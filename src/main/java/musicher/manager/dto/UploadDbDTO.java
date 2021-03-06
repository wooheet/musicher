package musicher.manager.dto;



public class UploadDbDTO {
	
	String music_id;
	
	String title;
	String save;
	String gerne_id;
	String singer_id;
	
	
	@Override
	public String toString() {
		return "UploadDbDTO [music_id=" + music_id + ", title=" + title
				+ ", save=" + save + ", gerne_id=" + gerne_id + ", singer_id="
				+ singer_id + "]";
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


	public String getGerne_id() {
		return gerne_id;
	}


	public void setGerne_id(String gerne_id) {
		this.gerne_id = gerne_id;
	}


	public String getSinger_id() {
		return singer_id;
	}


	public void setSinger_id(String singer_id) {
		this.singer_id = singer_id;
	}


	public UploadDbDTO(String music_id, String title, String save,
			String gerne_id, String singer_id) {
		super();
		this.music_id = music_id;
		this.title = title;
		this.save = save;
		this.gerne_id = gerne_id;
		this.singer_id = singer_id;
	}


	public UploadDbDTO(){
		
	}
	
	
}
