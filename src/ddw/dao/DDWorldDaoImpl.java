package ddw.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import ddw.util.SqlMapClientFactory;
import ddw.vo.DdVO;
import ddw.vo.FaqVO;
import ddw.vo.FaqreVO;
import ddw.vo.MainVO;
import ddw.vo.MemberVO;
import ddw.vo.NoticeVO;
import ddw.vo.OneVO;
import ddw.vo.PhotoVO;
import ddw.vo.PhotoreVO;
import ddw.vo.SkinVO;
import ddw.vo.VisitVO;

public class DDWorldDaoImpl implements IDDWorldDao {

	private static DDWorldDaoImpl dao;
	
	private SqlMapClient client;
	
	private DDWorldDaoImpl() {
		client = SqlMapClientFactory.getSqlmapClient();
	}

	public static IDDWorldDao getInstance() {
		if(dao == null) dao = new DDWorldDaoImpl();
		return dao;
	}
	
	
	@Override/* 로그인 쿼리 */
	public MemberVO login(MemberVO vo) {
		
		MemberVO memberVo = null;
		
		try {
			memberVo = (MemberVO) client.queryForObject("member.login", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return memberVo;
	}

	@Override/* (임시)공지사항 전체 출력-검색미포함 */
	public List<NoticeVO> selectAllNotice() {
		
		List<NoticeVO> list = null;
		
		try {
			list = client.queryForList("board.selectAllNotice");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override/* (임시)공지사항 상세 출력 */
	public NoticeVO selectOneNotice(int notice_num) {
		
		NoticeVO vo = null;
		
		try {
			vo = (NoticeVO) client.queryForObject("board.selectOneNotice", notice_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}
	
	//id 중복검사
	@Override
	public String selectById(String id) {
		String resid = null;
		
		try {
			resid = (String) client.queryForObject("member.selectById", id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return resid;
	}
	
	//회원가입 저장
	@Override
	public String insertMember(MemberVO vo) {
		String memID = null;
		
		try {
			memID = (String) client.insert("member.insertMember", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memID;
	}
	
	//가입시 미니홈피 생성
	@Override
	public int insertMiniHompi(String id) {
		int cnt = 0;
		try {
			Object obj = client.insert("member.insertMiniHompi", id);
			if(obj==null) {
				cnt = 1;
			}
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override/* 회원 id로 미니홈피 데이터 불러오기 */
	public DdVO selectOneDD(String mem_id) {
		
		DdVO vo = null;
		
		try {
			vo = (DdVO) client.queryForObject("ddworld.selectOneDD", mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	@Override/* 회원 id로 일촌리스트 불러오기 */
	public List<OneVO> selectAllOne(String mem_id) {
		
		List<OneVO> list = null;
		
		try {
			list = client.queryForList("ddworld.selectAllOne", mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override/* 방문자 수 불러오기 */
	public VisitVO countVisit(String mem_id) {
		
		VisitVO vo = null;
		
		try {
			vo = (VisitVO) client.queryForObject("ddworld.countVisit", mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	@Override/* 방문기록 인서트 하기 */
	public void insertVisit(String mem_id) {
		try {
			client.insert("ddworld.insertVisit", mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	//메인관련----------------------------------------------
	
	@Override/* 모든 미니홈피 리스트 불러오기(검색없음) */
	public List<DdVO> selectAllDD() {
		
		List<DdVO> list = null;
		
		try {
			list = client.queryForList("ddworld.selectAllDD");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override/* 로그인 후 내정보와 홈피 통합 조회 */
	public MainVO myAllData(String mem_id) {
		
		MainVO vo = null;
		
		try {
			vo = (MainVO) client.queryForObject("member.myAllData", mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	@Override/* 공지사항 */
	public void insertNotice(NoticeVO vo) {
		try {
			client.insert("board.insertNotice", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	

	@Override /* 공지사항 : 글 수정하기 */
	public int updateNotice(NoticeVO vo) {
		int cnt =0;
		
		try { 
		cnt = client.update("board.updatenotice",vo);	
			
	   } catch (SQLException e) {
		e.printStackTrace();
	   } 
		
	     return cnt;
       }






	@Override/* 사진첩 리스트 불러오기 */
	public List<PhotoVO> selectAllPhoto(String dd_add) {
		
		List<PhotoVO> list = null;
		
		try {
			list = client.queryForList("minihome.selectAllPhoto", dd_add);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override /* 사진첩: 댓글 리스트 */
	public List<PhotoreVO> selectReList(int photo_no) {
		List<PhotoreVO> reList = null;
		try {
			reList = client.queryForList("minihome.selectReList", photo_no);
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return reList;
	}

	@Override	/* 사진첩: 댓글 작성  : 회원만*/
	public int photoinsertreply(PhotoreVO vo) {
		int cnt = 0; 		
		try {
			Object obj  = client.insert("minihome.photoinsertreply", vo);
		if(obj==null) {
			cnt = 1;
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		   return cnt;
		}

	
	//-----------회원정보수정관련---------------------
	
	@Override //나의 회원정보 보여주기
	public List<MemberVO> myinfo(String mem_id) {
		
		List<MemberVO> myinfo = null; 
		
		try {
			myinfo = client.queryForList("member.myinfo",mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		   return myinfo;
	}

	@Override //나의 회원정보 탈퇴하기 > 비회원으로변경
	public int myinfodelete(MemberVO vo) {
		int cnt = 0;
		try {			
			cnt = client.update("member.myinfodelete",vo);
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		} 
		return cnt;
	}

	@Override // 나의회원정보 : 비회원으로 변경 후 미니홈페이지 삭제
	public int myminihomedelete(String memId) {
		int cnt = 0;
		try {			
			cnt = client.delete("member.myminihomedelete", memId);
			
		}catch(SQLException e){
			cnt = 0;
			e.printStackTrace();
		} 
		
		return cnt;
	}

	@Override/* 사진첩 추가하기 */
	public void insertPhoto(PhotoVO vo) {
		try {
			client.insert("minihome.insertPhoto", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override /* 문의게시판 목록 : 문의게시판 전체 리스트 보여주기 */
	public List<FaqVO> faqlist() {			
		List<FaqVO> faqlist = null;
			try {
				faqlist = client.queryForList("board.selectAllFaq");
			} catch (SQLException e) {
				e.printStackTrace();
			}			
			return faqlist;
		
	}

	@Override /* 문의게시판 : 제목 클릭해서 상세화면 보여주기 */
	public FaqVO selectonefaq(int faq_num) {
		FaqVO faqone = null;
		
		try {
			faqone = (FaqVO) client.queryForObject("board.selectonefaq",faq_num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return faqone;
	}

	@Override /* 문의게시판 : 글 작성하기 */
	public int insertfaq(FaqVO vo) {
		int cnt = 0; 		
		try {
			Object obj  = client.insert("board.insertfaq", vo);
		if(obj==null) {
			cnt = 1;
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		   return cnt;
		}
	
	@Override /*문의게시판 : 글 수정하기*/
	public int updatefaq(FaqVO vo) {
		int cnt =0;
		
		try { 
		cnt = client.update("board.updatefaq",vo);	
			
	   } catch (SQLException e) {
		e.printStackTrace();
	   } 
		
	     return cnt;
       }

	
	@Override /* 문의게시판 : 댓글 작성 */
	public int insertfaqreply(FaqreVO vo) {
		int cnt = 0; 		
		try {
			Object obj  = client.insert("board.insertfaqreply", vo);
		if(obj==null) {
			cnt = 1;
		}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		   return cnt;
		}


	@Override /* 문의게시판 : 댓글 리스트 */
	public List<FaqreVO> faqreplylist(int faq_num) {
		List<FaqreVO> list = null;
		
		try {
			list = client.queryForList("board.selectfaqreply", faq_num);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public String checkOne(OneVO vo) {
		String status = null;

		try {
			status = (String) client.queryForObject("member.checkOne", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public int insertRequestOne(OneVO vo) {
		int result = 1;	//무조건 성공으로 전제한다. 
		
		try {
			client.insert("member.insertRequestOne", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<OneVO> selectCurrOne(String mem_id) {
		List<OneVO> list = null;
		
		try {
			list = client.queryForList("ddworld.selectCurrOne", mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}



	@Override /* 회원관리 : 회원  조회하기 */
	public List<MemberVO> adminmemberview() {
		List<MemberVO> memberview = null;  // 가져온 데이터가 저장될 List객체 변수 선언		
		try {
			memberview = client.queryForList("member.adminmemberview");

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return memberview;
	}
	
	@Override /* 회원관리 : 비회원  조회하기 */
	public List<MemberVO> adminmemberview1() {
		List<MemberVO> memberview1 = null;  // 가져온 데이터가 저장될 List객체 변수 선언		
		try {
			memberview1 = client.queryForList("member.adminmemberview1");

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return memberview1;
	}

	@Override /* 회원관리 : 관리자  조회하기 */
	public List<MemberVO> adminmemberview2() {
		List<MemberVO> memberview2 = null;  // 가져온 데이터가 저장될 List객체 변수 선언		
		try {
			memberview2 = client.queryForList("member.adminmemberview2");

		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return memberview2;
	}

	@Override/* 스킨, 에지칼라, 메뉴칼라 변경 */
	public void updateDDColor(DdVO vo) {
		try {
			client.update("ddworld.updateDDColor", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override/* 일촌 신청 수락 */
	public void acceptOne(OneVO vo) {
		try {
			client.update("member.acceptOne", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override/* 일촌 신청 거절 */
	public void denialOne(OneVO vo) {
		try {
			client.update("member.denialOne", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override/* 일촌 신청 취소 */
	public void cancelOne(OneVO vo) {
		try {
			client.update("member.cancelOne", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	@Override/* 일촌 신청 수락시 행추가 */
	public void insertAcceptOne(OneVO vo) {
		try {
			client.insert("member.insertAcceptOne", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<OneVO> selectCurr2One(String mem_id) {
		List<OneVO> list = null;
		
		try {
			list = client.queryForList("ddworld.selectCurr2One", mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateOneCon(OneVO vo) {
		try {
			client.update("ddworld.updateOneCon", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override/* 미니홈피 주인의 스킨 리스트 */
	public List<SkinVO> selectSkinById(String mem_id) {
		List<SkinVO> list = null;
		
		try {
			list = client.queryForList("ddworld.selectSkinById", mem_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override/* 나의회원정보 : 비회원으로 변경 후 일촌관계 삭제*/
	public void myonedelete(String memId) {
		try {			
			client.delete("member.myonedelete", memId);
			
		}catch(SQLException e){
			e.printStackTrace();
		} 
	}

	@Override
	public MemberVO findId(MemberVO vo) {
		MemberVO find = null;
		
		try {
			find = (MemberVO) client.queryForObject("member.selectId", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return find;
	}

	@Override
	public MemberVO findPw(MemberVO vo) {
		MemberVO find = null;
		
		try {
			find = (MemberVO) client.queryForObject("member.selectPw", vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return find;
	}

	@Override
	public void setNullOneCon(OneVO vo) {
		try {
			client.update("ddworld.setNullOneCon", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override/* 미니홈 주변 메인 변경*/
	public void updateDDMain(DdVO vo) {
		try {
			client.update("ddworld.updateDDMain", vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}



	 




}
