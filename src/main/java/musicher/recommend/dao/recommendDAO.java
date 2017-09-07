package musicher.recommend.dao;

import musicher.recommend.dto.recommendDTO;

public interface recommendDAO {
	public void insert(recommendDTO recommend);
	public int isNull(String userID, String musicID);
	public void update(recommendDTO recommend);
	public recommendDTO clickNum(String userID, String musicID) ;

}
