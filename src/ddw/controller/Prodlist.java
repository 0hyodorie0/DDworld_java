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

@WebServlet("/prodlist.do")
public class Prodlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Prodlist() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    //전체 상품 보여지는 Servlet
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		IprodService service = ProdServiceImpl.getInstance();
	  
		List<ProdVO> prodList = service.Allprod();

		request.setAttribute("prodList", prodList);
		
		RequestDispatcher rd = 
				request.getRequestDispatcher("/WEB-INF/views/store/prod.jsp");
			rd.forward(request, response);
	}

}
