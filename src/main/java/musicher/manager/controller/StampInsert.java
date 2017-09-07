package musicher.manager.controller;

import io.blocko.bitcoinj.core.Sha256Hash;
import io.blocko.bitcoinj.core.Utils;
import io.blocko.coinstack.CoinStackClient;
import io.blocko.coinstack.exception.CoinStackException;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import musicher.blocko.api.API;
import musicher.manager.dto.MusicStampDTO;
import musicher.manager.service.managerService;
import musicher.member.service.memberService;

@Service
public class StampInsert {
	@Autowired
	memberService memservice;
	@Autowired
	managerService mngservice;
	@Autowired
	MusicStampDTO stampDTO;

	CoinStackClient coinstack = API.createNewCoinStackClient();
	@SuppressWarnings("null")
	public Map<String, String> insert(byte[] filebyte){
		Map<String,String> stampData = new HashMap<String, String>(); 
		byte[] data = filebyte;
		byte[] hash = Sha256Hash.create(data).getBytes();
		String musicHash = Utils.HEX.encode(hash);
		System.out.println("음악 해쉬값: "+musicHash);
		try {
			String stampId = coinstack.stampDocument(musicHash);
			System.out.println("음악이 스탬프된 값 : "+stampId);
			stampDTO = new MusicStampDTO(musicHash, stampId);	
			int result = mngservice.blockinsert(stampDTO);
			String msg = "";
			if(result>=1){
				msg = result+"개 - Music 블록체인 삽입되었습니다.";
			}else{
				msg = "블록체인 삽입실패";
			}
			stampData.put("msg", msg);
			stampData.put("MusicHash", musicHash);
			stampData.put("stampId", stampId);
		} catch (CoinStackException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			coinstack.close();
		}
		return stampData;
	}

}
