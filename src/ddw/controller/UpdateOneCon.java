package ddw.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.OneVO;




@WebServlet("/updateOneCon.do")
public class UpdateOneCon extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * mem_id >> 홈피 주인
		 * mem_id2 >> 방문자, 로그인한자
		 * one_con	>> 일촌평 내용
		 */
		request.setCharacterEncoding("utf-8");
		
		String mem_id = request.getParameter("id");
		String mem_id2 = request.getParameter("id2");
		String one_con = request.getParameter("onecon");
		
		System.out.println("홈피주인 : " + mem_id);
		System.out.println("작성자 : " + mem_id2);
		System.out.println("작성내용 : " + one_con);
		
		OneVO onevo = new OneVO();
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		onevo.setMem_id(mem_id);
		onevo.setMem_id2(mem_id2);
		onevo.setOne_con(one_con);
		
		service.updateOneCon(onevo);
		
		response.sendRedirect(request.getContextPath()+"/jsp/mini_home.jsp"); /*일단 이건됨*/
		//response.sendRedirect("/ddworld/goDD.do?id="+mem_id+"");
		//request.getRequestDispatcher("/goDD.do?id="+mem_id+"").forward(request, response); /*아이프레임 안에 홈피가또들어감*/
	}

}
