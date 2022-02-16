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

/**
 * Servlet implementation class Noticeupdate
 */
@WebServlet("/noticeupdate.do")
public class Noticeupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Noticeupdate() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		NoticeVO vo = service.selectOneNotice(notice_num);
		
		request.setAttribute("vo", vo);
		
		request.getRequestDispatcher("/WEB-INF/views/board/updatenoticeform.jsp").forward(request, response);
		
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		String notice_title= request.getParameter("notice_title");
		String notice_con = request.getParameter("notice_con");
		
		
		NoticeVO vo = new NoticeVO();
		vo.setNotice_num(notice_num);
		vo.setNotice_title(notice_title);
		vo.setNotice_con(notice_con);
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		int update = service.updateNotice(vo);
		
		response.sendRedirect(request.getContextPath()+"/notice.do");
		
		
	}

}
