package musicher.genre.service;

import java.util.List;

import musicher.genre.dto.genreDTO;
import musicher.member.dto.memberDTO;

public interface genreService {
	public List<genreDTO> genreList(String high);
	public genreDTO  genre_id(String genre_id);
}	
