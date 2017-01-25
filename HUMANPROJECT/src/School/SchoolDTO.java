package School;

public class SchoolDTO {
	private int s_seq;
	private int e_idennum;
	private String s_name;
	private String s_major;
	private String s_start;
	private String s_end;
	public int getS_seq() {
		return s_seq;
	}
	public void setS_seq(int s_seq) {
		this.s_seq = s_seq;
	}
	public int getE_idennum() {
		return e_idennum;
	}
	public void setE_idennum(int e_idennum) {
		this.e_idennum = e_idennum;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_major() {
		return s_major;
	}
	public void setS_major(String s_major) {
		this.s_major = s_major;
	}
	public String getS_start() {
		return s_start;
	}
	public void setS_start(String s_start) {
		this.s_start = s_start;
	}
	public String getS_end() {
		return s_end;
	}
	public void setS_end(String s_end) {
		this.s_end = s_end;
	}
	
	public SchoolDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public SchoolDTO(int s_seq, int e_idennum, String s_name, String s_major, String s_start, String s_end) {
		super();
		this.s_seq = s_seq;
		this.e_idennum = e_idennum;
		this.s_name = s_name;
		this.s_major = s_major;
		this.s_start = s_start;
		this.s_end = s_end;
	}
	@Override
	public String toString() {
		return "SchoolDTO [s_seq=" + s_seq + ", e_idennum=" + e_idennum + ", s_name=" + s_name + ", s_major=" + s_major
				+ ", s_start=" + s_start + ", s_end=" + s_end + "]";
	}
	
	
}
