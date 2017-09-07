package musicher.member.dto;



import org.springframework.data.repository.PagingAndSortingRepository;



public interface MemberRepository extends
				PagingAndSortingRepository<memberDTO, String>{
}