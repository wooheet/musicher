package musicher.pay.dao;

import java.util.List;

import musicher.pay.dto.payDTO;
import musicher.pay.dto.payDTO2;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("paydao")
public class payDAOImpl implements payDAO {
	@Autowired
	SqlSession sqlSession;

	@Override
	public void insert(payDTO pay) {
		sqlSession.insert("musicher.pay.dto.insert", pay);		
	}

	@Override
	public List<payDTO> memberpay(String mem_id) {
		return sqlSession.selectList("musicher.pay.dto.paylist",mem_id);
	}
	@Override
	public payDTO2 payPresent(String mem_id) {
		return sqlSession.selectOne("musicher.pay.dto.payPresent",mem_id);
	}
}
