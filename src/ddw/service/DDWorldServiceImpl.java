package ddw.service;

import java.util.List;

import ddw.dao.DDWorldDaoImpl;
import ddw.dao.IDDWorldDao;
import ddw.vo.DdVO;
import ddw.vo.FaqVO;
import ddw.vo.FaqreVO;
import ddw.vo.GbookVO;
import ddw.vo.MainVO;
import ddw.vo.MemberVO;
import ddw.vo.NoticeVO;
import ddw.vo.OneVO;
import ddw.vo.PhotoVO;
import ddw.vo.PhotoreVO;
import ddw.vo.SkinVO;
import ddw.vo.VisitVO;

public class DDWorldServiceImpl implements IDDWorldService{

	private static DDWorldServiceImpl service;
	private IDDWorldDao dao;
	
	private DDWorldServiceImpl() {
		dao = DDWorldDaoImpl.getInstance();
	}
	
	public static IDDWorldService getInstance() {
		if(service == null) service = new DDWorldServiceImpl();
		return service;
	}
	
	@Override/* 로그인 쿼리 */
	public MemberVO login(MemberVO vo) {
		return dao.login(vo);
	}

	@Override/* (임시)공지사항 전체 출력-검색미포함 */
	public List<NoticeVO> selectAllNotice() {
		return dao.selectAllNotice();
	}

	@Override/* (임시)공지사항 상세 출력 */
	public NoticeVO selectOneNotice(int notice_num) {
		return dao.selectOneNotice(notice_num);
	}

	@Override
	public String selectById(String id) {
		return dao.selectById(id);
	}
	
	//회원가입 저장
	@Override
	public String insertMember(MemberVO vo) {
		return dao.insertMember(vo);
	}
	
		
	//가입시 미니홈피 생성
	@Override
	public int insertMiniHompi(String id) {
		return dao.insertMiniHompi(id);
	}

	@Override /* 회원 id로 미니홈피 데이터 불러오기 */
	public DdVO selectOneDD(String mem_id) {
		return dao.selectOneDD(mem_id);
	}

	@Override/* 회원 id로 일촌리스트 불러오기 */
	public List<OneVO> selectAllOne(String mem_id) {
		return dao.selectAllOne(mem_id);
	}

	@Override/* 방문자 수 불러오기 */
	public VisitVO countVisit(String mem_id) {
		return dao.countVisit(mem_id);
	}

	@Override/* 방문기록 인서트 하기 */
	public void insertVisit(String mem_id) {
		dao.insertVisit(mem_id);
	}

	//메인 관련------------------------------------------
	
	@Override/* 모든 미니홈피 리스트 불러오기(검색없음) */
	public List<DdVO> selectAllDD() {
		return dao.selectAllDD();
	}

	@Override/* 로그인 후 내정보와 홈피 통합 조회 */
	public MainVO myAllData(String mem_id) {
		return dao.myAllData(mem_id);
	}

	@Override/* 공지사항 */
	public void insertNotice(NoticeVO vo) {
		dao.insertNotice(vo);
	}
	
	@Override /* 공지사항 : 글수정 */
	public int updateNotice(NoticeVO vo) {
		return dao.updateNotice(vo);
	}

	
	//회원정보수정 관련-------------------------------------------------	
	
	@Override /* 나의 회원정보  보여주기*/
	public List<MemberVO> myinfo(String mem_id) {
		return dao.myinfo(mem_id);
	}

	@Override 	/* 나의회원정보 : 탈퇴버튼 : 회원타입 '비회원;으로 변경*/
	public int myinfodelete(MemberVO vo) {
		return dao.myinfodelete(vo);
	}

	@Override /*나의회원정보 : 비회원으로 변경 후 미니홈페이지 삭제*/	
	public int myminihomedelete(String memId) {
		return dao.myminihomedelete(memId);
	}

	@Override/* 사진첩 추가하기 */
	public void insertPhoto(PhotoVO vo) {
		dao.insertPhoto(vo);
	}
	
	
	@Override/* 사진첩 리스트 불러오기 */
	public List<PhotoVO> selectAllPhoto(String dd_add) {
		List<PhotoVO> photoList = dao.selectAllPhoto(dd_add);
		if(photoList!=null) {
			for(PhotoVO pvo : photoList) {
				List<PhotoreVO> reList = dao.selectReList(pvo.getPhoto_no());
				pvo.setPhotoreList(reList);
			}
		}
		
		return photoList;
	}

	
	@Override/* 사진첩: 댓글 작성  : 회원만*/
	public int photoinsertreply(PhotoreVO vo) {
		return dao.photoinsertreply(vo);
	}
	@Override /* 문의게시판 목록 : 문의게시판 전체 리스트 보여주기 */
	public List<FaqVO> faqlist() {
		return dao.faqlist();
	}

