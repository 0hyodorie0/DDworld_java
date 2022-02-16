package ddw.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ddw.service.MiniHomeService;
import ddw.service.MiniHomeServiceImpl;
import ddw.vo.DdVO;
import ddw.vo.GbookVO;


@WebServlet("/gbook.do")
public class Gbook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 클라이언트 요청시 전송데이터 받기
		//String dd_add = request.getParameter("dd_add");
		//System.out.println("지북 서블릿이 보낸 ddadd===========" +dd_add);
		
		HttpSession session = request.getSession();
		
		Map<String, String> keys = (Map<String, String>) session.getAttribute("keys");
		String keyDdworld = keys.get("keyDdworld");
		
		DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
		
		String dd_add = ddvo.getDd_add();
		
		//2. service 객체 얻기
		MiniHomeService service = MiniHomeServiceImpl.getInstance();
		
		//3. service 메서드 호출:결과값받기 >> dd_add를 기준으로 모든방명록 리스트를 얻는다
		List<GbookVO> list = service.selectgbook(dd_add);
		
		//4. 결과값으로 json데이터 생성 >> 여기서 미니방으로 간다
		request.setAttribute("list", list);
		request.getRequestDispatcher("/jsp/mini_bang.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
