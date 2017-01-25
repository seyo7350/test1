package Employee;

public class EmployeeDTO {
	private int e_seq;
	private String e_idennum; 
	private String e_name;
	private String e_salray; 
	private int e_rank; 
	private int e_part; 
	private String e_post; 
	private String e_add; 
	private String e_dadd; 
	private String e_email; 
	private String e_iden; 
	private String e_phone; 
	private String e_pass; 
	private String e_image; 
	private int e_out;

	public int getE_seq() {
		return e_seq;
	}

	public void setE_seq(int e_seq) {
		this.e_seq = e_seq;
	}

	public String getE_idennum() {
		return e_idennum;
	}

	public void setE_idennum(String e_idennum) {
		this.e_idennum = e_idennum;
	}

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
	}

	public String getE_salray() {
		return e_salray;
	}

	public void setE_salray(String e_salray) {
		this.e_salray = e_salray;
	}

	public int getE_rank() {
		return e_rank;
	}

	public void setE_rank(int e_rank) {
		this.e_rank = e_rank;
	}

	public int getE_part() {
		return e_part;
	}

	public void setE_part(int e_part) {
		this.e_part = e_part;
	}


	public String getE_post() {
		return e_post;
	}


	public void setE_post(String e_post) {
		this.e_post = e_post;
	}


	public String getE_add() {
		return e_add;
	}


	public void setE_add(String e_add) {
		this.e_add = e_add;
	}


	public String getE_dadd() {
		return e_dadd;
	}


	public void setE_dadd(String e_dadd) {
		this.e_dadd = e_dadd;
	}


	public String getE_email() {
		return e_email;
	}


	public void setE_email(String e_email) {
		this.e_email = e_email;
	}

	public String getE_iden() {
		return e_iden;
	}

	public void setE_iden(String e_iden) {
		this.e_iden = e_iden;
	}

	public String getE_phone() {
		return e_phone;
	}

	public void setE_phone(String e_phone) {
		this.e_phone = e_phone;
	}

	public String getE_pass() {
		return e_pass;
	}

	public void setE_pass(String e_pass) {
		this.e_pass = e_pass;
	}

	public String getE_image() {
		return e_image;
	}

	public void setE_image(String e_image) {
		this.e_image = e_image;
	}

	public int getE_out() {
		return e_out;
	}

	public void setE_out(int e_out) {
		this.e_out = e_out;
	}

	public EmployeeDTO() {
		
	}

	public EmployeeDTO(int e_seq, String e_idennum, String e_name, String e_salray, int e_rank, int e_part, String e_post,
			String e_add, String e_dadd, String e_email, String e_iden, String e_phone, String e_pass, String e_image,
			int e_out) {
		super();
		this.e_seq = e_seq;
		this.e_idennum = e_idennum;
		this.e_name = e_name;
		this.e_salray = e_salray;
		this.e_rank = e_rank;
		this.e_part = e_part;
		this.e_post = e_post;
		this.e_add = e_add;
		this.e_dadd = e_dadd;
		this.e_email = e_email;
		this.e_iden = e_iden;
		this.e_phone = e_phone;
		this.e_pass = e_pass;
		this.e_image = e_image;
		this.e_out = e_out;
	}



	@Override
	public String toString() {
		return "EmployeeDTO [e_seq=" + e_seq + ", e_idennum=" + e_idennum + ", e_name=" + e_name + ", e_salray="
				+ e_salray + ", e_rank=" + e_rank + ", e_part=" + e_part + ", e_post=" + e_post + ", e_add=" + e_add
				+ ", e_dadd=" + e_dadd + ", e_email=" + e_email + ", e_iden=" + e_iden + ", e_phone=" + e_phone
				+ ", e_pass=" + e_pass + ", e_image=" + e_image + ", e_out=" + e_out + "]";
	}
	
	
	
	
	
}
