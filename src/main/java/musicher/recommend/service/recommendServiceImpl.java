package musicher.recommend.service;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.kitri.bigdataShop.recommend.PrdReviewDTO;
import musicher.member.dto.memberDTO;
import musicher.member.service.memberService;
import musicher.recommend.dao.recommendDAO;
import musicher.recommend.dto.recommendDTO;
import musicher.recommend.dto.recommendReviewDTO;

import org.apache.mahout.cf.taste.common.Weighting;
import org.apache.mahout.cf.taste.impl.model.file.FileDataModel;
import org.apache.mahout.cf.taste.impl.neighborhood.NearestNUserNeighborhood;
import org.apache.mahout.cf.taste.impl.recommender.CachingRecommender;
import org.apache.mahout.cf.taste.impl.recommender.GenericUserBasedRecommender;
import org.apache.mahout.cf.taste.impl.similarity.AveragingPreferenceInferrer;
import org.apache.mahout.cf.taste.impl.similarity.PearsonCorrelationSimilarity;
import org.apache.mahout.cf.taste.model.DataModel;
import org.apache.mahout.cf.taste.neighborhood.UserNeighborhood;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import org.apache.mahout.cf.taste.recommender.Recommender;
import org.apache.mahout.cf.taste.similarity.UserSimilarity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("recommendService")
public class recommendServiceImpl implements recommendService {
	@Autowired
	@Qualifier("recommenddao")
	recommendDAO recommenddao;
	@Autowired
	memberService service;
	@Autowired
	memberDTO loginUser;

	@Override
	public void insert(recommendDTO recommend) {
		recommenddao.insert(recommend);
		
	}

	@Override
	public int isNull(String userID, String musicID) {
		return recommenddao.isNull(userID, musicID);
	}

	@Override
	public void update(recommendDTO recommend) {
		recommenddao.update(recommend);
		
	}

	@Override
	public recommendDTO clickNum(String userID, String musicID) {
		return recommenddao.clickNum(userID, musicID);
	}

	@Override
	public long[] getUsers(String path, HttpServletRequest req) throws Exception {
		memberDTO checkUser = service.login(loginUser.getMem_id(),
				loginUser.getPass());
		String user = (String) req.getSession().getAttribute("loginUser");
		
		long userId = user.hashCode();
		DataModel dataModel = new FileDataModel(new File("musicrecommend.csv"));
		UserSimilarity userSimilarity = new PearsonCorrelationSimilarity(
				dataModel, Weighting.WEIGHTED);
		userSimilarity.setPreferenceInferrer(new AveragingPreferenceInferrer(
				dataModel));
		UserNeighborhood neighberhood = new NearestNUserNeighborhood(3,
				userSimilarity, dataModel);

		long[] users = neighberhood.getUserNeighborhood(userId);
		System.out.println("===========================================");
		System.out.println(userId + "의 취향 저격수 3명은?");
		System.out.println("-------------------------------------------");
		for (int i = 0; i < users.length; i++) {
			System.out.println("가까운 이웃 :" + users[i]);
		}
		System.out.println("-------------------------------------------");
		System.out.println();
		// 3) 사용자 기준의 추천
		Recommender recommender = new GenericUserBasedRecommender(dataModel,
				neighberhood, userSimilarity);
		// 3.1) 캐시에 넣고
		Recommender cachingRecommender = new CachingRecommender(recommender);
		// 3.2) 특정 사용자 기준의 추천 아이템 추출
		List<RecommendedItem> recommendations = cachingRecommender.recommend(
				userId, 3);

		// 추천 아이템 출력!!!
		System.out.println("==========================================");
		System.out.println(userId + "님이 추천하는 음악 베스트 7 [User-based]");
		System.out.println("-------------------------------------------");
		int count = 1;
		for (RecommendedItem item : recommendations) {
			System.out.println(count + ") 추천 상품 : " + item.getItemID()
					+ " \t 추천 지수 : " + item.getValue());
			count++;
		}
		System.out.println("-------------------------------------------");
		return users;
	}

	@Override
	public void makedata(String path, String mem_id) {
		FileWriter pw = null;
		// review테이블의 insert할 데이터를 조회한다.
		try {
			List<recommendReviewDTO> reviewlist = dao.finddata();
			System.out.println("service:" + reviewlist);
			int size = reviewlist.size();
			pw = new FileWriter(path + "\\test.csv");
			System.out.println(path + "\\test.csv");
			recommendReviewDTO line = null;
			for (int i = 0; i < size; i++) {
				line = reviewlist.get(i);
				pw.write(line.getMem_id().hashCode() + ","
						+ line.getPrd_no().hashCode() + "," + line.getScore()
						+ "\n");
			}
			//getUsers(path);
			long[] users = getUsers(path);
			HashSet<String> ids = new HashSet<String>();
			for (int row = 0; row < users.length; row++) {
				for (int i = 0; i < size; i++) {
					line = reviewlist.get(i);
					if (users[row] == line.getHash_id()) {
						ids.add(line.getMem_id());
					}
				}
			}
			System.out.println(ids);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (pw != null)
					pw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
