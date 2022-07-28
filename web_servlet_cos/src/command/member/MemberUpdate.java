package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.InterExecute;
import dao.Member_dao;
import dto.Member_dto;

public class MemberUpdate implements InterExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Member_dao dao = new Member_dao();
		HttpSession session = request.getSession(true);
		String id = (String) session.getAttribute("sessionId");

		System.out.println("id" + id);
		Member_dto dto = null;
		String lenght = "";
		if (id != "") {
			dto = dao.getMemberView(id);
			for(int k = 0; k < dto.getPw_lenght(); k++) {
				lenght += "*";
			}
			request.setAttribute("t_lenght", lenght);	
			request.setAttribute("t_dto", dto);

			if (dto.getHobby_reading().equals("y")) {
				request.setAttribute("t_reading", "독서");
			}
			if (dto.getHobby_sports().equals("y")) {
				request.setAttribute("t_sports", "운동");
			}
			if (dto.getHobby_travel().equals("y")) {
				request.setAttribute("t_travel", "여행");
			}
			
		}

	}

}
