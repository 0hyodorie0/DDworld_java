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

/**
 * Servlet implementation class AdminMemberview2
 */
@WebServlet("/adminMemberview2.do")
public class AdminMemberview2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberview2() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
        
        IDDWorldService service = DDWorldServiceImpl.getInstance();
	      
        List<MemberVO> memberlist = service.adminmemberview2();
	 
        request.setAttribute("memberlist", memberlist);               
	
		RequestDispatcher rd = 
				request.getRequestDispatcher("/WEB-INF/views/member/adminmember2.jsp");
			rd.forward(request, response);
	

	}

}
