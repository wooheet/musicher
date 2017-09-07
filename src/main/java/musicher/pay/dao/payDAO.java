package musicher.pay.dao;

import java.util.List;

import musicher.pay.dto.payDTO;
import musicher.pay.dto.payDTO2;

public interface payDAO {
	void insert(payDTO pay);
	List<payDTO> memberpay(String mem_id);
	payDTO2 payPresent(String mem_id);

}
