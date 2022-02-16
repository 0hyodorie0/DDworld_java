package ddw.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;

@WebServlet("/checkId.do")
public class CheckId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("id");
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		String id = service.selectById(userId);

		request.setAttribute("keyid", id);
		
		request.getRequestDispatcher("WEB-INF/views/member/checkId.jsp").forward(request, response);
	}

}
