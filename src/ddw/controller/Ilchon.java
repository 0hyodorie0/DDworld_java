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
import ddw.vo.DdVO;
import ddw.vo.OneVO;


@WebServlet("/ilchon.do")
public class Ilchon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("utf-8");
    	String mem_id = request.getParameter("id");
    	System.out.println("일촌.두 서블릿에서 받은 아이디===============" + mem_id);
    	
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		List<OneVO> list = service.selectCurrOne(mem_id);	//신청한 사람
		List<OneVO> list2 = service.selectCurr2One(mem_id);	//내가 신청한 사람
		List<OneVO> onelist = service.selectAllOne(mem_id);	//이미 일촌인 사람
		//내가 신청한 사람
		
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("onelist", onelist);
		
		request.getRequestDispatcher("/WEB-INF/views/board/oneRequestList.jsp").forward(request, response);
	}

}
