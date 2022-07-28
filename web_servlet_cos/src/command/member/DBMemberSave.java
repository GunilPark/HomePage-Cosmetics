package command.member;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonUtil;
import common.InterExecute;
import dao.Member_dao;
import dto.Member_dto;

public class DBMemberSave implements InterExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Member_dao dao = new Member_dao();
		String  id            = request.getParameter("t_id");
		String  name          = request.getParameter("t_name");
		String pw = null;
		try {
			pw = dao.encryptSHA256(request.getParameter("t_pw"));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int  pw_lenght	  	  = request.getParameter("t_pw").length();
		String  area          = request.getParameter("t_area");
		String  address       = request.getParameter("t_address");
		String  tel1        = request.getParameter("t_tel1");
		String  tel2        = request.getParameter("t_tel2");
		String  tel3        = request.getParameter("t_tel3");
		String  gender        = request.getParameter("t_gender");
		String  hobby_travel  = request.getParameter("t_hobby_travel");
		String  hobby_reading = request.getParameter("t_hobby_reading");
		String  hobby_sports  = request.getParameter("t_hobby_sports");
		String  reg_date      = CommonUtil.getToday();
		
		System.out.print(pw_lenght);
		if(hobby_travel == null) hobby_travel ="n";
		if(hobby_reading == null) hobby_reading ="n";
		if(hobby_sports == null) hobby_sports ="n";
		
		Member_dto dto = 
			new Member_dto(id,name,pw,pw_lenght,area,address,tel1,tel2,tel3,
					gender,hobby_travel,hobby_reading,hobby_sports,
					reg_date,"","","");
		
		int result = dao.memberSave(dto);
		String msg = "";
		if(result == 1) msg = name+"님 회원가입 되었습니다.";
		else msg ="회원가입 실패. 관리자에게 문의바랍니다.";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "/Index");
	}

}
