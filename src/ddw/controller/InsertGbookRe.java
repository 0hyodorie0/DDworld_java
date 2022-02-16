package ddw.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.GbookVO;
import ddw.vo.PhotoreVO;



@WebServlet("/insertGbookRe.do")
public class InsertGbookRe extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		int guest_no = Integer.parseInt(request.getParameter("gbook_no"));
		String guest_recon = request.getParameter("gbook_recon");
		
		GbookVO vo = new GbookVO();
		vo.setGuest_no(guest_no);
		vo.setGuest_recon(guest_recon);
				
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		System.out.println("쿼리수행전.. 받은 값 " + guest_no + " / " + guest_recon);
		
		response.sendRedirect(request.getContextPath() + "/gbook.do");	
		
	}

}
