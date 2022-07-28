package command.member;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.InterExecute;
import dao.Member_dao;

public class MemberLogin implements InterExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Member_dao dao = new Member_dao();
		String id 		= request.getParameter("t_id");
		String pw = null;
		try {
			pw = dao.encryptSHA256(request.getParameter("t_pw"));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//String loginName = dao.checkLogin(id, password);
		ArrayList<String> info = dao.checkLogin(id, pw);
		String msg="";
		String url="";
		if(info.size() == 0){
			msg ="ID나 비밀번호가 맞지 않습니다.";
			url = "/Member";
		}else{
			String loginName  = info.get(0);
			String loginLevel = info.get(1);
			msg =loginName+"님 환영합니다.";
			url ="/Index";
			
			HttpSession session = request.getSession(true);
			
			session.setAttribute("sessionId", id);
			session.setAttribute("sessionName", loginName);
			session.setAttribute("sessionLevel", loginLevel);
			session.setMaxInactiveInterval(60 * 30);
		}
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", url);
	}

}
