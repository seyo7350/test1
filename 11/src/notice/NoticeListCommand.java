package notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import qna.IQnACommand;

public class NoticeListCommand implements IQnACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		NoticeDAO nDAO = new NoticeDAO();
		List<NoticeDTO> noticeList = nDAO.noticeList();
		
		request.setAttribute("noticeList", noticeList);
		
		System.out.println(noticeList.toString());
	}

}
