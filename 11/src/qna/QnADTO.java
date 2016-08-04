package qna;

import java.io.Serializable;

public class QnADTO implements Serializable{

	private int qna_num;
	private String qna_author;
	private String qna_pwd;
	private String qna_subhead;
	private String qna_title;
	private String qna_content;
	private String qna_writeday;
	private int qna_readCnt;
	private int qna_important;
	private int qna_product_seq;

	public QnADTO() {
		// TODO Auto-generated constructor stub
	}

	public QnADTO(int qna_num, String qna_author, String qna_pwd, String qna_subhead, String qna_title,
			String qna_content, String qna_writeday, int qna_readCnt, int qna_important, int qna_product_seq) {
		super();
		this.qna_num = qna_num;
		this.qna_author = qna_author;
		this.qna_pwd = qna_pwd;
		this.qna_subhead = qna_subhead;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_writeday = qna_writeday;
		this.qna_readCnt = qna_readCnt;
		this.qna_important = qna_important;
		this.qna_product_seq = qna_product_seq;
	}

	public int getQna_num() {
		return qna_num;
	}

	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}

	public String getQna_author() {
		return qna_author;
	}

	public void setQna_author(String qna_author) {
		this.qna_author = qna_author;
	}

	public String getQna_pwd() {
		return qna_pwd;
	}

	public void setQna_pwd(String qna_pwd) {
		this.qna_pwd = qna_pwd;
	}

	public String getQna_subhead() {
		return qna_subhead;
	}

	public void setQna_subhead(String qna_subhead) {
		this.qna_subhead = qna_subhead;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_writeday() {
		return qna_writeday;
	}

	public void setQna_writeday(String qna_writeday) {
		this.qna_writeday = qna_writeday;
	}

	public int getQna_readCnt() {
		return qna_readCnt;
	}

	public void setQna_readCnt(int qna_readCnt) {
		this.qna_readCnt = qna_readCnt;
	}

	public int getQna_important() {
		return qna_important;
	}

	public void setQna_important(int qna_important) {
		this.qna_important = qna_important;
	}
	
	public int getQna_product_seq() {
		return qna_product_seq;
	}

	public void setQna_product_seq(int qna_product_seq) {
		this.qna_product_seq = qna_product_seq;
	}

	@Override
	public String toString() {
		return "QnADTO [qna_num=" + qna_num + ", qna_author=" + qna_author + ", qna_pwd=" + qna_pwd + ", qna_subhead="
				+ qna_subhead + ", qna_title=" + qna_title + ", qna_content=" + qna_content + ", qna_writeday="
				+ qna_writeday + ", qna_readCnt=" + qna_readCnt + ", qna_important=" + qna_important
				+ ", qna_product_seq=" + qna_product_seq + "]";
	}

	
}
