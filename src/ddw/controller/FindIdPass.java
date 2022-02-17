package ddw.controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

import ddw.service.DDWorldServiceImpl;
import ddw.service.IDDWorldService;
import ddw.vo.MemberVO;


@WebServlet("/findIdPass.do")
public class FindIdPass extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberVO vo = new MemberVO();
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String tel = request.getParameter("tel");
		
		System.out.println("입력값 가져오기 : " + name + id + tel);
		
		vo.setMem_name(name);
		vo.setMem_tel(tel);
		
		IDDWorldService service = DDWorldServiceImpl.getInstance();
		
		
		
		if(id == null) {
			vo = service.findId(vo);
			if(vo != null) {
				//아이디 찾기 성공 == 이름과 번호가 일치하는 아이디 하나가 존재함
				System.out.println("아이디 찾는중.." + vo.getMem_id());
				String findid = "";
				for(int i = 0; i < vo.getMem_id().length(); i++) {
					if(i < 4 || i == vo.getMem_id().length()-1) {
						findid += vo.getMem_id().charAt(i);
					}else {
						findid += "*";
					}
				}
				request.setAttribute("findid", findid);
				request.getRequestDispatcher("/WEB-INF/views/member/foundId.jsp").forward(request, response);
			}else {
				//아이디 찾기 실패 == 데이터가 없음
				request.getRequestDispatcher("/WEB-INF/views/member/foundfail.jsp").forward(request, response);
				
				System.out.println("데이터 없음");
			}
		}else {
			vo.setMem_id(id);
			vo = service.findPw(vo);
			if(vo != null) {
				//비번 찾기 성공 == 이름과 번호가 일치하는 아이디 하나가 존재함
				System.out.println("비번 찾는중..."+ vo.getMem_pass());
				request.setAttribute("vo", vo);
				
				
				//commons mail로 비번 보내야함..
				
				Email email = new SimpleEmail();
			      email.setHostName("smtp.googlemail.com");
			      email.setSmtpPort(465);
			      email.setAuthenticator(new DefaultAuthenticator("team5202111m@gmail.com", "java5202111"));
			      email.setSSLOnConnect(true);
			      try {
			         email.setFrom("team5202111m@gmail.com");
			         email.setSubject("디디월드 비밀번호 관련 메일 전송");
			         email.setMsg("회원님의 비밀번호는"+vo.getMem_pass()+"입니다"); //회원 계정 패스워드
			         email.addTo(vo.getMem_mail()); //회원 메일 주소
			         email.send();
			      } catch (EmailException e) {
			         e.printStackTrace();
			      }
			      request.getRequestDispatcher("/WEB-INF/views/member/foundPw.jsp").forward(request, response);
			      System.out.println("메일이 성공적으로 보내졌습니다.");
			      
			}else {
				//비번 찾기 실패 == 데이터가 없음
				request.getRequestDispatcher("/WEB-INF/views/member/foundfail.jsp").forward(request, response);
				System.out.println("데이터 없음");
			}
		}
		
		
		
		
		
		/*
		if(name.equals(vo.getMem_name()) && tel.equals(vo.getMem_tel())) {
			System.out.println("아이디 찾기 실행");
			
		}else {
			System.out.println("아이디 찾기 정보가 맞지 않습니다");
			
		}*/
		
		
		/*
		if( id != null ) {
			vo.setMem_id(id);
			vo = service.findPw(vo);
			if(id.equals(vo.getMem_id()) && tel.equals(vo.getMem_tel()) && email.equals(vo.getMem_mail())) {
				System.out.println("비밀번호 찾기 실행");
				
			}else {
				System.out.println("비밀번호 찾기 정보가 맞지 않습니다.");
				
			}
		}
		*/
		
		
		
	}

}
