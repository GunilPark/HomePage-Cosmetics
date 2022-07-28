package command.notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonUtil;
import common.InterExecute;
import dao.Notice_dao;

public class NoticeWrite implements InterExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String toDay = CommonUtil.getToday();
		
		request.setAttribute("toDay", toDay);
		
	}

}
