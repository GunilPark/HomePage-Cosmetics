package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.InterExecute;
import dao.Member_dao;
import dto.Member_dto;

public class DBMemberUpdateSave implements InterExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		Member_dao dao = new Member_dao();
		String  id            = request.getParameter("t_id");
		String  name          = request.getParameter("t_name");
		String  password      = "";
		int	pwSize		  	  = password.length();
		String  area          = request.getParameter("t_area");
		String  address       = request.getParameter("t_address");
		String  tell_1        = request.getParameter("t_tel1");
		String  tell_2        = request.getParameter("t_tel2");
		String  tell_3        = request.getParameter("t_tel3");
		String  gender        = request.getParameter("t_gender");
		String  hobby_travel  = request.getParameter("t_hobby_travel");
		String  hobby_reading = request.getParameter("t_hobby_reading");
		String  hobby_sports  = request.getParameter("t_hobby_sports");
		

		if(hobby_travel == null) hobby_travel ="n";
		if(hobby_reading == null) hobby_reading ="n";
		if(hobby_sports == null) hobby_sports ="n";
		
		Member_dto dto = 
			new Member_dto(id,name,password,pwSize,area,address,tell_1,tell_2,tell_3,
					gender,hobby_travel,hobby_reading,hobby_sports,
					"","","","");	
		
		int result = dao.memberUpdate(dto);
		String msg ="정보수정 실패하였습니다. 관리자에게 문의바랍니다.";
		if(result == 1) {
			msg =name+"님 회원정보 수정 되었습니다.";
		}
		
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "/Index");
		
	}

}
