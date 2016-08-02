package qna;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class QnAListCommand implements IQnACommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		QnADAO qDAO = new QnADAO();
		
		List<QnADTO> qnaList = qDAO.qnaList();
		
		request.setAttribute("qnaList", qnaList);
		System.out.println(qnaList.toString());
	}

}
