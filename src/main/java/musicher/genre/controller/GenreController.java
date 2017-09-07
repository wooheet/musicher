package musicher.genre.controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;

import musicher.genre.dto.genreDTO;
import musicher.genre.service.genreService;
import musicher.manager.dto.MusicListDTO;
import musicher.manager.dto.MusicRepository;
import musicher.member.dto.memberDTO;
import musicher.member.service.memberService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GenreController {

	@Autowired
	genreService grservice;
	@Autowired
	MusicRepository repository;
	
	@PersistenceContext
	EntityManager entityManager;
	
	@RequestMapping("/test.do")
	public String test(Model model,@RequestParam String high,@RequestParam int pageno ,HttpServletRequest req,  String ck){
		System.out.println(grservice.genreList(high));
		genreDTO gr = grservice.genre_id(high);
		
		List<genreDTO> grlist = grservice.genreList(high);
		String view = "";
		if(grlist!=null && grlist.size()!=0){
			model.addAttribute("gr",gr);
			model.addAttribute("grlist",grlist);
			view =  "views/genre_maintest";
		}
		else{
			
			CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
			
			CriteriaQuery<MusicListDTO> criteriaQuery = criteriaBuilder.createQuery(MusicListDTO.class);

			
			Root<MusicListDTO> root = criteriaQuery.from(MusicListDTO.class);

			Predicate restrictions = criteriaBuilder.like(root.<String>get("genre_id"),"%"+high+"%");
			//Predicate restrictions = criteriaBuilder.equal(root.get("genre_id"), high);

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
			model.addAttribute("high",high);
			//view =  "views/genre_musiclist";
			view =  "views/searchMusic_list";
		}
		return view;
	}
	
	
		@RequestMapping("/genrelist.do")
	public String genre(Model model,@RequestParam String high,@RequestParam int pageno ,HttpServletRequest req,  String ck){
	
			CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
			
			CriteriaQuery<MusicListDTO> criteriaQuery = criteriaBuilder.createQuery(MusicListDTO.class);

			Root<MusicListDTO> root = criteriaQuery.from(MusicListDTO.class);

			Predicate restrictions = criteriaBuilder.equal(root.get("genre_id"),"%"+high+"%");

			criteriaQuery.where(restrictions);

			TypedQuery<MusicListDTO> musicListQuery = entityManager.createQuery(criteriaQuery).setFirstResult(pageno).setMaxResults(20);
			
			//entityManager.createQuery(criteriaQuery).getMaxResults();
			
			List<MusicListDTO> musiclist = musicListQuery.getResultList();
		
			pageno = pageno+1;

			System.out.println("페이지no : "+pageno+" , " +ck );
			
			TypedQuery<MusicListDTO> TotalmusicListQuery = entityManager.createQuery(criteriaQuery);
			List<MusicListDTO> totalmusiclist = TotalmusicListQuery.getResultList();
			
			
			int endpage = (totalmusiclist.size() / 20)+1;
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
				if(pageno<5){
					startpage=1;
				}
			}
			
			endpage = endpage<startpage+5? endpage: startpage+5;

			req.getSession().setAttribute("musiclist", musiclist);
			req.getSession().setAttribute("startpage", startpage);
			req.getSession().setAttribute("endpage", endpage);
			
			
		
		//return "views/genre_musiclist";
			return "views/searchMusic_list";
	}
		
		
		
	
	
	
	
}