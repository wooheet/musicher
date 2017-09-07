package main;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;

import musicher.manager.dto.MusicListDTO;
import musicher.manager.dto.MusicRepository;
import musicher.music.dto.mylistDTO;
import musicher.music.service.musicService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IndexController{
	
	
	@Autowired
	MusicRepository repository;
	
	@PersistenceContext
	EntityManager entityManager;
	
	@Autowired
	musicService musicservice;
	
	@RequestMapping("/index.do")
	public String main(){

		return "index";
	}
	@RequestMapping("/genre.do")
	public String genre(){

		return "views/genre_main";
		//return "genre";
	}
	
	@RequestMapping(value="/MyMusic.do",method=RequestMethod.GET)
	public String MyMusic(String mem_id, Model model){
		
		
		System.out.println(mem_id);
	
		List<mylistDTO> mymusiclist = musicservice.mymusicList(mem_id);
		System.out.println(mymusiclist.toString());
		model.addAttribute("mymusiclist",mymusiclist);
		return "views/MyMusicList";
	}
	

	
	
	
		@RequestMapping("/recommand.do")
	public String recommand(){
		return "views/Recommand";
	}
		
		@RequestMapping("/paypay.do")
		public String nicepay(){
			return "views/payRequest_utf";
		}
	
	@RequestMapping("/payment.do")
	public String payment(){
		return "views/payment";
	}
	
	
	@RequestMapping("/login.do")
	public String login(){
			System.out.println("로그인");
		return "index";
	}
	@RequestMapping("/pay.do")
	public String pay(){
		return "views/payRequest";
	}
	
	/*@RequestMapping("/signup.do")
	public String signup(){
			System.out.println("회원가입");
			
		return "views/signup";
	}*/
	
	@RequestMapping("/genre_detail.do")
	public String genre_detail(){
			
			
		return "views/genre_detail";
	}
	
	@RequestMapping("/search.do")
	public String search(Model model,String input_group,HttpServletRequest req, String search){
		
		CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
		
		CriteriaQuery<MusicListDTO> criteriaQuery = criteriaBuilder.createQuery(MusicListDTO.class);

		
		Root<MusicListDTO> root = criteriaQuery.from(MusicListDTO.class);

		System.out.println(input_group+"  :   "+search);
		Predicate restrictions = criteriaBuilder.like(root.<String>get(input_group),"%"+search+"%");
	

		criteriaQuery.where(restrictions);

		TypedQuery<MusicListDTO> musicListQuery = entityManager.createQuery(criteriaQuery).setFirstResult(0).setMaxResults(10);
		TypedQuery<MusicListDTO> TotalmusicListQuery = entityManager.createQuery(criteriaQuery);
		List<MusicListDTO> totalmusiclist = TotalmusicListQuery.getResultList();
		
		List<MusicListDTO> musiclist = musicListQuery.getResultList();
		System.out.println("검색 뮤직수"+totalmusiclist.size());


		int endpage = (totalmusiclist.size() / 20);
		int startpage=1;
		//3
	
		
		endpage = endpage<startpage+5? endpage: startpage+5;

		req.getSession().setAttribute("musiclist", musiclist);
		req.getSession().setAttribute("startpage", startpage);
		req.getSession().setAttribute("endpage", endpage);
		
		model.addAttribute("musiclist",musiclist);
		model.addAttribute("high",search);
		
		
	
	//return "views/genre_musiclist";
		return "views/searchMusic_list";
	}
	
	
	
}
