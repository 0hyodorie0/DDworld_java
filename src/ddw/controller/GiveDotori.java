package ddw.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.MemberVO;



@WebServlet("/giveDotori.do")
public class GiveDotori extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("utf-8");
		int qty = Integer.parseInt(request.getParameter("dotoriqty"));
		String mem_id = request.getParameter("pickid");
        
        IDDWorldService service = DDWorldServiceImpl.getInstance();
	      
        MemberVO vo = new MemberVO();
        
        vo.setMem_id(mem_id);
        vo.setMem_dtr(qty);
        
        service.updateGiveDotori(vo);
        
        List<MemberVO> memberlist = service.adminmemberview();
        
		RequestDispatcher rd = 
				request.getRequestDispatcher("/WEB-INF/views/member/adminmember.jsp");
			rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
