package musicher.manager.dto;
import org.springframework.stereotype.Service;
@Service
public class MusicStampDTO {

	String musicHash;
	String stampId;
	
	public MusicStampDTO(){}

	public MusicStampDTO(String musicHash,
			String stampId) {
		super();
		
		this.musicHash = musicHash;
		this.stampId = stampId;
	}

	public String getMusicHash() {
		return musicHash;
	}

	public void setMusicHash(String musicHash) {
		this.musicHash = musicHash;
	}

	public String getStampId() {
		return stampId;
	}

	public void setStampId(String stampId) {
		this.stampId = stampId;
	}

	
	
}
