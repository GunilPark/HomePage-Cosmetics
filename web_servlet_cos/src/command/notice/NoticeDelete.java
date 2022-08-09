package command.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.InterExecute;
import dao.Notice_dao;

public class NoticeDelete implements InterExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Notice_dao dao = new Notice_dao();
		String no = request.getParameter("t_no");
		int k = dao.getDelete(no);
		String msg = "실패";
		String url = "Notice";
		if(k==1) {
			msg = "삭제성공";
		}
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", url);
		
		
	}

}
