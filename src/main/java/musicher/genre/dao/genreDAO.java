package musicher.genre.dao;

import java.util.List;

import musicher.genre.dto.genreDTO;
import musicher.member.dto.memberDTO;

public interface genreDAO {


	public List<genreDTO> genreList(String high);

public genreDTO  genre_id(String genre_id);
}
