package musicher.member.service;

import musicher.member.dto.memberDTO;

public interface memberService {
	void insert(memberDTO user);
	memberDTO login(String mem_id,String pass);
	public memberDTO read(String mem_id);	
	void update(memberDTO user);
	void delete(String mem_id);
	public void Groupupdate(memberDTO user);
	public void toFree(String mem_id);
}	
