package ddw.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.NoticeVO;



@WebServlet("/noticeDetail.do")
public class NoticeDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int notice_num = Integer.parseInt(request.getParameter("no"));
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		NoticeVO vo = service.selectOneNotice(notice_num);
		
		request.setAttribute("vo", vo);
		request.getRequestDispatcher("/WEB-INF/views/board/noticeDetail.jsp").forward(request, response);
		
	}

}
