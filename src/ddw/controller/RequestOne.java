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



@WebServlet("/requestOne.do")
public class RequestOne extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String requestId = request.getParameter("requestId");
		String responseId = request.getParameter("responseId");
		String onename = request.getParameter("onename");
		System.out.println("------------------------------------------------");
		System.out.println(requestId);
		System.out.println(responseId);
		System.out.println(onename);
		
		
		OneVO onevo = new OneVO();
		int result = 0;
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		onevo.setMem_id(requestId);
		onevo.setMem_id2(responseId);
		onevo.setOne_name(onename);

		String status = service.checkOne(onevo);
		
		if(status == null) {
			result = service.insertRequestOne(onevo);	//result = 1 / 일촌 신청 인서트
		}else {
			if(status.equals("일촌")) {
				result = 2;
				//이미 일촌입니다.
			}else if(status.equals("대기")){
				result = 3;
				//이미 신청하셨습니다.
			}
		}
		
		//result = service.insertRequestOne(onevo);
		
		request.setAttribute("result", result);
		request.getRequestDispatcher("jsp/resultCheckOne.jsp").forward(request, response);
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
