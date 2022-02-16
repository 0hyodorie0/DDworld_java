package ddw.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/storeMain.do")
public class StoreMain extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("상점메인가기 서블릿도착");
		
		int temp = 0;
		
		//1. WEB-INF폴더 안에 views로 갈때 >> 오류
		//response.sendRedirect(request.getContextPath()+"/WEB-INF/views/store/storeMain.jsp");
		
		//2. WebContent폴더 안에 view로 갈때 >> 성공
		//response.sendRedirect(request.getContextPath()+"/view/store/storeMain.jsp");
		
		//3. 포워드로 이동
		request.getRequestDispatcher("/WEB-INF/views/store/storeMain.jsp").forward(request, response);
	}



	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
