package sist.co.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sist.co.dao.QnADAO;
import sist.co.dto.PageDTO;

public class QnAPageCommand implements IQnACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int curPage = 1;
		
		if(request.getParameter("curPage") != null) {
			curPage = Integer.parseInt(request.getParameter("curPage"));
			
		}
		
		QnADAO qDAO = new QnADAO();
		PageDTO pageList = qDAO.page(curPage);
		
		request.setAttribute("pageList", pageList.getpList());
		
		request.setAttribute("page", pageList);
		
	}

}
