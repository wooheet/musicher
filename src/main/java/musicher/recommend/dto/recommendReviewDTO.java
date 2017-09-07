package musicher.recommend.dto;

public class recommendReviewDTO {
	String userID;
	String musicID;
	int click ;
	public recommendReviewDTO() {
		super();
	}
	public recommendReviewDTO(String userID, String musicID, int click) {
		super();
		this.userID = userID;
		this.musicID = musicID;
		this.click = click;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getMusicID() {
		return musicID;
	}
	public void setMusicID(String musicID) {
		this.musicID = musicID;
	}
	public int getClick() {
		return click;
	}
	public void setClick(int click) {
		this.click = click;
	}
	
	
	
	
}
