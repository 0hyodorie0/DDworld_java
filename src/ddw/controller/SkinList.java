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
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.SkinVO;



@WebServlet("/skinList.do")
public class SkinList extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String mem_id = request.getParameter("id");
		System.out.println(mem_id);
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();

		List<SkinVO> list =  service.selectSkinById(mem_id);
		
		//4. 결과값으로 json데이터 생성
		response.setContentType("application/json; charset=UTF-8"); 
		PrintWriter out = response.getWriter();
		JsonObject obj = new JsonObject();
		
		Gson gson = new Gson();
		
		if(list == null || list.size()==0) {
			obj.addProperty("sw", "no");
		}else {//스킨 리스트 데이터가 있을때
			obj.addProperty("sw", "yes");
			
			JsonElement ele = gson.toJsonTree(list);
			obj.add("datas", ele);
		}
		
		out.print(obj);
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
