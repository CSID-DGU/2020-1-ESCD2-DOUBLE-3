package zx9.web.vo;

public class BlmsgVO {
	
private String Bid;
	private String Bdate;
	private int Brest;
	private int Binout;
	private String Buser;
	private String Bmemo;
	private int Bsequence;
	String fname;
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	//페이징 
	private int startrow;// 시작 행 번호
	private int endrow; // 끝 행 번호
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	public int getBsequence() {
		return Bsequence;
	}
	public void setBsequence(int bsequence) {
		Bsequence = bsequence;
	}
	public String getBmemo() {
		return Bmemo;
	}
	public void setBmemo(String bmemo) {
		Bmemo = bmemo;
	}
	public String getBid() {
		return Bid;
	}
	public void setBid(String bid) {
		Bid = bid;
	}
	public String getBdate() {
		return Bdate;
	}
	public void setBdate(String bdate) {
		Bdate = bdate;
	}
	public int getBrest() {
		return Brest;
	}
	public void setBrest(int brest) {
		Brest = brest;
	}
	public int getBinout() {
		return Binout;
	}
	public void setBinout(int binout) {
		Binout = binout;
	}
	public String getBuser() {
		return Buser;
	}
	public void setBuser(String buser) {
		Buser = buser;
	}
	
}
