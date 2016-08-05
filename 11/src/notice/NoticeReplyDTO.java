package notice;

import java.io.Serializable;

public class NoticeReplyDTO implements Serializable{

	private int noticeAnswer_num;
	private int noticeAnswer_notice_num;
	private String noticeAnswer_author;
	private String noticeAnswer_pwd;
	private String noticeAnswer_content;
	private String noticeAnswer_writeday;
	
	public NoticeReplyDTO() {
		// TODO Auto-generated constructor stub
	}

	public NoticeReplyDTO(int noticeAnswer_num, int noticeAnswer_notice_num, String noticeAnswer_author,
			String noticeAnswer_pwd, String noticeAnswer_content, String noticeAnswer_writeday) {
		super();
		this.noticeAnswer_num = noticeAnswer_num;
		this.noticeAnswer_notice_num = noticeAnswer_notice_num;
		this.noticeAnswer_author = noticeAnswer_author;
		this.noticeAnswer_pwd = noticeAnswer_pwd;
		this.noticeAnswer_content = noticeAnswer_content;
		this.noticeAnswer_writeday = noticeAnswer_writeday;
	}

	public int getNoticeAnswer_num() {
		return noticeAnswer_num;
	}

	public void setNoticeAnswer_num(int noticeAnswer_num) {
		this.noticeAnswer_num = noticeAnswer_num;
	}

	public int getNoticeAnswer_notice_num() {
		return noticeAnswer_notice_num;
	}

	public void setNoticeAnswer_notice_num(int noticeAnswer_notice_num) {
		this.noticeAnswer_notice_num = noticeAnswer_notice_num;
	}

	public String getNoticeAnswer_author() {
		return noticeAnswer_author;
	}

	public void setNoticeAnswer_author(String noticeAnswer_author) {
		this.noticeAnswer_author = noticeAnswer_author;
	}

	public String getNoticeAnswer_pwd() {
		return noticeAnswer_pwd;
	}

	public void setNoticeAnswer_pwd(String noticeAnswer_pwd) {
		this.noticeAnswer_pwd = noticeAnswer_pwd;
	}

	public String getNoticeAnswer_content() {
		return noticeAnswer_content;
	}

	public void setNoticeAnswer_content(String noticeAnswer_content) {
		this.noticeAnswer_content = noticeAnswer_content;
	}

	public String getNoticeAnswer_writeday() {
		return noticeAnswer_writeday;
	}

	public void setNoticeAnswer_writeday(String noticeAnswer_writeday) {
		this.noticeAnswer_writeday = noticeAnswer_writeday;
	}

	@Override
	public String toString() {
		return "NoticeReplyDTO [noticeAnswer_num=" + noticeAnswer_num + ", noticeAnswer_notice_num="
				+ noticeAnswer_notice_num + ", noticeAnswer_author=" + noticeAnswer_author + ", noticeAnswer_pwd="
				+ noticeAnswer_pwd + ", noticeAnswer_content=" + noticeAnswer_content + ", noticeAnswer_writeday="
				+ noticeAnswer_writeday + "]";
	}

	
	
}