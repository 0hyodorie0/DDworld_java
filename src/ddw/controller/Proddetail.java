package ddw.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ddw.service.IprodService;
import ddw.service.ProdServiceImpl;
import ddw.vo.ProdVO;

@WebServlet("/proddetail.do")
public class Proddetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Proddetail() {
        super();
        // TODO Auto-generated constructor stub
    }

     // 카테고리별 상품 보여지는 Servlet
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IprodService service = ProdServiceImpl.getInstance();
	  
		String lprod_gu = request.getParameter("lprod_gu");
		
		List<ProdVO> lprodgulist = service.Lprodgu(lprod_gu);

		request.setAttribute("lprodgulist", lprodgulist);
		
		RequestDispatcher rd = 
				request.getRequestDispatcher("/WEB-INF/views/store/lprodgu.jsp");
			rd.forward(request, response);
	}

}
