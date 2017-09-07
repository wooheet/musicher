package musicher.pay.service;

import java.util.List;

import musicher.pay.dto.payDTO;
import musicher.pay.dto.payDTO2;

public interface payService {
	void insert(payDTO pay);
	List<payDTO> memberpay(String mem_id);
	payDTO2 payPresent(String mem_id);

}
