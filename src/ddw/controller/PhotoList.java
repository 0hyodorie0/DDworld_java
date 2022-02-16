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

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.DdVO;
import ddw.vo.PhotoVO;
import ddw.vo.PhotoreVO;



@WebServlet("/photoList.do")
public class PhotoList extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		Map<String, String> keys = (Map<String, String>) session.getAttribute("keys");
		String keyDdworld = keys.get("keyDdworld");
		
		DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
		
		String dd_add = ddvo.getDd_add();
		System.out.println("사진첩으로 가기위한 주소============" + dd_add);
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		List<PhotoVO> list = service.selectAllPhoto(dd_add);
		
		System.out.println("쿼리수행 완료");
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("/jsp/mini_photo.jsp").forward(request, response);
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
