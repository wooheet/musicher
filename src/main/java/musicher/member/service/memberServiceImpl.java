package musicher.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import musicher.member.dao.memberDAO;
import musicher.member.dto.memberDTO;
@Service("memberService")
public class memberServiceImpl implements memberService {
	@Autowired
	@Qualifier("memberdao")
	memberDAO dao;
	
	@Override
	public void insert(memberDTO user) {
		dao.insert(user);

	}

	@Override
	public memberDTO login(String mem_id, String pass) {
		return dao.login(mem_id, pass);
	}
	

@Override
	public memberDTO read(String mem_id) {
		return dao.read(mem_id);

	}
@Override
public void toFree(String mem_id) {
	dao.toFree(mem_id);
	
}


@Override
public void update(memberDTO user) {
	dao.update(user);
	
}
@Override
public void delete(String mem_id){
	dao.delete(mem_id);
	
}

@Override
public void Groupupdate(memberDTO user) {
	dao.Groupupdate(user);
	
}


}
