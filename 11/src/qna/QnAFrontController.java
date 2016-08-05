package qna;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.NoticeDetailCommand;
import notice.NoticeListCommand;
import notice.NoticeWriteCommand;


/**
 * Servlet implementation class BbsFrontController
 */
@WebServlet("*.do")
public class QnAFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnAFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		doPost(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// URI + contextPath = URL
		
		String requestURI = request.getRequestURI();
		System.out.println(requestURI);
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		String com = requestURI.substring(contextPath.length());
		System.out.println(com);
		
		IQnACommand icommand = null;
		String nextPage = null;
		
		// QnA 목록 보기
		if(com.equals("/qnaList.do")){
			icommand = new QnAListCommand();
			icommand.execute(request, response);
			nextPage = "qnaListPage.jsp";
		}
		
		
		/*// 페이징 처리
		if(com.equals("/qnaList.do")){
			icommand = new QnAPageCommand();
			icommand.execute(request, response);
			nextPage = "qnaListPaging.jsp";
		}*/
		
		
		// QnA 글쓰기 폼
		if(com.equals("/qnaWriteUI.do")){
			nextPage = "questionAndAnswer.jsp";
		}
		
		// QnA 글쓰기
		if(com.equals("/qnaWrite.do")){
			icommand = new QnAWriteCommand();
			icommand.execute(request, response);
			nextPage = "qnaListPage.jsp";
		}
		
		// 글 자세히 보기
		if(com.equals("/detail.do")) {
			icommand = new QnADetailCommand();
			icommand.execute(request, response);
			nextPage = "qnaDetail.jsp";
		}
		
		
		/////////////////////////////////////////////////////////////////////////////////
		
		// 공지사항 목록 보기
		if(com.equals("/noticeList.do")){
			icommand = new NoticeListCommand();
			icommand.execute(request, response);
			nextPage = "noticeListPage.jsp";
		}
		
		// 공지사항 글 쓰기폼
		if(com.equals("/noticeWriteUI.do")){
			nextPage = "notice.jsp";
		}
		
		// 공지사항 글 쓰기
		if(com.equals("/noticeWrite.do")){
			icommand = new NoticeWriteCommand();
			icommand.execute(request, response);
			nextPage = "noticeList.do";
			/*response.sendRedirect("noticeListPage.jsp");*/
		}
		
		// 공지글 자세히 보기
		if(com.equals("/noticeView.do")){
			icommand = new NoticeDetailCommand();
			icommand.execute(request, response);
			nextPage = "noticeDetail.jsp";
		}
		
		/////////////////////////////////////////////
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
		
		
	}

}
