package ddw.service;

import java.util.List;

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

public interface IDDWorldService {

	
	/* 로그인 쿼리 */
	public MemberVO login(MemberVO vo);
	
	/* 로그인 후 내정보와 홈피 통합 조회 */
	public MainVO myAllData(String mem_id);
	
	//id 중복검사
	public String selectById(String id);
	
	//아이디 찾기
	public MemberVO findId(MemberVO vo);
	
	//비번 찾기
	public MemberVO findPw(MemberVO vo);

	//회원가입 저장
	public String insertMember(MemberVO vo);
	
	//가입시 미니홈피 생성
	public int insertMiniHompi(String id);
	//공지사항------------------------------------------
	
	/* (임시)공지사항 전체 출력-검색미포함 */
	public List<NoticeVO> selectAllNotice();
	
	/* (임시)공지사항 상세 출력 */
	public NoticeVO selectOneNotice(int notice_num);
	
	
	//메인 관련------------------------------------------
	
	/* 모든 미니홈피 리스트 불러오기(검색없음) */
	public List<DdVO> selectAllDD();
	
	/* 일촌 검사 */
	public String checkOne(OneVO vo);
	
	/* 일촌 신청 인서트 */
	public int insertRequestOne(OneVO vo);
	
	/* 일촌 요청 리스트 불러오기(검색없음) */
	public List<OneVO> selectCurrOne(String mem_id);
	public List<OneVO> selectCurr2One(String mem_id);
	
	/* 일촌 신청 수락 */
	public void acceptOne(OneVO vo);
	/* 일촌 신청 수락시 행추가 */
	public void insertAcceptOne(OneVO vo);
	
	/* 일촌 신청 거절 */
	public void denialOne(OneVO vo);
	/* 일촌 신청 취소 */
	public void cancelOne(OneVO vo);
	
	/* 스킨, 에지칼라, 메뉴칼라 변경 */
	public void updateDDColor(DdVO vo);
	
	/* 미니홈 주변 메인 변경*/
	public void updateDDMain(DdVO vo);
	
	/* 일촌평 삭제 */
	public void setNullOneCon(OneVO vo);
	
	
	
	//공지사항 관련----------------------------------------------------
	
	/* 공지사항 */
	public void insertNotice(NoticeVO vo);
	
	/* 공지사항 : 글 수정하기 */
	public int updateNotice(NoticeVO vo);
	
	
	
	//미니홈피 관련------------------------------------------
	
	/* 회원 id로 미니홈피 데이터 불러오기 */
	public DdVO selectOneDD(String mem_id);
	
	/* 회원 id로 일촌리스트 불러오기 */
	public List<OneVO> selectAllOne(String mem_id);
	
	/* 방문자 수 불러오기 */
	public VisitVO countVisit(String mem_id);
	
	/* 방문기록 인서트 하기 */
	public void insertVisit(String mem_id);
	
	//[미니홈피 사진첩]-------------------------------------------
	/* 사진첩 리스트 불러오기 */
	public List<PhotoVO> selectAllPhoto(String dd_add);
	
	/* 사진첩 추가하기 */
	public void insertPhoto(PhotoVO vo);	
	
	/* 사진첩: 댓글 작성  : 회원만*/
	public int photoinsertreply(PhotoreVO vo);
	
	
	
	
	//회원정보수정 관련-------------------------------------------------
	
	/* 나의 회원정보  보여주기*/
	public List<MemberVO>  myinfo(String mem_id);
	
	/* 나의회원정보 : 탈퇴버튼 : 회원타입 '비회원;으로 변경*/
	public int myinfodelete(MemberVO vo);
	
	/* 나의회원정보 : 비회원으로 변경 후 미니홈페이지 삭제*/	
	public int myminihomedelete (String memId);
	
	/* 나의회원정보 : 비회원으로 변경 후 일촌관계 삭제*/	
	public void myonedelete (String memId);
	
	
	//문의게시판 관련---------------------------------------------------
	/* 문의게시판 목록 : 문의게시판 전체 리스트 보여주기 */
	public List<FaqVO> faqlist();
	
	/* 문의게시판 : 제목 클릭해서 상세화면 보여주기 */
	public FaqVO selectonefaq(int faq_num);	
	
	/* 문의게시판 : 글 작성하기 */
	public int insertfaq(FaqVO vo);
	
	/* 문의게시판 : 글 수정하기 */
	public int updatefaq(FaqVO vo);
	
	/* 문의게시판 : 댓글 작성 */
	public int insertfaqreply(FaqreVO vo);
	
	/* 문의게시판 : 댓글 리스트 */
	public List<FaqreVO> faqreplylist(int faq_num);

	
	// 관리자 페이지 : 회원관리 관련--------------------------------

	/* 회원관리 : 회원  조회하기 */
	public List<MemberVO> adminmemberview();
	/* 회원관리 : 비회원  조회하기 */
	public List<MemberVO> adminmemberview1();
	/* 회원관리 : 관리자  조회하기 */
	public List<MemberVO> adminmemberview2();
	
	
	public void updateOneCon(OneVO vo);
	
	/* 미니홈피 주인의 스킨 리스트 */
	public List<SkinVO> selectSkinById(String mem_id);
}
















