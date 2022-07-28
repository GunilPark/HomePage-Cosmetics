package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.InterExecute;

public class MemberLogout implements InterExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(true);
		String name = (String)session.getAttribute("sessionName");
		String msg = name + "님 로그아웃되셨습니다.";
		session.invalidate();
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "/Index");
	}

}
