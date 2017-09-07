package musicher.manager.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import musicher.manager.dto.FileUploadDTO;
import musicher.manager.dto.MusicListDTO;
import musicher.manager.dto.MusicStampDTO;
import musicher.manager.dto.rankDTO;
import musicher.manager.service.managerService;
import musicher.member.dto.memberDTO;
import musicher.member.service.memberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

@Controller
public class managerController {
	@Autowired
	managerService managerservice;
	@Autowired
	memberService service;
	@Autowired
	MusicStampDTO MusicStamp;
	
	@RequestMapping(value = "/manager.do", method = RequestMethod.GET)
	public String manager(HttpServletRequest req) {
		req.getSession().setAttribute("insertpage", "uploadPage2.jsp");
		// req.getSession().setAttribute("msg1", "active selected");
		return "views/admin/manager";
	}

	@RequestMapping(value = "/stat.do", method = RequestMethod.GET)
	public String statistics(@RequestParam String group, HttpServletRequest req) {
		List<rankDTO> ranklist = managerservice.getRanklist(group);
		String statpage = "";
		if (group.equals("g")) {
			statpage = "chart.jsp";
			req.getSession().setAttribute("ranklist", ranklist);
		} else {
			statpage = "rank.jsp";
			req.getSession().setAttribute("ranklist", ranklist);
		}
		req.getSession().setAttribute("statpage", statpage);
		req.getSession().setAttribute("insertpage", "statisticsPage.jsp");
		return "views/admin/manager";
	}

	@RequestMapping(value = "/memberlist.do", method = RequestMethod.GET)
	public String memberlist(HttpServletRequest req,@RequestParam int pageno,String ck) {
		List<memberDTO> memlist = managerservice.memberlist(pageno);
		pageno = pageno+1;

		System.out.println("페이지no : "+pageno+" , " +ck );
		
		int endpage = ((managerservice.membercount()) / 15)+1;
		int startpage=1;
		//3
		if (ck != null) {
			if (ck.equals("previous") & pageno > 5) {
				pageno = pageno - 5;
				startpage = pageno;
			} else if (ck.equals("next")) {
				pageno = pageno + 5;
				startpage = pageno;
			}
		} else {
			if ((pageno % 5) == 0 && pageno >=5) {
				startpage = pageno - 4;
			} else if ((pageno % 5) != 1 && pageno >=5) {
				startpage = (pageno - (pageno % 5));
			}else{
				startpage=pageno;

			}

			if(pageno <5){
				startpage = 1;			
			}
		}
		//0, 5
		
		endpage = endpage<startpage+5? endpage: startpage+5;

		System.out.println("페이지 : "+startpage+" , " +endpage );
		
		req.getSession().setAttribute("insertpage", "member.jsp");
		req.getSession().setAttribute("memlist", memlist);
		req.getSession().setAttribute("startpage", startpage);
		req.getSession().setAttribute("endpage", endpage);
		return "views/admin/manager";
	}

	@RequestMapping(value = "/upload.do", method = RequestMethod.POST)
	public String upload(FileUploadDTO fileInfo, HttpServletRequest req,Model model)
			throws Exception {
		MultipartFile[] files = fileInfo.getUpFile();
		String[] titles = fileInfo.getTitle();
		String[] saves = fileInfo.getSave();
		String[] gerne_ids = fileInfo.getGerne_id();
		String[] singer_ids = fileInfo.getSinger_id();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYYMMddhhmmss");
		String n2 = sdf.format(date.getTime());
		System.out.println("지금시각" + n2);
		if (null != files && files.length > 0) {
			for (int i = 0; i < files.length; i++) {
				String title = titles[i];
				String save = saves[i];
				String gerne_id = gerne_ids[i];
				String singer_id = singer_ids[i];

				managerservice.insert(n2, title, save, gerne_id, singer_id);

				MultipartFile file = files[i];
				String path = WebUtils.getRealPath(req.getSession()
						.getServletContext(), "/resources/music");
				System.out.println("path : "+path);
				String fileName = file.getOriginalFilename();
				managerservice.upload(file, path, title+".mp3");
				System.out.println(title + save + gerne_id + singer_id
						+ " : 업로드 성공 : " + i);
			}

		} else {
			System.out.println("으아아아아업로드 실패");
		}
		model.addAttribute("MusicHash",MusicStamp.getMusicHash());
		model.addAttribute("StampId",MusicStamp.getStampId());
		return "views/admin/manager";

	}

	/*
	 * @RequestMapping(value="/musiclist2.do",method=RequestMethod.GET) public
	 * String musiclist2(HttpServletRequest req){ List<MusicListDTO> musiclist=
	 * managerservice.getMusiclist(); req.getSession().setAttribute("musiclist",
	 * musiclist); req.getSession().setAttribute("insertpage", "musiclist.jsp");
	 * return "views/admin/manager";
	 * 
	 * }
	 */

	@RequestMapping(value = "/musiclist.do", method = RequestMethod.GET)
	public String musiclist(HttpServletRequest req, int pageno, String ck) {
		List<MusicListDTO> musiclist = managerservice.getMusiclist(pageno);
		pageno = pageno+1;

		System.out.println("페이지no : "+pageno+" , " +ck );
		
		int endpage = ((managerservice.musiccount()) / 20);
		int startpage=1;
		//3
		if (ck != null) {
			if (ck.equals("previous") & pageno > 5) {
				pageno = pageno - 5;
				startpage = pageno;
			} else if (ck.equals("next")) {
				pageno = pageno + 5;
				startpage = pageno;
			}
		} else {
			if ((pageno % 5) == 0) {
				startpage = pageno - 4;
			} else if ((pageno % 5) != 1) {
				startpage = (pageno - (pageno % 5));
			}else{
				startpage=pageno;
			}
		}
		//0, 5
		
		endpage = endpage<startpage+5? endpage: startpage+5;

		System.out.println("페이지 : "+startpage+" , " +endpage );
		
		req.getSession().setAttribute("musiclist", musiclist);
		req.getSession().setAttribute("startpage", startpage);
		req.getSession().setAttribute("endpage", endpage);
		req.getSession().setAttribute("insertpage", "musiclist.jsp");
		return "views/admin/manager";

	}

	@RequestMapping(value = "/memdelete.do", method = RequestMethod.GET)
	public String memdelte(@RequestParam String mem_id) {
		service.delete(mem_id);
		System.out.println(mem_id + "삭제성공");

		return "redirect:/memberlist.do";

	}

}
