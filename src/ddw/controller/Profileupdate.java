package ddw.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ddw.service.MiniHomeService;
import ddw.service.MiniHomeServiceImpl;
import ddw.vo.ProfileVO;

/**
 * Servlet implementation class Profileupdate
 */
@WebServlet("/profileupdate.do")
public class Profileupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Profileupdate() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			
			String procon = request.getParameter("content");
			String ddadd = request.getParameter("ddadd");
			
		       
		     ProfileVO vo = new ProfileVO ();	     
		       
	         vo.setProfile_con(procon);
	         vo.setDd_add(ddadd);
	              
	         MiniHomeService service = MiniHomeServiceImpl.getInstance();
		     
		     int cnt = service.myprofilemerge(vo);
		     
		     response.sendRedirect(request.getContextPath()+"/profileselect.do");
			 

}
}
