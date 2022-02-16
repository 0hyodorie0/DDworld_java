package ddw.vo;

import java.sql.Date;
import java.util.List;

public class PhotoVO {
	
	private int photo_no  ;
	private String dd_add    ;
	private String photo_pt  ;
	private String photo_con ;
	private Date photo_date;
	
	private List<PhotoreVO> photoreList;
	
	public List<PhotoreVO> getPhotoreList() {
		return photoreList;
	}
	public void setPhotoreList(List<PhotoreVO> photoreList) {
		this.photoreList = photoreList;
	}
	
	//--------------
	private String photo_renum    ;
	private int photo_no_1       ;
	private Date photo_redate   ;
	private String photo_recon    ;
	private String mem_id         ;
	                              
	public String getPhoto_renum() {
		return photo_renum;
	}
	public void setPhoto_renum(String photo_renum) {
		this.photo_renum = photo_renum;
	}
	public int getPhoto_no_1() {
		return photo_no_1;
	}
	public void setPhoto_no_1(int photo_no_1) {
		this.photo_no_1 = photo_no_1;
	}
	public Date getPhoto_redate() {
		return photo_redate;
	}
	public void setPhoto_redate(Date photo_redate) {
		this.photo_redate = photo_redate;
	}
	public String getPhoto_recon() {
		return photo_recon;
	}
	public void setPhoto_recon(String photo_recon) {
		this.photo_recon = photo_recon;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getPhoto_no() {
		return photo_no;
	}
	public void setPhoto_no(int photo_no) {
		this.photo_no = photo_no;
	}
	public String getDd_add() {
		return dd_add;
	}
	public void setDd_add(String dd_add) {
		this.dd_add = dd_add;
	}
	public String getPhoto_pt() {
		return photo_pt;
	}
	public void setPhoto_pt(String photo_pt) {
		this.photo_pt = photo_pt;
	}
	public String getPhoto_con() {
		return photo_con;
	}
	public void setPhoto_con(String photo_con) {
		this.photo_con = photo_con;
	}
	public Date getPhoto_date() {
		return photo_date;
	}
	public void setPhoto_date(Date photo_date) {
		this.photo_date = photo_date;
	}

}
