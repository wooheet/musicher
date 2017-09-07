package musicher.recommend.service;

import musicher.recommend.dto.recommendDTO;

public interface recommendService {
	public void insert(recommendDTO recommend);
	public int isNull(String userID, String musicID);
	public void update(recommendDTO recommend);
	public recommendDTO clickNum(String userID, String musicID) ;
}
