package command.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.InterExecute;
import dao.Notice_dao;
import dto.Notice_dto;

public class NoticeView implements InterExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Notice_dao dao = new Notice_dao();
		String no = request.getParameter("t_no");
		dao.setHitCount(no);
		Notice_dto dto = dao.getView(no);
		
		Notice_dto preDto = dao.getPreNO(no);
		Notice_dto nextDto = dao.getNextNO(no);

		request.setAttribute("t_preDto", preDto);
		request.setAttribute("t_nextDto", nextDto);
		request.setAttribute("t_dto", dto);
		

	}

}
