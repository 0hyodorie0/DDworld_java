package ddw.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.FaqVO;

/**
 * Servlet implementation class FaqInsert
 */
@WebServlet("/faqInsert.do")
public class FaqInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FaqInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/board/insertfaqform.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   request.setCharacterEncoding("utf-8");
	    
	   String faq_title = request.getParameter("faq_title");
	   String faq_con = request.getParameter("faq_con");
	   String mem_id = request.getParameter("mem_id");
	   
	   FaqVO vo = new FaqVO();
	   
	   vo.setFaq_title(faq_title);
	   vo.setFaq_con(faq_con);
	   vo.setMem_id(mem_id);
	   
	   IDDWorldService service = DDWorldServiceImpl.getInstance();
	   
	   service.insertfaq(vo);
	   
	   response.sendRedirect(request.getContextPath() + "/faq.do");
	
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
