package musicher.music.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import musicher.music.dto.mylistDTO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository("musicdao")
public class musicDAOImpl implements musicDAO {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<mylistDTO> mymusicList(String mem_id) {
		return sqlSession.selectList("musicher.music.dto.mymusiclist",mem_id);
	}
	public void delmymusic(String music_id,String mem_id){
		Map<String, String> map = new HashMap<String, String>();
		map.put("music_id", music_id);
		map.put("mem_id",mem_id);
		sqlSession.selectOne("musicher.music.dto.deletemymusic", map);
	}
	public void insertmymusic(String music_id,String mem_id){
		Map<String, String> map = new HashMap<String, String>();
		map.put("music_id", music_id);
		map.put("mem_id",mem_id);
		SimpleDateFormat yyMMddHHmmss = new SimpleDateFormat("yyMMddHHmmss");
		map.put("playlist_id",yyMMddHHmmss.format(new Date()));
		sqlSession.selectOne("musicher.music.dto.insertmymusic", map);
	}
	public void multiInsert(String playlist_id,String music_id,String mem_id){
		Map<String, String> map = new HashMap<String, String>();
		map.put("music_id", music_id);
		map.put("mem_id",mem_id);
		map.put("playlist_id",playlist_id);
		sqlSession.selectOne("musicher.music.dto.insertmymusic", map);
	}
	/*public void multiInsert(String checkVals, String mem_id){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("checkVals", checkVals.split(","));
		int num =checkVals.split(",").length;
		map.put("mem_id",mem_id);
		SimpleDateFormat yyMMddHHmmss = new SimpleDateFormat("yyMMddHHmmss");
		int firstPlayId = Integer.parseInt(yyMMddHHmmss.format(new Date()));
		String[] playlistIds = null;
		int startnum=0;
		for(int i=firstPlayId; i<num+firstPlayId; i++){
			playlistIds[startnum] = String.valueOf(i);
		}
		map.put("playlist_id",playlistIds);
		sqlSession.selectOne("musicher.music.dto.insertmymusic", map);
	}*/
	
}
