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



@WebServlet("/insertNotice.do")
public class InsertNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/views/board/insertNoticeForm.jsp").forward(request, response);
		//response.sendRedirect(request.getContextPath()+"/WEB-INF/views/board/insertNoticeForm.jsp");
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String notice_title = request.getParameter("notice_title");
		String notice_con = request.getParameter("notice_con");
		String admin_id = request.getParameter("id");
		
		System.out.println("---------------------------- 제목 : " + notice_title);
		System.out.println("---------------------------- 내용 : " + notice_con);
		System.out.println("---------------------------- 아이디 : " + admin_id);
		
		NoticeVO vo = new NoticeVO();
		
		vo.setAdmin_id(admin_id);
		vo.setNotice_title(notice_title);
		vo.setNotice_con(notice_con);
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		service.insertNotice(vo);
		
		response.sendRedirect(request.getContextPath() + "/notice.do");

	}

}
