package musicher.pay.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import musicher.member.dto.memberDTO;
import musicher.member.service.memberService;
import musicher.pay.dto.payDTO;
import musicher.pay.service.payService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class payController {
	@Autowired
	payService payservice;
	@Autowired
	memberService service;
	
	@RequestMapping("/payResult.do")
	public String payResult(payDTO pay, memberDTO user, HttpServletRequest req){
		System.out.println("payDTO : "+pay);
		payservice.insert(pay);
		System.out.println("user : "+user);	
		service.Groupupdate(user);
		HttpSession ses = req.getSession(false);	
		if(ses!=null){
			ses.invalidate();
		}
		memberDTO checkUser = service.login(user.getMem_id(), user.getPass());
		if(checkUser!=null){
			req.getSession().setAttribute("loginUser", checkUser);
			System.out.println("세션리셋 : "+checkUser);
		}
		return "views/payResult";
	}
}
