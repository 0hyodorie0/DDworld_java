package ddw.dao;

import java.util.List;

import ddw.vo.DiaryVO;
import ddw.vo.DiaryreVO;
import ddw.vo.GbookVO;
import ddw.vo.MiniVO;
import ddw.vo.ProfileVO;

public interface MiniHomeDao {
	
    
	//나의미니홈페이지:프로필메뉴:처음보여지는 프로필내용
	public ProfileVO homeprofileselect(String dd_add);
	
    //나의미니홈페이지:프로필메뉴:프로필작성&수정
	public int myprofilemerge(ProfileVO vo);
	
	//나의미니홈페이지:방명록메뉴:방명록작성
	public void insertGbook(GbookVO vo);
	
	//나의미니홈페이지:방명록메뉴:방명록내용읽기
	public List<GbookVO> selectgbook(String dd_add);
	
	//나의미니홈페이지:방명록메뉴:방명록수정
	
	//나의미니홈페이지:방명록메뉴:방명록삭제
	
	//다이어리 목록
	public List<DiaryVO> selectDiary(DiaryVO vo);
	
	//다이어리  버튼 생성
	public List<Integer> inputbtnDay(DiaryVO vo);
	
	//다이어리 저장
	public int insertDiary(DiaryVO vo);
	
	//다이어리 수정
	public int updateDiary(DiaryVO vo);
	
	//다이어리 삭제
	public int deleteDiary(int no);

	//다이어리 리플 목록
	public List<DiaryreVO> selectDiaryRe(int no);
	
	//다이어리 리플 등록
	public int insertDiaryRe(DiaryreVO vo);
	
	//다이어리 리플 삭제
	public int deleteDiaryRe(int no);
	
	//미니룸 출력
	public List<MiniVO> miniSelect(MiniVO vo);
	
	//미니룸 위치수정
	public int updateMiniroom(MiniVO vo);
	
	//미니룸 템수정
	public int updateSetMiniroom(MiniVO vo);
	
}
