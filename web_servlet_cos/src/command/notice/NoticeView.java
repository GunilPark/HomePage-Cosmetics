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
		System.out.println("no 번호: " + no);
		System.out.println("프리 넘버"+preDto.getNo());
		System.out.println("프리 타이틀"+preDto.getTitle());
		System.out.println("넥스트 넘버"+nextDto.getNo());
		System.out.println("넥스트 타이틀"+nextDto.getTitle());
		request.setAttribute("t_preDto", preDto);
		request.setAttribute("t_nextDto", nextDto);
		request.setAttribute("t_dto", dto);
		

	}

}
