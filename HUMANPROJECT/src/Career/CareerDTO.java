package Career;

public class CareerDTO {
	private int c_seq;
	private int e_idennum;
	private String c_name;
	private String c_rank;
	private String c_start;
	private String c_end;
	public int getC_seq() {
		return c_seq;
	}
	public void setC_seq(int c_seq) {
		this.c_seq = c_seq;
	}
	public int getE_idennum() {
		return e_idennum;
	}
	public void setE_idennum(int e_idennum) {
		this.e_idennum = e_idennum;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_rank() {
		return c_rank;
	}
	public void setC_rank(String c_rank) {
		this.c_rank = c_rank;
	}
	public String getC_start() {
		return c_start;
	}
	public void setC_start(String c_start) {
		this.c_start = c_start;
	}
	public String getC_end() {
		return c_end;
	}
	public void setC_end(String c_end) {
		this.c_end = c_end;
	}
	
	public CareerDTO(int c_seq, int e_idennum, String c_name, String c_rank, String c_start, String c_end) {
		super();
		this.c_seq = c_seq;
		this.e_idennum = e_idennum;
		this.c_name = c_name;
		this.c_rank = c_rank;
		this.c_start = c_start;
		this.c_end = c_end;
	}
	
	@Override
	public String toString() {
		return "CareerDTO [c_seq=" + c_seq + ", e_idennum=" + e_idennum + ", c_name=" + c_name + ", c_rank=" + c_rank
				+ ", c_start=" + c_start + ", c_end=" + c_end + "]";
	}
	
	
}
