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

/**
 * Servlet implementation class Faq
 */
@WebServlet("/faq.do")
public class Faq extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Faq() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	   IDDWorldService serivce = DDWorldServiceImpl.getInstance();
		
	   List<FaqVO> faqlist = serivce.faqlist();
	   
	   request.setAttribute("faqlist", faqlist);
	   request.getRequestDispatcher("/WEB-INF/views/board/faq.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
