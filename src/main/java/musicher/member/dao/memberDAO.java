package musicher.member.dao;

import java.util.List;

import musicher.member.dto.memberDTO;

public interface memberDAO {
	void insert(memberDTO user);
	memberDTO login(String mem_id,String pass);

	public memberDTO read(String mem_id);
	
	void update(memberDTO user);
	void delete(String mem_id);
	public List<memberDTO> memberlist(int pageno);
	//public List<memberDTO> memberlist();
	public void Groupupdate(memberDTO user);
	public void toFree(String mem_id);
}
