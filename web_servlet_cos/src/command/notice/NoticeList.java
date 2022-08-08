package command.notice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonUtil;
import common.InterExecute;
import dao.Notice_dao;
import dto.Notice_dto;

public class NoticeList implements InterExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Notice_dao dao = new Notice_dao();
		String select = request.getParameter("t_select");
		String search = request.getParameter("t_search");
		if(select == null) {
			select ="a.title";
			search ="";
		}
		
		// paging 설정 start
		String nowPage = request.getParameter("t_nowPage");
		int current_page = 0; // 현재페이지 번호
		int total_page = 0;    // 전체 페이지 수
		int total_count = dao.getTotalCount(select, search); // 전체 행수 21
		int list_setup_count = 10;  //한페이지당 출력 행수 
		int list_page_count  = 2;
		
		
		if(nowPage == null || nowPage.equals("")) current_page = 1; 
		else current_page = Integer.parseInt(nowPage);
		
		total_page = total_count / list_setup_count;  // 몫 : 2
		int rest = 	total_count % list_setup_count;   // 나머지:1
		if(rest !=0) total_page = total_page + 1;     // 3
		
		int start = (current_page -1) * list_setup_count + 1;
		int end   = current_page * list_setup_count;
		
		int order = total_count -((current_page-1)*list_setup_count);
		// paging 설정 end			
		String pageDisplay = 
				CommonUtil.pageListPost(current_page, total_page, list_page_count);
		
		ArrayList<Notice_dto> dtos = 
			dao.getList(select,search,start,end);
		
		System.out.println("total_count:" + total_count);
		
		
		request.setAttribute("t_total_count", total_count);
		request.setAttribute("t_order", order);
		request.setAttribute("t_dtos", dtos);
		request.setAttribute("t_select", select);
		request.setAttribute("t_search", search);
		request.setAttribute("t_pageDisplay", pageDisplay);
		
	}

}
