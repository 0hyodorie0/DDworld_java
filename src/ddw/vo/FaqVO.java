package ddw.vo;

public class FaqVO {
	public int getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_con() {
		return faq_con;
	}
	public void setFaq_con(String faq_con) {
		this.faq_con = faq_con;
	}
	public String getFaq_date() {
		return faq_date;
	}
	public void setFaq_date(String faq_date) {
		this.faq_date = faq_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	private int faq_num  ;
	private String faq_title;
	private String faq_con  ;
	private String faq_date ;
	private String mem_id   ;
}
