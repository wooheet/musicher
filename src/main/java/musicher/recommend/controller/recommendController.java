package musicher.recommend.controller;


import musicher.recommend.dto.recommendDTO;
import musicher.recommend.service.recommendService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class recommendController {
	@Autowired
	recommendService recommendservice;
	
	
	@RequestMapping(value="/insertRecommend",method=RequestMethod.GET)
	public void insertRecommend(String musicID, String userID){
		System.out.println("controller");
		//int isNull = recommendservice.isNull(userID, musicID);
		recommendDTO dto = recommendservice.clickNum(userID, musicID);
		
		//System.out.println("dto.getClick() : "+dto.getClick());
		if(dto != null){
			dto = recommendservice.clickNum(userID, musicID);
			int newClick = dto.getClick() + 1;
			dto.setClick(newClick);
			recommendDTO newdto = new recommendDTO(userID, musicID, newClick);
			recommendservice.update(newdto);
			System.out.println("있으니까 update : "+newdto);
			
		}else{
			System.out.println("없으니까 insert : ");
			dto = new recommendDTO(userID,musicID, 1);
			System.out.println("없으니까 insert : "+dto);
			recommendservice.insert(dto);
		}
		
		
	}
	
	
	
}
