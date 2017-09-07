package musicher.recommend.service;

import javax.servlet.http.HttpServletRequest;

import musicher.recommend.dto.recommendDTO;

public interface recommendService {
	public void insert(recommendDTO recommend);
	public int isNull(String userID, String musicID);
	public void update(recommendDTO recommend);
	public recommendDTO clickNum(String userID, String musicID) ;
	long[] getUsers(String path, HttpServletRequest req)throws Exception;
	void makedata(String path,String mem_id);
}