	@Override /* 문의게시판 : 제목 클릭해서 상세화면 보여주기 */
	public FaqVO selectonefaq(int faq_num) {
		return dao.selectonefaq(faq_num);
	}

	@Override	/* 문의게시판 : 글 작성하기 */
	public int insertfaq(FaqVO vo) {
		return dao.insertfaq(vo);
	}

	@Override /* 문의게시판 : 댓글 작성 */
	public int insertfaqreply(FaqreVO vo) {
		return dao.insertfaqreply(vo);
	}

	@Override /* 문의게시판 : 댓글 리스트 */
	public List<FaqreVO> faqreplylist(int faq_num) {
		return dao.faqreplylist(faq_num);
	}
	

	@Override /* 문의게시판 : 글 수정 */
	public int updatefaq(FaqVO vo) {
		return dao.updatefaq(vo);
	}

	@Override
	public String checkOne(OneVO vo) {
		return dao.checkOne(vo);
	}

	@Override
	public int insertRequestOne(OneVO vo) {
		return dao.insertRequestOne(vo);
	}

	@Override
	public List<OneVO> selectCurrOne(String mem_id) {
		return dao.selectCurrOne(mem_id);
	}



	@Override /* 회원관리 : 회원  조회하기 */
	public List<MemberVO> adminmemberview() {
		return dao.adminmemberview();
	}
	
	@Override /* 회원관리 : 비회원  조회하기 */
	public List<MemberVO> adminmemberview1() {
		// TODO Auto-generated method stub
		return dao.adminmemberview1();
	}

	@Override /* 회원관리 : 관리자  조회하기 */
	public List<MemberVO> adminmemberview2() {
		// TODO Auto-generated method stub
		return dao.adminmemberview2();
	}

	@Override/* 스킨, 에지칼라, 메뉴칼라 변경 */
	public void updateDDColor(DdVO vo) {
		dao.updateDDColor(vo);
	}

	@Override/* 일촌 신청 수락 */
	public void acceptOne(OneVO vo) {
		dao.acceptOne(vo);
	}

	@Override/* 일촌 신청 거절 */
	public void denialOne(OneVO vo) {
		dao.denialOne(vo);
	}

	@Override/* 일촌 신청 수락시 행추가 */
	public void insertAcceptOne(OneVO vo) {
		dao.insertAcceptOne(vo);
	}

	@Override
	public List<OneVO> selectCurr2One(String mem_id) {
		return dao.selectCurr2One(mem_id);
	}

	@Override/* 일촌 신청 취소 */
	public void cancelOne(OneVO vo) {
		dao.cancelOne(vo);
	}

	@Override
	public void updateOneCon(OneVO vo) {
		dao.updateOneCon(vo);
	}

	@Override/* 미니홈피 주인의 스킨 리스트 */
	public List<SkinVO> selectSkinById(String mem_id) {
		return dao.selectSkinById(mem_id);
	}

	@Override/* 나의회원정보 : 비회원으로 변경 후 일촌관계 삭제*/
	public void myonedelete(String memId) {
		dao.myonedelete(memId);
	}



	@Override
	public MemberVO findPw(MemberVO vo) {
		
		return dao.findPw(vo);
	}

	@Override
	public MemberVO findId(MemberVO vo) {
		return dao.findId(vo);
	}

	@Override
	public void setNullOneCon(OneVO vo) {
		dao.setNullOneCon(vo);
	}

	@Override/* 미니홈 주변 메인 변경*/
	public void updateDDMain(DdVO vo) {
		dao.updateDDMain(vo);
	}

	@Override/* 방명록 댓글 */
	public void insertGuestRe(GbookVO vo) {
		dao.insertGuestRe(vo);
	}

	@Override/* 방명록 댓글 삭제 */
	public void deleteGuestRe(int guest_renum) {
		dao.deleteGuestRe(guest_renum);
	}

	@Override/* 도토리 증정 */
	public void updateGiveDotori(MemberVO vo) {
		dao.updateGiveDotori(vo);
	}





}

