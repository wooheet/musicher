package musicher.recommend.service;

import musicher.recommend.dao.recommendDAO;
import musicher.recommend.dto.recommendDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("recommendService")
public class recommendServiceImpl implements recommendService {
	@Autowired
	@Qualifier("recommenddao")
	recommendDAO recommenddao;

	@Override
	public void insert(recommendDTO recommend) {
		recommenddao.insert(recommend);
		
	}

	@Override
	public int isNull(String userID, String musicID) {
		return recommenddao.isNull(userID, musicID);
	}

	@Override
	public void update(recommendDTO recommend) {
		recommenddao.update(recommend);
		
	}

	@Override
	public recommendDTO clickNum(String userID, String musicID) {
		return recommenddao.clickNum(userID, musicID);
	}
}
