package qna;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class QnAWriteCommand implements IQnACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String qna_author = request.getParameter("hname");
		String qna_pwd = request.getParameter("passwd");
		String qna_subhead = request.getParameter("subhead");
		String qna_title = request.getParameter("subject");
		String qna_content = request.getParameter("smarteditor");
		
		QnADAO qDAO = new QnADAO();
		
		/*qDAO.writeQnA(qna_author, qna_pwd, qna_subhead, qna_title, qna_content);*/
	}

}
