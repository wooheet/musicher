package musicher.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import musicher.manager.dto.MusicListDTO;
import musicher.manager.dto.MusicRepository;
import musicher.member.dto.memberDTO;
import musicher.member.dto.MemberRepository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Repository;
@Repository("memberdao")
public class memberDAOImpl implements memberDAO {
	@Autowired
	SqlSession sqlSession;
	@Autowired
	MemberRepository memberRepository;
	
	@Override
	public void insert(memberDTO user) {
		sqlSession.insert("musicher.member.dto.insert", user);

	}

	@Override
	public memberDTO login(String mem_id, String pass) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("mem_id", mem_id);
		map.put("pass",pass);
		return sqlSession.selectOne("musicher.member.dto.login", map);
	}
	
	@Override
	public memberDTO read(String mem_id) {
		return sqlSession.selectOne("musicher.member.dto.read", mem_id);

	}

	@Override
	public void update(memberDTO user) {
		sqlSession.update("musicher.member.dto.update", user);
		
	}
	
	@Override
	public void Groupupdate(memberDTO user) {
		sqlSession.update("musicher.member.dto.GroupUpdate", user);
		
	}

	@Override
	public void delete(String mem_id) {
		System.out.println("dao"+mem_id);
		sqlSession.delete("musicher.member.dto.delete", mem_id);
		
	}
	
	@Override
	public List<memberDTO> memberlist(int pageno) {
		Page<memberDTO> page=  memberRepository.findAll(new PageRequest(pageno, 15));
		List<memberDTO> data=page.getContent();
		return data;
		
	}

	@Override
	public void toFree(String mem_id) {
		sqlSession.update("musicher.member.dto.toFree", mem_id);
		
	}

	/*
	@Override
	public List<memberDTO> memberlist() {
		return memberRepository.findAll();
		
	}*/


}
