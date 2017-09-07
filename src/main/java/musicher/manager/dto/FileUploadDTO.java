package musicher.manager.dto;

import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadDTO {
	private String[] title;
	private String[] save;
	private String[] gerne_id;
	private String[] singer_id;
	
	@Override
	public String toString() {
		return "FileUploadDTO [title=" + Arrays.toString(title) + ", save="
				+ Arrays.toString(save) + ", gerne_id="
				+ Arrays.toString(gerne_id) + ", singer_id="
				+ Arrays.toString(singer_id) + ", upFile="
				+ Arrays.toString(upFile) + "]";
	}


	public FileUploadDTO(String[] title, String[] save, String[] gerne_id,
			String[] singer_id, MultipartFile[] upFile) {
		super();
		this.title = title;
		this.save = save;
		this.gerne_id = gerne_id;
		this.singer_id = singer_id;
		this.upFile = upFile;
	}


	public String[] getTitle() {
		return title;
	}


	public void setTitle(String[] title) {
		this.title = title;
	}


	public String[] getSave() {
		return save;
	}


	public void setSave(String[] save) {
		this.save = save;
	}


	public String[] getGerne_id() {
		return gerne_id;
	}


	public void setGerne_id(String[] gerne_id) {
		this.gerne_id = gerne_id;
	}


	public String[] getSinger_id() {
		return singer_id;
	}


	public void setSinger_id(String[] singer_id) {
		this.singer_id = singer_id;
	}


	public MultipartFile[] getUpFile() {
		return upFile;
	}


	public void setUpFile(MultipartFile[] upFile) {
		this.upFile = upFile;
	}


	private MultipartFile[] upFile; //업로드되는 파일을 처리할 수 있는 객체  jsp의 파라미터 name과 이름이 같게
	
	
	public FileUploadDTO(){
		
	}
	
	
}
