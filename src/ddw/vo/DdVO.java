package ddw.vo;

public class DdVO {
	//홈페이지 방문시, 해당 홈페이지를 출력하기위한 데이터를 담는 vo입니다.
	
	private String dd_add      ;
	private String mem_id	   ;
	private String dd_title    ;
	private String dd_photo    ;
	private String dd_con      ;
	private String dd_skin     ;	//홈페이지 스킨 이미지 명
	private String dd_edge     ;	//에지컬러 16진수 번호
	private String dd_menu     ;	//메뉴컬러 16진수 번호
	private String mem_name    ;
    
    
    
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getDd_add() {
		return dd_add;
	}
	public void setDd_add(String dd_add) {
		this.dd_add = dd_add;
	}
	public String getDd_title() {
		return dd_title;
	}
	public void setDd_title(String dd_title) {
		this.dd_title = dd_title;
	}
	public String getDd_photo() {
		return dd_photo;
	}
	public void setDd_photo(String dd_photo) {
		this.dd_photo = dd_photo;
	}
	public String getDd_con() {
		return dd_con;
	}
	public void setDd_con(String dd_con) {
		this.dd_con = dd_con;
	}
	public String getDd_skin() {
		return dd_skin;
	}
	public void setDd_skin(String dd_skin) {
		this.dd_skin = dd_skin;
	}
	public String getDd_edge() {
		return dd_edge;
	}
	public void setDd_edge(String dd_edge) {
		this.dd_edge = dd_edge;
	}
	public String getDd_menu() {
		return dd_menu;
	}
	public void setDd_menu(String dd_menu) {
		this.dd_menu = dd_menu;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
    
    
	
}
