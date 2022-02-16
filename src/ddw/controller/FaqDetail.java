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

@WebServlet("/faqDetail.do")
public class FaqDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FaqDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	 
	    int faq_num = Integer.parseInt(request.getParameter("faq_num")); 
	     
	    IDDWorldService service = DDWorldServiceImpl.getInstance();
	    
	    FaqVO vo = service.selectonefaq(faq_num);       
	    
	    request.setAttribute("vo", vo);
	    
	    List<FaqreVO> faqre = service.faqreplylist(faq_num);
	    
	    request.setAttribute("faqre", faqre);
	    
	    request.getRequestDispatcher("/WEB-INF/views/board/faqdetail.jsp").forward(request, response);
		
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
