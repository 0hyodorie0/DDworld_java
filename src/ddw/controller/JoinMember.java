package ddw.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ddw.dao.DDWorldDaoImpl;
import ddw.dao.IDDWorldDao;
import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.service.MiniHomeService;
import ddw.service.MiniHomeServiceImpl;
import ddw.vo.MemberVO;
import ddw.vo.MiniVO;

@WebServlet("/joinMember.do")
public class JoinMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		//1. 클라이언트 요청시 전송되는 값을 받는다 - 8개 mem_id mem_pass
		String id = request.getParameter("mem_id");
		String name = request.getParameter("mem_name");
		String pass = request.getParameter("mem_pass");
		String gender = request.getParameter("mem_gender");
		String mnm = null;
		String minidef = null;
		
		if(gender.equals("여")) {
			mnm = "default_f.png";
			minidef ="P401defaultf";
		}else {
			mnm = "default_m.png";
			minidef = "P401defaultm";
		}
		
//		int birth = Integer.parseInt(request.getParameter("mem_birth"));
		String tel = request.getParameter("mem_tel");
		String zip = request.getParameter("mem_zip");
		String add1 = request.getParameter("mem_add1");
		String mail = request.getParameter("mem_mail");
		
		MemberVO vo = new MemberVO();
		vo.setMem_id(id);
		vo.setMem_name(name);
		vo.setMem_pass(pass);
		vo.setMem_gender(gender);
		vo.setMem_mnm(mnm);
//		vo.setMem_birth(birth);
		vo.setMem_tel(tel);
		vo.setMem_zip(zip);
		vo.setMem_add1(add1);
		vo.setMem_mail(mail);
		
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		//회원가입 저장
		String sid = service.insertMember(vo);
		//미니홈피 생성
		int mcnt = service.insertMiniHompi(id);
		
		
		MiniVO vo2 = new MiniVO();
		vo2.setDd_add(id+"dd");
		vo2.setProd_num("P601default");
		vo2.setProd_nm("기본룸.jpg");
		vo2.setMini_type("사용");
		
		MiniHomeService service2 = MiniHomeServiceImpl.getInstance();
		
		int cnt = service2.insertprodMem(vo2);
		
		MiniVO vo3 = new MiniVO();
		vo3.setDd_add(id+"dd");
		vo3.setProd_num(minidef);
		vo3.setProd_nm(mnm);
		vo3.setMini_type("사용");
		
		int cnt2 = service2.insertprodMem(vo3);
		
		request.setAttribute("sid", sid);
//		request.setAttribute("mcnt", mcnt);
		
//		request.getRequestDispatcher("/WEB-INF/views/member/insertMember.jsp").forward(request, response);
		request.getRequestDispatcher("/jsp/main_shs.jsp").forward(request, response);
	}

}
