package ddw.service;

import java.util.List;

import ddw.dao.MiniHomeDao;
import ddw.dao.MiniHomeDaoImpl;
import ddw.vo.DiaryVO;
import ddw.vo.DiaryreVO;
import ddw.vo.GbookVO;
import ddw.vo.MiniVO;
import ddw.vo.ProfileVO;

public class MiniHomeServiceImpl implements  MiniHomeService{

	 private MiniHomeDao dao;
	 private static MiniHomeServiceImpl service;
	 
	 private MiniHomeServiceImpl() {
		 dao = MiniHomeDaoImpl.getInstance();
	}
	
	public static MiniHomeServiceImpl getInstance() {
		if (service==null) service = new MiniHomeServiceImpl();
	    return service;
	}	
	
	@Override	//나의미니홈페이지:프로필메뉴:처음보여지는 프로필내용
	public ProfileVO homeprofileselect(String dd_add) {
		return dao.homeprofileselect(dd_add);
	}
	

	@Override  //나의미니홈페이지:프로필메뉴:프로필작성&수정
	public int myprofilemerge(ProfileVO vo) {
		return dao.myprofilemerge(vo);
	}
	
	@Override
	public void insertgbook(GbookVO vo) {
		dao.insertGbook(vo);
	}


	@Override//나의미니홈페이지:방명록메뉴:방명록내용읽기
	public List<GbookVO> selectgbook(String dd_add) {
		return dao.selectgbook(dd_add);
	}

	@Override
	public List<DiaryVO> selectDiary(DiaryVO vo) {
		return dao.selectDiary(vo);
	}

	@Override
	public List<Integer> inputbtnDay(DiaryVO vo) {
		return dao.inputbtnDay(vo);
	}

	@Override
	public int insertDiary(DiaryVO vo) {
		return dao.insertDiary(vo);
	}

	@Override
	public int updateDiary(DiaryVO vo) {
		return dao.updateDiary(vo);
	}

	@Override
	public int deleteDiary(int no) {
		return dao.deleteDiary(no);
	}

	@Override
	public List<DiaryreVO> selectDiaryRe(int no) {
		return dao.selectDiaryRe(no);
	}

	@Override
	public int insertDiaryRe(DiaryreVO vo) {
		return dao.insertDiaryRe(vo);
	}

	@Override
	public int deleteDiaryRe(int no) {
		return dao.deleteDiaryRe(no);
	}

	@Override
	public List<MiniVO> miniSelect(MiniVO vo) {
		return dao.miniSelect(vo);
	}

	@Override
	public int updateMiniroom(MiniVO vo) {
		return dao.updateMiniroom(vo);
	}

	@Override
	public int updateSetMiniroom(MiniVO vo) {
		return dao.updateSetMiniroom(vo);
	}

	@Override
	public int insertprodMem(MiniVO vo) {
		return dao.insertprodMem(vo);
	}

	@Override
	public int countMiniprod(String pnum) {
		return dao.countMiniprod(pnum);
	}





}
