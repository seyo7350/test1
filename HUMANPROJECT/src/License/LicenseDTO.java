package License;

public class LicenseDTO {
	private int l_seq;
	private int e_idennum;
	private String l_name;
	private String l_day;
	private String l_num;
	public int getL_seq() {
		return l_seq;
	}
	public void setL_seq(int l_seq) {
		this.l_seq = l_seq;
	}
	public int getE_idennum() {
		return e_idennum;
	}
	public void setE_idennum(int e_idennum) {
		this.e_idennum = e_idennum;
	}
	public String getL_name() {
		return l_name;
	}
	public void setL_name(String l_name) {
		this.l_name = l_name;
	}
	public String getL_day() {
		return l_day;
	}
	public void setL_day(String l_day) {
		this.l_day = l_day;
	}
	public String getL_num() {
		return l_num;
	}
	public void setL_num(String l_num) {
		this.l_num = l_num;
	}
	
	public LicenseDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public LicenseDTO(int l_seq, int e_idennum, String l_name, String l_day, String l_num) {
		super();
		this.l_seq = l_seq;
		this.e_idennum = e_idennum;
		this.l_name = l_name;
		this.l_day = l_day;
		this.l_num = l_num;
	}
	
	@Override
	public String toString() {
		return "LicenseDTO [l_seq=" + l_seq + ", e_idennum=" + e_idennum + ", l_name=" + l_name + ", l_day=" + l_day
				+ ", l_num=" + l_num + "]";
	}
	
	
}
