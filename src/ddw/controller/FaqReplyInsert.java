package ddw.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.FaqreVO;

/**
 * Servlet implementation class FaqReplyInsert
 */
@WebServlet("/faqreplyinsert.do")
public class FaqReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FaqReplyInsert() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws 			ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int faq_num = Integer.parseInt(request.getParameter("faq_num"));
		String faq_recon = request.getParameter("faq_recon");
		String admin_id = request.getParameter("admin_id");
		
		FaqreVO vo = new FaqreVO();
		vo.setFaq_num(faq_num);
		vo.setFaq_recon(faq_recon);
		vo.setAdmin_id(admin_id);
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		int revo = service.insertfaqreply(vo);		
		
	    request.setAttribute("revo",revo);
	    response.sendRedirect(request.getContextPath() + "/faqDetail.do?faq_num="+faq_num);	
		
	}

}
