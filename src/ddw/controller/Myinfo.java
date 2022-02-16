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
 * Servlet implementation class Myinfo
 */
@WebServlet("/myinfo.do")
public class Myinfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Myinfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
	
		String mem_id = request.getParameter("mem_id");
		
		List<MemberVO> myinfo = service.myinfo(mem_id);
		
		request.setAttribute("myinfo",myinfo);
		
		RequestDispatcher rd = 
				request.getRequestDispatcher("/WEB-INF/views/member/memberView.jsp");
			rd.forward(request, response);
	
	}

}
