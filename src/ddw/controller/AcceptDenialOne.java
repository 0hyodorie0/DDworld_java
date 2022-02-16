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



@WebServlet("/acceptDenialOne.do")
public class AcceptDenialOne extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String mem_id = request.getParameter("logid");
		String type = request.getParameter("type");
		String reqid = request.getParameter("id");
		String onename = request.getParameter("onename");
		System.out.println(onename + " / " + type);
		OneVO onevo = new OneVO();
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		onevo.setMem_id(reqid);
		onevo.setMem_id2(mem_id);
		onevo.setOne_name(onename);
		
		
		if(type.equals("yes")) {
			service.acceptOne(onevo);
			service.insertAcceptOne(onevo);
		}else if(type.equals("cancel")){
			service.cancelOne(onevo);
		}else {
			service.denialOne(onevo);
		}
		
		response.sendRedirect(request.getContextPath()+"/ilchon.do?id="+mem_id+"");
		//request.getRequestDispatcher("").forward(request, response);
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
