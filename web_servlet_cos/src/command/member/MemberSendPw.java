package command.member;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.InterExecute;
import common.MailContentSend;
import dao.Member_dao;

public class MemberSendPw implements InterExecute {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		Member_dao dao = new Member_dao();
		String id		= request.getParameter("t_id");
		String tel_1	= request.getParameter("t_tel_1");
		String tel_2	= request.getParameter("t_tel_2");
		String tel_3	= request.getParameter("t_tel_3");
		String mail_1	= request.getParameter("t_mail_1");
		String mail_2	= request.getParameter("t_mail_2");
		
		String memberName = dao.getMemberName(id,tel_1,tel_2,tel_3);
		String msg = "";
		if(memberName.contentEquals("")) {
			msg = "입력하신 정보가 정확하지 않습니다.";
		} else {
			
			
			
			//메일보내기 
			String pw = dao.getNewPassword(4);
			int result = 0;
			try {
				String newPassword = dao.encryptSHA256(pw);
				result = dao.memberPasswordUpdate(id, newPassword);
			} catch (NoSuchAlgorithmException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			
			
			boolean tf=true;
			
			String mailSet_Server="smtp.naver.com"; // 보내는 메일 server
			String mailSet_ID="pki320";        // 보내는 메일 ID
			String mailSet_PW="ichi1!nav";        // 보내는 메일 비밀번호
			
			String mailFromName ="인재개발원입니다";            // 보내는 사람 이름
			String mailFromAddress ="<pki320@naver.com>"; // 보내는 메일 주소
			
			String mailTo   = mail_1+"@"+mail_2;           // 받는  메일 주소
			String mailTitle =" JSL에서 비밀번호를 재발송 합니다.";   // 메일 제목
			String content = 	                             // 메일내용
			" <table width='400' height='200' border='0' > "+
			" <tr> "+
			" 	<td colspan='2' height='100' align='center'>고객님 비빌번호 안내</td> "+
			" </tr> "+
			" <tr>"+
			" 	<td width='120' align='center'>비 밀 번 호</td> "+
			" 	<td width='280' align='left'>"+
			"        <font size='5' color='red'>"+pw+"</font> 입니다</td> "+
			" </tr> "+
			" </table> ";

			String mailFrom = "";
			try {
				mailFrom = new String(mailFromName.getBytes("utf-8"), "8859_1")+mailFromAddress;
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			MailContentSend ms = new MailContentSend();
			ms.setMail(mailSet_Server, mailSet_ID, mailSet_PW);
			try { 
				ms.sendMail(mailFrom,mailTo, mailTitle, content, pw);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				tf=false;
				e.printStackTrace();
			}
			msg = memberName + "님 입력하신 메일 주소로 비밀번호를 발송합니다.";
			if(!tf) msg = "tlfvo";
			
		}
		request.setAttribute("t_msg", msg);
		request.setAttribute("t_url", "/Member");
	}

}
