package musicher.pay.service;

import java.util.List;

import musicher.pay.dao.payDAO;
import musicher.pay.dto.payDTO;
import musicher.pay.dto.payDTO2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("payService")
public class payServiceImpl implements payService {
	@Autowired
	@Qualifier("paydao")
	payDAO paydao;

	@Override
	public void insert(payDTO pay) {
		paydao.insert(pay);		
	}

	@Override
	public List<payDTO> memberpay(String mem_id) {
		return paydao.memberpay(mem_id);
	}
	@Override
	public payDTO2 payPresent(String mem_id) {
		
		return paydao.payPresent(mem_id);
	}
}
