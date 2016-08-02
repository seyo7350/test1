package notice;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.IQnACommand;

public class NoticeWriteCommand implements IQnACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String notice_author = request.getParameter("hname");
		String notice_pwd = request.getParameter("passwd");
		String notice_title = request.getParameter("subject");
		String notice_content = request.getParameter("smarteditor");
		
		NoticeDAO nDAO = new NoticeDAO();
		
		nDAO.writeNotice(notice_author, notice_pwd, notice_title, notice_content);
		
		
	}

}
