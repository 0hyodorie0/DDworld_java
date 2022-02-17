package ddw.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ddw.dao.DDWorldDaoImpl;
import ddw.dao.IDDWorldDao;
import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.service.MiniHomeService;
import ddw.service.MiniHomeServiceImpl;
import ddw.vo.MemberVO;
import ddw.vo.MiniVO;
import ddw.vo.ProdVO;

/**
 * Servlet implementation class StoreMiniroom
 */
@WebServlet("/storeMiniroom.do")
public class StoreMiniroom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		
//		Map<String, String> keys = (Map<String, String>) session.getAttribute("keys");
//		String keyDdworld = keys.get("keyDdworld");
//		
//		DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
//		String dd_add = ddvo.getDd_add();
		
		MemberVO loginMember =  (MemberVO)session.getAttribute("loginMember");

		
		String prodnum = request.getParameter("prodnum");
			String checkProdnum = prodnum.substring(0, 4);
		int prodpa = Integer.parseInt(request.getParameter("prodpa"));
		String prodnm = request.getParameter("prodnm");
		String prodcon = request.getParameter("prodcon");
		System.out.println("도토리값 >>>>>>>>>>>: " + prodpa);
		
		MiniHomeService service = MiniHomeServiceImpl.getInstance();
		IDDWorldDao service2 = DDWorldDaoImpl.getInstance();	
		
		IDDWorldService service3 = DDWorldServiceImpl.getInstance();
				
		
		if(checkProdnum.equals("P401") || checkProdnum.equals("P501") || checkProdnum.equals("P601")) {
			MiniVO vo = new MiniVO();
			vo.setDd_add(loginMember.getMem_id()+"dd");
			vo.setProd_num(prodnum);
			vo.setProd_nm(prodnm);
			vo.setMini_type("보유");
			
			int count = service.countMiniprod(prodnum);
			
			if(count == 0) {
				int cnt = service.insertprodMem(vo);
			}
		}else{
			ProdVO vo = new ProdVO();
			vo.setMem_id(loginMember.getMem_id());
			vo.setProd_num(prodnum);
			
			service3.insertProd(vo);
		}
		
		//----------------------------------------
		int dtr = loginMember.getMem_dtr() - prodpa;
		System.out.println("빼고난 도토리 갯수 >>>> " + dtr);
		MemberVO vo2 = new MemberVO();
		vo2.setMem_id(loginMember.getMem_id());
		vo2.setMem_dtr(dtr);
		loginMember.setMem_dtr(dtr);
		
		int memdtr = service2.dtrUpdatemini(vo2);
		response.sendRedirect("jsp/storeMain.jsp");
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
