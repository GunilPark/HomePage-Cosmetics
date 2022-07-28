package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.member.DBMemberSave;
import command.member.DBMemberUpdateSave;
import command.member.MemberLogin;
import command.member.MemberLogout;
import command.member.MemberMyPage;
import command.member.MemberSendPw;
import command.member.MemberUpdate;
import common.InterExecute;
import dao.Member_dao;

/**
 * Servlet implementation class Member
 */
@WebServlet("/Member")
public class Member extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Member_dao dao = new Member_dao();
		String newPassword = dao.getNewPassword(3);
		
		
		
		
		
		String gubun = request.getParameter("t_gubun");
		if(gubun == null) {
			gubun = "login";
		}
		String viewPage = "";
		
		switch(gubun) {
		case "login":
			//로그인 페이지
			viewPage = "/member/member_login.jsp";
			break;
		
		case "join":
			//가입 페이지
			viewPage = "/member/member_join.jsp";
			
			break;
			
		case "myPage":
			//마이 페이지
			InterExecute memMyPage = new MemberMyPage();
			memMyPage.execute(request, response);
			viewPage = "/member/member_mypage.jsp";
			
			break;
			
		case "findPw":
			viewPage = "/member/member_find_pw.jsp";
			
			break;
		case "update":
			//회원가입
			InterExecute memUpdate = new MemberUpdate();
			memUpdate.execute(request, response);
			viewPage = "/member/member_update.jsp";
			break;
			
		case "memberUpdate":
			//회원가입
			InterExecute memUpdateSave = new DBMemberUpdateSave();
			memUpdateSave.execute(request, response);
			viewPage = "/common_alert_page.jsp";
			break;
			
		case "memberSave":
			//회원가입
			InterExecute memSave = new DBMemberSave();
			memSave.execute(request, response);
			viewPage = "/common_alert_page.jsp";
			break;
			
		case "memberLogin":
			//로그인
			InterExecute memlogin = new MemberLogin();
			memlogin.execute(request, response);
			viewPage = "common_alert_page.jsp";
			break;
			
		case "logout":
			//로그아웃
			InterExecute memlogout = new MemberLogout();
			memlogout.execute(request, response);
			viewPage = "common_alert_page.jsp";
			break;
		case "memberSendPw":
			//메일로 비밀번호 보내기
			InterExecute memberSendPw = new MemberSendPw();
			memberSendPw.execute(request, response);
			viewPage = "common_alert_page.jsp";
			break;	
			
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
