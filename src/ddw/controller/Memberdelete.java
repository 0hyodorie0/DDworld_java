package ddw.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.MemberVO;

/**
 * Servlet implementation class Memberdelete
 */
@WebServlet("/memberdelete.do")
public class Memberdelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Memberdelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
	     
		String mem_id =request.getParameter("mem_id");
				
		IDDWorldService service = DDWorldServiceImpl.getInstance(); 
	    
		
		MemberVO memvo = new MemberVO();
		
		memvo.setMem_id(mem_id);

        int cnt =service.myinfodelete(memvo);
        
        int xhr =service.myminihomedelete(mem_id);
		
        service.myonedelete(mem_id);
        
        response.sendRedirect(request.getContextPath() + "/jsp/main_shs.jsp");
		 
	
	
	
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	}

}
