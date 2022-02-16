package ddw.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.FaqVO;
import ddw.vo.FaqreVO;

/**
 * Servlet implementation class Faqupdate
 */
@WebServlet("/faqupdate.do")
public class Faqupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Faqupdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		 
	    int faq_num = Integer.parseInt(request.getParameter("faq_num")); 
	     
	    IDDWorldService service = DDWorldServiceImpl.getInstance();
	    
	    FaqVO vo = service.selectonefaq(faq_num);       
	    
	    request.setAttribute("vo", vo);	    
	    
	    request.getRequestDispatcher("/WEB-INF/views/board/updatefaqform.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	    
		int    faq_num = Integer.parseInt(request.getParameter("faq_num"));
		String faq_title = request.getParameter("faq_title");
		String faq_con = request.getParameter("faq_con");
       
		FaqVO vo = new FaqVO();
		vo.setFaq_num(faq_num);
		vo.setFaq_title(faq_title);
		vo.setFaq_con(faq_con);
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		int update = service.updatefaq(vo);
		
		response.sendRedirect(request.getContextPath()+"/faq.do");
	}

}
