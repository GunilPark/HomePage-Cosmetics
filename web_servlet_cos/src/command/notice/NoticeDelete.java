package command.notice;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonUtil;
import common.InterExecute;
import dao.Notice_dao;

public class NoticeDelete implements InterExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("t_no");
		Notice_dao dao = new Notice_dao();
		String delete_attach = request.getParameter("t_delete_attach");
		String file_dir = CommonUtil.getFile_dir_notice();
		if(!delete_attach.equals("")){
			File file = new File(file_dir,delete_attach);
			file.delete();
		}


		int result = dao.getDelete(no);
		String msg = "삭제되었습니다.";
		if(result != 1){
			msg = "삭제에 실패하였습니다.";
		}
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "/Notice");
		
		
	}

}
