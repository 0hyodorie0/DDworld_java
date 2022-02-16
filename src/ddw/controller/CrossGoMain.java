package ddw.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ddw.vo.MemberVO;


@WebServlet("/crossGoMain.do")
public class CrossGoMain extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		
		if(loginMember == null) {
			request.getRequestDispatcher("/jsp/main_shs.jsp").forward(request, response);
		}else {
			if(loginMember.getMem_type().equals("회원")) {
				request.getRequestDispatcher("/WEB-INF/views/member/loginMember.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("/WEB-INF/views/member/loginAdmin.jsp").forward(request, response);
			}
		}
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
