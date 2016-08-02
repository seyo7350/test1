package notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.IQnACommand;

public class NoticeDetailCommand implements IQnACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

	String _notice_num  = request.getParameter("seq");
	
	NoticeDAO nDAO = new NoticeDAO();
	NoticeDTO nDTO = nDAO.noticeDetail(_notice_num);
	
	request.setAttribute("noticeDetail", nDTO);
		
	}

}
