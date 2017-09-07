package musicher.genre.dto;

public class genreDTO {
	
	String genre_id;
	
	String grname;
	String high;
	
	public String getGenre_id() {
		return genre_id;
	}

	public void setGenre_id(String genre_id) {
		this.genre_id = genre_id;
	}

	public genreDTO(String genre_id, String grname, String high) {
		super();
		this.genre_id = genre_id;
		this.grname = grname;
		this.high = high;
	}

	@Override
	public String toString() {
		return "gerneDTO [genre_id=" + genre_id + ", grname=" + grname
				+ ", high=" + high + "]";
	}

	

	public String getGrname() {
		return grname;
	}

	public void setGrname(String grname) {
		this.grname = grname;
	}

	public String getHigh() {
		return high;
	}

	public void setHigh(String high) {
		this.high = high;
	}

	public genreDTO(){}
	
	
	
}
