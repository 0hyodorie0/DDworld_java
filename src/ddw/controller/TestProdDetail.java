package ddw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ddw.service.IprodService;
import ddw.service.ProdServiceImpl;
import ddw.vo.ProdVO;



@WebServlet("/testProdDetail.do")
public class TestProdDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String lprod_gu = request.getParameter("lprod_gu");
		System.out.println("prod 서블릿이 받은 lprod_gu >>>>>  " + lprod_gu);
		
		IprodService service = ProdServiceImpl.getInstance();
		
		List<ProdVO> list= service.Lprodgu(lprod_gu);
		
		
		//4. 결과값으로 json데이터 생성
		Gson gson = new Gson();
		String result = gson.toJson(list);
		
		response.setContentType("application/json; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		
		out.print(result);
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
