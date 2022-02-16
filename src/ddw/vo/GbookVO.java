package ddw.vo;

import java.sql.Date;

public class GbookVO {
	private int guest_no     ;
	private String dd_add    ;
	private String guest_con ;
	private Date guest_date  ;
	private String mem_id    ;
	private String mem_name	 ;
	private String mem_mnm	 ;
	private int guest_renum  ;
	private int guest_no_1   ;
	private Date guest_redate;
	private String guest_recon;
	

	public int getGuest_renum() {
		return guest_renum;
	}
	public void setGuest_renum(int guest_renum) {
		this.guest_renum = guest_renum;
	}
	public int getGuest_no_1() {
		return guest_no_1;
	}
	public void setGuest_no_1(int guest_no_1) {
		this.guest_no_1 = guest_no_1;
	}
	public Date getGuest_redate() {
		return guest_redate;
	}
	public void setGuest_redate(Date guest_redate) {
		this.guest_redate = guest_redate;
	}
	public String getGuest_recon() {
		return guest_recon;
	}
	public void setGuest_recon(String guest_recon) {
		this.guest_recon = guest_recon;
	}
	public String getMem_mnm() {
		return mem_mnm;
	}
	public void setMem_mnm(String mem_mnm) {
		this.mem_mnm = mem_mnm;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public int getGuest_no() {
		return guest_no;
	}
	public void setGuest_no(int guest_no) {
		this.guest_no = guest_no;
	}
	public String getGuest_con() {
		return guest_con;
	}
	public void setGuest_con(String guest_con) {
		this.guest_con = guest_con;
	}
	public Date getGuest_date() {
		return guest_date;
	}
	public void setGuest_date(Date guest_date) {
		this.guest_date = guest_date;
	}
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
}
