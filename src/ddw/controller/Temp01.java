package ddw.controller;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.DdVO;
import ddw.vo.FileInfoVO;
import ddw.vo.PhotoVO;



@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 30,
		maxRequestSize = 1024 * 1024 * 100
	)
@WebServlet("/temp01.do")
public class Temp01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	private String extractFileName(Part part) {
		String fileName = "";
		
		String contentDisposition = part.getHeader("content-disposition");
		String[] items = contentDisposition.split(";");	//;으로 문자열을 구분한다.
		for(String item : items) {
			if(item.trim().startsWith("filename")) {
				fileName = item.substring(item.indexOf("=")+2, item.length()-1);
			}
		}
		return fileName;
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("임시서블렛 도착");
		
		request.setCharacterEncoding("utf-8");
		/*
		String photo_pt = request.getParameter("photo_pt");
		String photo_con = request.getParameter("photo_con");
		
		System.out.println(photo_pt + " / " + photo_con);*/
		
		//request.getRequestDispatcher(request.getContextPath() + "/jsp/temp_kju.jsp").forward(request, response);
		
		//업로드된 파일들이 저장될 폴더 설정
		String uploadPath = "d:/A_teachingMaterial/3.HighJava/workspace/ddWorld/WebContent/images/photo";
		
		//저장될폴더가 없으면 새로 만들어 놓는다.
		File f = new File(uploadPath);
		if(!f.exists()) {
			f.mkdir();
		}
		
		//파일이 아닌 일반 데이터는 getParameter()메서드나 getParameterValues()메서드를 이용해서 구한다.
		String photo_con = request.getParameter("imgcon");
		System.out.println("사진 내용 : " + photo_con);

		//수신 받은 파일 데이터를 처리하기
		String fileName = "";	//파일명이 저장될 변수 선언
		
		//Upload한 파일 목록이 저장될 List 객체 생성
		List<FileInfoVO> fileList = new ArrayList<>();
		
		/*
		 * - Servlet 3.0이상에서 새롭게 추가된 Upload용 메서드
		 * 		1) request.getParts() ==> 전체 Part객체를 Collection객체에 담아서 반환한다.
		 * 		2) request.getPart("이름"); ==> 지정된 '이름'을 가진 개별 Part객체를 반환한다.
		 * 			'이름' ==> form태그 안의 입력요소의 name속성 값으로 구별한다.
		 */
		// 전체 Part객체 개수만큼 반복처리
		for(Part part : request.getParts()) {
			fileName = extractFileName(part);	//파일명 구하기
			
			//찾은 파일명이 공백("")이면 이것은 파일이아닌 일반 파라미터라는 의미이다.
			if(!"".equals(fileName)) {	//파일인지 검사 //DB에서 파일정보 추가 등의 작업을 할때는 여기서 하면된다.
				
				//1개의 Upload파일에 대한 정보를 저장할 VO객체 생성
				FileInfoVO fvo = new FileInfoVO();
				fvo.setFileName(fileName);
				
				//part.getSize() ==> upload된 파일의 크기 반환 (단위 : byte)
				fvo.setFileSize((long)(Math.ceil(part.getSize()/1024.0)));
				
				
				try {
					//part.write(fileName); ==> upload된 파일을 저장하는 메서드
					part.write(uploadPath + File.separator + fileName);	//파일 저장
					fvo.setUploadStatus("success");
				}catch(IOException e) {
					fvo.setUploadStatus("fail : " + e.getMessage());
				}
				fileList.add(fvo);	//upload된 파일 정보를 List에 추가
			}//if문 종료...
		}//for문 종료...
		System.out.println("사진 이름 : " + fileName);
		
		//인서트 공간-------------------------------------------------------------
		
		HttpSession session = request.getSession();
		
		Map<String, String> keys = (Map<String, String>) session.getAttribute("keys");
		String keyDdworld = keys.get("keyDdworld");
		
		DdVO ddvo = (DdVO)session.getAttribute(keyDdworld);
		
		String dd_add = ddvo.getDd_add();
		
		PhotoVO vo = new PhotoVO();
		
		vo.setDd_add(dd_add);
		vo.setPhoto_pt(fileName);
		vo.setPhoto_con(photo_con);
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		service.insertPhoto(vo);
		
		
		//---------------------------------------------------------------------
		
		response.sendRedirect(request.getContextPath() + "/photoList.do");

		
	}

}
