package ddw.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ddw.service.MiniHomeService;
import ddw.service.MiniHomeServiceImpl;
import ddw.vo.DdVO;
import ddw.vo.ProfileVO;

/**
 * Servlet implementation class Profileselect
 */
@WebServlet("/profileselect.do")
public class Profileselect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Profileselect() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MiniHomeService service = MiniHomeServiceImpl.getInstance();		

		HttpSession session = request.getSession();
		
		Map<String, String> keys = (Map<String, String>)session.getAttribute("keys");
		String keyDdworld = keys.get("keyDdworld");
		
		DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
		
		String ddadd = ddvo.getDd_add();		
		
		ProfileVO profile = service.homeprofileselect(ddadd);
		
		request.setAttribute("profile",profile);
	
		RequestDispatcher rd = 
				request.getRequestDispatcher("/jsp/mini_profile.jsp");
			rd.forward(request, response);
	
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
    
    
    }

}
