package command.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.InterExecute;
import dao.Notice_dao;
import dto.Notice_dto;

public class NoticeUpdate implements InterExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Notice_dao dao = new Notice_dao();
		String no = request.getParameter("t_no");
		Notice_dto dto = dao.getView(no);
		
		request.setAttribute("t_dto", dto);

	}

}
