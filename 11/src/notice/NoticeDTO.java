package notice;

public class NoticeDTO {

	private int notice_num;
	private String notice_author;
	private String notice_pwd;
	private String notice_title;
	private String notice_content;
	private String notice_writeday;
	private int notice_readCnt;
	private int notice_important;
	
	public NoticeDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public NoticeDTO(int notice_num, String notice_author, String notice_pwd, String notice_title,
			String notice_content, String notice_writeday, int notice_readCnt, int notice_important) {
		super();
		this.notice_num = notice_num;
		this.notice_author = notice_author;
		this.notice_pwd = notice_pwd;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_writeday = notice_writeday;
		this.notice_readCnt = notice_readCnt;
		this.notice_important = notice_important;
	}

	public int getNotice_num() {
		return notice_num;
	}

	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}

	public String getNotice_author() {
		return notice_author;
	}

	public void setNotice_author(String notice_author) {
		this.notice_author = notice_author;
	}

	public String getNotice_pwd() {
		return notice_pwd;
	}

	public void setNotice_pwd(String notice_pwd) {
		this.notice_pwd = notice_pwd;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_writeday() {
		return notice_writeday;
	}

	public void setNotice_writeday(String notice_writeday) {
		this.notice_writeday = notice_writeday;
	}

	public int getNotice_readCnt() {
		return notice_readCnt;
	}

	public void setNotice_readCnt(int notice_readCnt) {
		this.notice_readCnt = notice_readCnt;
	}

	public int getNotice_important() {
		return notice_important;
	}

	public void setNotice_important(int notice_important) {
		this.notice_important = notice_important;
	}

	@Override
	public String toString() {
		return "NoticeDTO [notice_num=" + notice_num + ", notice_author=" + notice_author + ", notice_pwd=" + notice_pwd
				+ ", notice_title=" + notice_title + ", notice_content=" + notice_content + ", notice_writeday="
				+ notice_writeday + ", notice_readCnt=" + notice_readCnt + ", notice_important=" + notice_important
				+ "]";
	}
	
	
}
