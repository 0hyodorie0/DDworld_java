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
import ddw.vo.NoticeVO;




@WebServlet("/notice.do")
public class Notice extends HttpServlet {
	private static final long serialVersionUID = 1L;


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//1. 클라이언트 요청시 전송데이터 받기
		//전달받을 데이터가 없음
		
		//2. service객체 얻기
		IDDWorldService service = DDWorldServiceImpl.getInstance();
				
		//3. service메서드 호출 : 결과값 받기
		List<NoticeVO> list = service.selectAllNotice();
		
		//4. 결과값으로 json데이터 생성
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/views/board/notice.jsp").forward(request, response);
		
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
