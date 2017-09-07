package musicher.recommend.dao;

import java.util.HashMap;
import java.util.Map;

import musicher.recommend.dto.recommendDTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("recommenddao")
public class recommendDAOImpl implements recommendDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void insert(recommendDTO recommend) {
		sqlSession.insert("musicher.recommend.dto.insert", recommend);
	}
	
	@Override
	public int isNull(String userID, String musicID) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userID", userID);
		map.put("musicID",musicID);
		return sqlSession.selectOne("musicher.recommend.dto.isNull", map);
	}
	
	@Override
	public void update(recommendDTO recommend) {
		sqlSession.update("musicher.recommend.dto.update", recommend);		
	}
	
	@Override
	public recommendDTO clickNum(String userID, String musicID) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userID", userID);
		map.put("musicID",musicID);
		return sqlSession.selectOne("musicher.recommend.dto.clickNum", map);

	}


}
