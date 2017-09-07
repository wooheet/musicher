package musicher.member.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import musicher.member.dto.memberDTO;
import musicher.member.service.memberService;
import musicher.pay.dto.payDTO;
import musicher.pay.dto.payDTO2;
import musicher.pay.service.payService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

@Controller
public class loginMemberController {
	@Autowired
	memberService service;
	@Autowired
	payService payservice;

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(memberDTO loginUser, HttpServletRequest req, Model model) {
		memberDTO checkUser = service.login(loginUser.getMem_id(),
				loginUser.getPass());
		req.getSession().setAttribute("loginUser", checkUser);
		if (checkUser.getMem_id() != null) {			
			String mem_id = checkUser.getMem_id();
			if (checkUser.getMem_group().equals("premium")) {
				payDTO2 pay = payservice.payPresent(mem_id);
				java.sql.Date payDate = pay.getPay_date();
				// cal2는 paydate관련
				Calendar cal = Calendar.getInstance();
				Calendar cal2 = Calendar.getInstance();
				cal.setTime(new Date());
				cal2.setTime(payDate);

				cal2.add(Calendar.DATE, 30);// 지불한 날짜에서+30일 추가된 날짜

				// 특정 형태의 날짜로 값을 뽑기
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				String strDate = df.format(cal.getTime());
				String strDate2 = df.format(cal2.getTime());// 지불한 날짜에서+30일 추가된
							
				if (cal.after(cal2)) {

					service.toFree(mem_id);
				}
				checkUser = service.login(loginUser.getMem_id(), loginUser.getPass());
				if(checkUser!=null){
					req.getSession().setAttribute("loginUser", checkUser);
				}
				model.addAttribute("loginmsg", checkUser.getName() + "님 환영합니다.");
			} else {
				model.addAttribute("loginmsg", checkUser.getName() + "님 환영합니다.");
			}
		} else {
			model.addAttribute("fail", "로그인에 실패하였습니다.");
			System.out.println("로그인 실패 : " + loginUser);
		}
		return "index";
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(SessionStatus status, HttpServletRequest req) {

		HttpSession ses = req.getSession(false);
		if (ses != null) {
			ses.invalidate();
		}
		System.out.println("로그아웃 ");
		return "index";
	}
}
