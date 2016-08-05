package qnaReply;

import java.io.Serializable;

public class AdminReplyDTO implements Serializable{

	private int qnaAnswer_num;
	private int qna_num;
	private String qnaAnswer_author;
	private String qnaAnswer_pwd;
	private String qnaAnswer_content;
	private String qnaAnswer_writeday;
	
	public AdminReplyDTO() {
		// TODO Auto-generated constructor stub
	}

	public AdminReplyDTO(int qnaAnswer_num, int qna_num, String qnaAnswer_author, String qnaAnswer_pwd,
			String qnaAnswer_content, String qnaAnswer_writeday) {
		super();
		this.qnaAnswer_num = qnaAnswer_num;
		this.qna_num = qna_num;
		this.qnaAnswer_author = qnaAnswer_author;
		this.qnaAnswer_pwd = qnaAnswer_pwd;
		this.qnaAnswer_content = qnaAnswer_content;
		this.qnaAnswer_writeday = qnaAnswer_writeday;
	}

	public int getQnaAnswer_num() {
		return qnaAnswer_num;
	}

	public void setQnaAnswer_num(int qnaAnswer_num) {
		this.qnaAnswer_num = qnaAnswer_num;
	}

	public int getQna_num() {
		return qna_num;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}

	public String getQnaAnswer_author() {
		return qnaAnswer_author;
	}

	public void setQnaAnswer_author(String qnaAnswer_author) {
		this.qnaAnswer_author = qnaAnswer_author;
	}

	public String getQnaAnswer_pwd() {
		return qnaAnswer_pwd;
	}

	public void setQnaAnswer_pwd(String qnaAnswer_pwd) {
		this.qnaAnswer_pwd = qnaAnswer_pwd;
	}

	public String getQnaAnswer_content() {
		return qnaAnswer_content;
	}

	public void setQnaAnswer_content(String qnaAnswer_content) {
		this.qnaAnswer_content = qnaAnswer_content;
	}

	public String getQnaAnswer_writeday() {
		return qnaAnswer_writeday;
	}

	public void setQnaAnswer_writeday(String qnaAnswer_writeday) {
		this.qnaAnswer_writeday = qnaAnswer_writeday;
	}

	@Override
	public String toString() {
		return "AdminReplyDTO [qnaAnswer_num=" + qnaAnswer_num + ", qna_num=" + qna_num + ", qnaAnswer_author="
				+ qnaAnswer_author + ", qnaAnswer_pwd=" + qnaAnswer_pwd + ", qnaAnswer_content=" + qnaAnswer_content
				+ ", qnaAnswer_writeday=" + qnaAnswer_writeday + "]";
	}
	
	
}
