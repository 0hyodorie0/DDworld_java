package ddw.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ddw.util.SqlMapClientFactory;
import ddw.vo.DiaryVO;
import ddw.vo.DiaryreVO;
import ddw.vo.GbookVO;
import ddw.vo.MemberVO;
import ddw.vo.MiniVO;
import ddw.vo.ProfileVO;
import sun.security.jca.GetInstance;

public class MiniHomeDaoImpl implements MiniHomeDao {

	
	private static  MiniHomeDaoImpl dao;
	private SqlMapClient smc;
	
	private MiniHomeDaoImpl() {
		smc = SqlMapClientFactory.getSqlmapClient();
	}
	
	public static MiniHomeDaoImpl getInstance() {
		if (dao==null) dao = new MiniHomeDaoImpl();
      
		return dao;
	}
	
	
	@Override //나의미니홈페이지:프로필메뉴:처음보여지는 프로필내용
	public ProfileVO homeprofileselect(String dd_add) {
		ProfileVO profilevo = null;
		
		try {
			profilevo = (ProfileVO)smc.queryForObject("minihome.selectmyprofile",dd_add);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return profilevo;
	}
	

	@Override //나의미니홈페이지:프로필메뉴:프로필작성&수정
	public int myprofilemerge(ProfileVO vo) {
		int cnt = 0;
		try {			
			cnt = smc.update("minihome.myprofilemerge", vo);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return cnt;
	}


	


	@Override
	public void insertGbook(GbookVO vo) {
		try {
			smc.insert("minihome.insertGbook", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}



	@Override//나의미니홈페이지:방명록메뉴:방명록내용읽기
	public List<GbookVO> selectgbook(String dd_add) {
		List<GbookVO> list = null;
		
		try {
			list = smc.queryForList("minihome.selectgbook", dd_add);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//다이어리 목록
	@Override
	public List<DiaryVO> selectDiary(DiaryVO vo) {
		List<DiaryVO> list = null;
		
		try {
			list = smc.queryForList("minihome.selectDiary",vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Integer> inputbtnDay(DiaryVO vo) {
		List<Integer> list = null;
		
		try {
			list = smc.queryForList("minihome.inputbtnDay",vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertDiary(DiaryVO vo) {
		int cnt = 0;
		try {
			Object obj = smc.insert("minihome.insertDiary", vo);
			if(obj==null) {
				cnt = 1;
			}
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateDiary(DiaryVO vo) {
		int cnt = 0;
		try {
			Object obj = smc.update("minihome.updateDiary", vo);
			if(obj==null) {
				cnt = 1;
			}
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteDiary(int no) {
		int cnt = 0;
		try {
			cnt = smc.delete("minihome.deleteDiary", no);
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		} 
		return cnt;
	}

	@Override
	public List<DiaryreVO> selectDiaryRe(int no) {
		List<DiaryreVO> list = null;
		
		try {
			list = smc.queryForList("minihome.selectDiaryRe",no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insertDiaryRe(DiaryreVO vo) {
		int cnt = 0;
		try {
			Object obj = smc.insert("minihome.insertDiaryRe", vo);
			if(obj==null) {
				cnt = 1;
			}
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int deleteDiaryRe(int no) {
		int cnt = 0;
		try {
			cnt = smc.delete("minihome.deleteDiaryRe", no);
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		} 
		return cnt;
	}

	@Override
	public List<MiniVO> miniSelect(MiniVO vo) {
		List<MiniVO> list = null;
		
		try {
			list = smc.queryForList("minihome.miniSelect",vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int updateMiniroom(MiniVO vo) {
		int cnt = 0;
		try {
			Object obj = smc.update("minihome.updateMiniroom", vo);
			if(obj==null) {
				cnt = 1;
			}
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int updateSetMiniroom(MiniVO vo) {
		int cnt = 0;
		try {
			Object obj = smc.update("minihome.updateSetMiniroom", vo);
			if(obj==null) {
				cnt = 1;
			}
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}
}
