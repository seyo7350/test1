package Project;

public class ProjectDTO {

	private int p_seq;
	private String p_name;
	private String p_cont;
	private int p_cnt;
	private String p_skill;
	private String p_order;
	public int getP_seq() {
		return p_seq;
	}
	public void setP_seq(int p_seq) {
		this.p_seq = p_seq;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_cont() {
		return p_cont;
	}
	public void setP_cont(String p_cont) {
		this.p_cont = p_cont;
	}
	public int getP_cnt() {
		return p_cnt;
	}
	public void setP_cnt(int p_cnt) {
		this.p_cnt = p_cnt;
	}
	public String getP_skill() {
		return p_skill;
	}
	public void setP_skill(String p_skill) {
		this.p_skill = p_skill;
	}
	public String getP_order() {
		return p_order;
	}
	public void setP_order(String p_order) {
		this.p_order = p_order;
	}
	public ProjectDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public ProjectDTO(int p_seq, String p_name, String p_cont, int p_cnt, String p_skill, String p_order) {
		super();
		this.p_seq = p_seq;
		this.p_name = p_name;
		this.p_cont = p_cont;
		this.p_cnt = p_cnt;
		this.p_skill = p_skill;
		this.p_order = p_order;
	}
	
	@Override
	public String toString() {
		return "ProjectDTO [p_seq=" + p_seq + ", p_name=" + p_name + ", p_cont=" + p_cont + ", p_cnt=" + p_cnt
				+ ", p_skill=" + p_skill + ", p_order=" + p_order + "]";
	}
	
	
	
}
