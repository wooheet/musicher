package musicher.manager.dto;

import org.springframework.data.repository.PagingAndSortingRepository;

public interface MusicRepository extends
				PagingAndSortingRepository<MusicListDTO, String>{

}
