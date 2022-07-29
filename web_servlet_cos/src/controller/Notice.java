package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.notice.NoticeList;
import command.notice.NoticeUpdate;
import command.notice.NoticeView;
import command.notice.NoticeWrite;
import common.InterExecute;

/**
 * Servlet implementation class Notice
 */
@WebServlet("/Notice")
public class Notice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Notice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String gubun = request.getParameter("t_gubun");
		if(gubun == null) {
			gubun = "list";
		}
		String viewPage = "";
		
		if(gubun.equals("list")) {
		
			InterExecute notice = new NoticeList();
			notice.execute(request, response);
			viewPage = "/notice/notice_list.jsp";
			
			
		}else if(gubun.equals("write")) {
			InterExecute notice = new NoticeWrite();
			notice.execute(request, response);
			viewPage = "/notice/notice_write.jsp";
		}else if(gubun.equals("view")) {
			InterExecute notice = new NoticeView();
			notice.execute(request, response);
			viewPage = "/notice/notice_view.jsp";
		}else if(gubun.equals("update")) {
			InterExecute notice = new NoticeUpdate();
			notice.execute(request, response);
			viewPage = "/notice/notice_update.jsp";
		}
		
		
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
