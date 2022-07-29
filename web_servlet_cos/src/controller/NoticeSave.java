package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.CommonUtil;
import dao.Notice_dao;
import dto.Notice_dto;

/**
 * Servlet implementation class NoticeSave
 */
@WebServlet("/NoticeSave")
public class NoticeSave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSave() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Notice_dao dao = new Notice_dao();
		String file_dir =CommonUtil.getFile_dir_notice();
		int sizeLimit = 1024 * 1024 * 10; //10메가 바이트.
		
		//파라메터 값 (request, 경로, 용량, utf-8(한글화),muntipart생성자).
		MultipartRequest mpr = new MultipartRequest(request,file_dir,sizeLimit,"utf-8",new DefaultFileRenamePolicy()); 
		String attachName = mpr.getFilesystemName("t_attach");
		if(attachName == null){
			attachName = "";
		}
		String maxNo    = dao.getMaxNo(); // N000
		String no       = CommonUtil.getNewNo("N000", maxNo);
		String title	= mpr.getParameter("t_title");
		String content	= mpr.getParameter("t_content");
		HttpSession session = request.getSession();
		String reg_id   = (String)session.getAttribute("sessionId");
		String reg_date = CommonUtil.getToday();


		Notice_dto dto = new Notice_dto(no,title,content,attachName,"",reg_id,reg_date);
		int result = dao.noticeSave(dto);
		
		String msg = "등록 되었습니다.";
		if(result != 1) msg ="등록 실패!";
		
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "/Notice");
		
		RequestDispatcher rd = request.getRequestDispatcher("/common_alert_page.jsp");
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
