package musicher.genre.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import musicher.genre.dto.genreDTO;
import musicher.member.dto.memberDTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository("genredao")
public class genreDAOImpl implements genreDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<genreDTO> genreList(String high) {
		
		return sqlSession.selectList("musicher.genre.dto.grlist",high);
	}

@Override
	public genreDTO  genre_id(String genre_id) {
		
		return sqlSession.selectOne("musicher.genre.dto.genre_id",genre_id);
	}

	

}
