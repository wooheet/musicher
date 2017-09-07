package musicher.manager.dto;

public class rankDTO {

	int ranking;
	String value;
	String name;
	
	public rankDTO(){}

	public rankDTO(int ranking, String value, String name) {
		super();
		this.ranking = ranking;
		this.value = value;
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public int getRanking() {
		return ranking;
	}

	public void setRanking(int ranking) {
		this.ranking = ranking;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "rankDTO [ranking=" + ranking + ", name=" + name + "]";
	}
	
}
