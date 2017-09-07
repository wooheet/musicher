package musicher.music.controller;


import musicher.music.service.musicService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class musicController {
	@Autowired
	musicService musicservice;
	
	
	@RequestMapping("/mymusiclist.do")
	public String payResult(String mem_id, Model model){
		
		model.addAttribute("mymusiclist",musicservice.mymusicList(mem_id));
		return "views/payResult";
	}
}
