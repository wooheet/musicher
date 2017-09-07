package musicher.member.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import musicher.member.dto.memberDTO;
import musicher.member.service.memberService;
import musicher.music.dto.mylistDTO;
import musicher.music.service.musicService;
import musicher.pay.dto.payDTO;
import musicher.pay.service.payService;
import musicher.recommend.dto.recommendDTO;
import musicher.recommend.service.recommendService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;


@Controller
public class myPageController {
	@Autowired
	memberService service;
	@Autowired
	payService payservice;
	@Autowired
	musicService musicservice;
	
	@Autowired
	recommendService recommendservice;
	
	
	@RequestMapping(value="/read.do",method=RequestMethod.GET)
	public String showMyPage(Model model,@RequestParam String mem_id){
		System.out.println(mem_id);
		model.addAttribute("user",service.read(mem_id));
		model.addAttribute("insertpage","UpdateDelete.jsp");
		System.out.println(service.read(mem_id));
		return "views/memberpage/memberpage";
		
	}
	
	@RequestMapping(value="/update.do",method=RequestMethod.POST)
	public String update(memberDTO user){
		
		service.update(user);
		System.out.println("update");
		return "index";
		
		
	}
	
	@RequestMapping(value="/delete.do",method=RequestMethod.GET)
	public String delete(String mem_id,SessionStatus status, HttpServletRequest req){
		
		service.delete(mem_id);
		System.out.println(mem_id+"삭제성공");
		HttpSession ses = req.getSession(false);	
		if(ses!=null){
			ses.invalidate();
		}
		System.out.println("로그아웃 ");
		return "index";
		
	}
	
	@RequestMapping(value="/memberpay.do",method=RequestMethod.GET)
	public String memberpay(String mem_id, Model model){
		List<payDTO> paylist = payservice.memberpay(mem_id);
		model.addAttribute("paylist", paylist);
		model.addAttribute("insertpage","memberpaylist.jsp");
		return "views/memberpage/memberpage";
	}
	@RequestMapping(value="/mymusiclist.do",method=RequestMethod.GET)
	public String mymusiclist(String mem_id, Model model){
		List<mylistDTO> mymusiclist = musicservice.mymusicList(mem_id);
		model.addAttribute("mymusiclist",mymusiclist);
		model.addAttribute("insertpage","mymusic.jsp");
		return "views/memberpage/memberpage";
	}
	
	@RequestMapping(value="/delmymusicpopup.do",method=RequestMethod.GET)
	public String delmymusicpopup(String music_id, String mem_id, Model model){
		musicservice.delmymusic(music_id, mem_id);
		
		System.out.println("삭제 "+mem_id);
		List<mylistDTO> mymusiclist = musicservice.mymusicList(mem_id);
		model.addAttribute("mymusiclist",mymusiclist);
		return "redirect:/MyMusic.do?mem_id="+mem_id;
		
	}
	
	@RequestMapping(value="/delmymusic.do",method=RequestMethod.GET)
	public String delmymusic(String music_id, String mem_id, Model model){
		musicservice.delmymusic(music_id, mem_id);
		
		System.out.println("삭제 "+mem_id);
		List<mylistDTO> mymusiclist = musicservice.mymusicList(mem_id);
		model.addAttribute("mymusiclist",mymusiclist);
		model.addAttribute("insertpage","mymusic.jsp");
		return "views/memberpage/memberpage";
		
	}
	
	@RequestMapping(value="/insertmymusic.do",method=RequestMethod.GET)
	public void insertmymusic(String music_id, String mem_id, HttpServletResponse response) throws IOException{
				
		recommendDTO dto = recommendservice.clickNum(mem_id, music_id);
		
		if(dto != null){
			dto = recommendservice.clickNum(mem_id, music_id);
			int newClick = dto.getClick() + 1;
			dto.setClick(newClick);
			recommendDTO newdto = new recommendDTO(mem_id, music_id, newClick);
			recommendservice.update(newdto);			
		}else{
			dto = new recommendDTO(mem_id,music_id, 1);
			recommendservice.insert(dto);
		}
		
		musicservice.insertmymusic(music_id, mem_id);
		
		
		PrintWriter out;
		
			String str = "";
			out = response.getWriter();
			str = "<script language='javascript'>";
			str += "myMusic = window.open('/Musicher/MyMusic.do?mem_id="+mem_id+"', 'myMusic', 'width=550,height=600,scrollbars=yes');";
			str +="history.go(-1);";
			str += "</script>";
			
			out.print(str);
			
			
		
	}
	
	@RequestMapping(value="/multiInsert.do",method=RequestMethod.POST)
	public void multiInsert(@RequestParam(value="chkbox",required=true)List<String> checkVals, String mem_id,HttpServletResponse response) throws IOException{
		SimpleDateFormat yyMMddHHmmss = new SimpleDateFormat("yyMMddHHmmss");	
		String id = String.valueOf(yyMMddHHmmss.format(new Date()));
		double firstPlayId = Double.parseDouble(id);
		double startnum=0;
		for(String music_id :  checkVals){
			String playlist_id = String.valueOf(Math.round(firstPlayId+startnum));
			musicservice.multiInsert(playlist_id,music_id, mem_id);
			//System.out.println("playlist_id :"+playlist_id+" music_id : "+music_id);
			startnum ++;
		}	
		PrintWriter out;
		String str = "";
		out = response.getWriter();
		str = "<script language='javascript'>";
		str += "myMusic = window.open('/Musicher/MyMusic.do?mem_id="+mem_id+"', 'myMusic', 'width=550,height=600,scrollbars=yes');";
		str +="history.go(-1);";
		str += "</script>";
		
		out.print(str);		
	}
	
	
}
