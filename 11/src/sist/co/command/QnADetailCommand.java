package sist.co.command;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sist.co.dao.QnADAO;
import sist.co.dto.QnADTO;

public class QnADetailCommand implements IQnACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

	/*	try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		System.out.println("12312391827397");
		String _qna_num = request.getParameter("seq");
		System.out.println(_qna_num+"!!!!!!!!!!!!!!!!!!!!!!!");
		
		QnADAO qDAO = new QnADAO();
		QnADTO qDTO = qDAO.qnaDetail(_qna_num);
		
		request.setAttribute("detail", qDTO);
	}

}
