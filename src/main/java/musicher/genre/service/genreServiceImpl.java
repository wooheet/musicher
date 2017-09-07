package musicher.genre.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import musicher.genre.dao.genreDAO;
import musicher.genre.dto.genreDTO;
import musicher.member.dao.memberDAO;
import musicher.member.dto.memberDTO;
@Service("gerneService")
public class genreServiceImpl implements genreService {
	@Autowired
	@Qualifier("genredao")
	genreDAO genredao;

	@Override
	public List<genreDTO> genreList(String high) {
		return genredao.genreList(high);
	}
	@Override
	public genreDTO  genre_id(String genre_id) {
		return genredao.genre_id(genre_id);
	}
}
