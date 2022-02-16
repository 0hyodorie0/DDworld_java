package ddw.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.PhotoreVO;

/**
 * Servlet implementation class Photoreplyinsert
 */
@WebServlet("/photoreplyinsert.do")
public class Photoreplyinsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Photoreplyinsert() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int photo_no = Integer.parseInt(request.getParameter("photo_no"));
		String photo_recon = request.getParameter("photo_recon");
		String mem_id = request.getParameter("mem_id");
		
		PhotoreVO vo = new PhotoreVO();
		vo.setPhoto_no(photo_no);
		vo.setPhoto_recon(photo_recon);
		vo.setMem_id(mem_id);
				
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		int revo = service.photoinsertreply(vo);
		
		/*request.setAttribute("revo",revo);*/
		
		response.sendRedirect(request.getContextPath() + "/photoList.do");	
	}

}
