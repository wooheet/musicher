package musicher.member.controller;

import musicher.member.dto.memberDTO;
import musicher.member.service.memberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InsertMemberController {

	@Autowired
	memberService service;
	//get방식으로 요청될때 실행될 메소드 - insert정보를 입력할 수 있는 페이지를 response
	@RequestMapping(value="/signup.do",method=RequestMethod.GET)
	public String showView(){
		return "views/signup";
	}
	//post방식으로 요청될때 실행될 메소드 - 실제 db에 insert하는 메소드
	@RequestMapping(value="/signup.do",method=RequestMethod.POST)
	public String runInsert(memberDTO user){
		System.out.println("user:"+user);
		service.insert(user);
		return "redirect:index.do";
	}
}
