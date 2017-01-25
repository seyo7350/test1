package Master;

public class MasterDTO {
	private int p_seq;
	private int e_idennum;
	private String p_start;
	private String p_end;
	private String p_position;
	public int getP_seq() {
		return p_seq;
	}
	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}
	public int getE_idennum() {
		return e_idennum;
	}
	public void setE_idennum(int e_idennum) {
		this.e_idennum = e_idennum;
	}
	public String getP_start() {
		return p_start;
	}
	public void setP_start(String p_start) {
		this.p_start = p_start;
	}
	public String getP_end() {
		return p_end;
	}
	public void setP_end(String p_end) {
		this.p_end = p_end;
	}
	public String getP_position() {
		return p_position;
	}
	public void setP_position(String p_position) {
		this.p_position = p_position;
	}
	
	public MasterDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public MasterDTO(int p_seq, int e_idennum, String p_start, String p_end, String p_position) {
		super();
		this.p_seq = p_seq;
		this.e_idennum = e_idennum;
		this.p_start = p_start;
		this.p_end = p_end;
		this.p_position = p_position;
	}
	
	@Override
	public String toString() {
		return "MasterDTO [p_seq=" + p_seq + ", e_idennum=" + e_idennum + ", p_start=" + p_start + ", p_end=" + p_end
				+ ", p_position=" + p_position + "]";
	}
	
	
}
