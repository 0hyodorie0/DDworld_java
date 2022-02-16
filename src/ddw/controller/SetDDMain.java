package ddw.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.DdVO;



@WebServlet("/setDDMain.do")
public class SetDDMain extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String dd_title = request.getParameter("ddtitle");
		String dd_con = request.getParameter("ddcon");
		String dd_photo = request.getParameter("ddphoto");
		
		System.out.println(dd_title + " / " + dd_con + " / " + dd_photo);
		
		HttpSession session = request.getSession();
		
		Map<String, String> keys = (Map<String, String>) session.getAttribute("keys");
		String keyDdworld = keys.get("keyDdworld");
		DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
		
		ddvo.setDd_title(dd_title);
		ddvo.setDd_con(dd_con);
		ddvo.setDd_photo(dd_photo);
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		service.updateDDMain(ddvo);
	}

}
