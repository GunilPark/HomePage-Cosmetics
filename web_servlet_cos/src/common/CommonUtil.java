package common;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonUtil {
	
	// 첨부파일 공지 사항 경로(furniture)
//			public static String getFile_dir_furniture(){
//				String dir = "C:/Users/user/OneDrive/바탕 화면/Track7_Java/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/web_jsp_furniture/attach/furniture";
//				return dir;
//			}
		
		// 첨부파일 공지 사항 경로(notice)
		public static String getFile_dir_notice(){
			String dir = "C:/Users/pki32/git/HomePage-Cosmetics/web_servlet_cos/WebContent/attach/notice";
			return dir;
		}
		public static String getFile_dir_news(){
			String dir = "C:/Users/pki32/git/HomePage-Cosmetics/web_servlet_cos/WebContent/attach/news";
			return dir;
		}
		public static String getFile_dir_freeboard(){
			String dir = "C:/Users/pki32/git/HomePage-Cosmetics/web_servlet_cos/WebContent/attach/free";
			return dir;
		}
		
		/*
		// 첨부파일 공지 사항 경로(news)
		public static String getFile_dir_news(){
			String dir = "C:/Users/user/git/funiture-homepage/web_jsp_furniture/WebContent/attach/news/";
			return dir;
		}	
		
		// 첨부파일 공지 사항 경로(freeboard)
		public static String getFile_dir_freeboard(){
			String dir = "C:/Users/user/git/funiture-homepage/web_jsp_furniture/WebContent/attach/freeboard/";
			return dir;
		}
	
	*/
	// 새로운 게시글 번호 생성
	public static String getNewNo(String format, String no) {	
		int newNum = Integer.parseInt(no.substring(1)) + 1;
		DecimalFormat df = new DecimalFormat(format);
		no = df.format(newNum);
		return no;
	}

	// null 일때 ""으로
	public static String checkNull(String value) {
		String result =""; 
		if(value != null) result = value;
		return result; 
	}

	//오늘날짜
	public static String getToday(){
		Date time = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		String today = format1.format(time);
		return today;
	}
	
	// 오늘 날짜 시분초 
	public static String getTodayTime() {
		Date time = new Date();
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd hh:mm:ss");
		String today = format1.format(time);
		return today;
	}	
	
	// 페이지
	public static String pageListPost(int current_page,int totalpage, int pageColCount){
		int pagenumber;    //화면에 보여질 페이지 인덱스수
		int startpage;     //화면에 보여질 시작 페이지 번호
		int endpage;       //화면에 보여질 마지막 페이지 번호
		int curpage;       //이동하고자 하는 페이지 번호
		
		String strList=""; //리턴될 페이지 인덱스 리스트

		pagenumber = pageColCount;   //한 화면의 페이지 인덱스수
		
		//시작 페이지 번호 구하기
		startpage = ((current_page - 1)/ pagenumber) * pagenumber + 1;
		//마지막 페이지 번호 구하기
		endpage = (((startpage -1) + pagenumber) / pagenumber)*pagenumber;
		//총페이지수가 계산된 마지막 페이지 번호보다 작을 경우
		//총페이지수가 마지막 페이지 번호가 됨
		
		if(totalpage <= endpage)  endpage = totalpage;
					
		//첫번째 페이지 인덱스 화면이 아닌경우
		if(current_page > pagenumber){
			curpage = startpage -1;  //시작페이지 번호보다 1적은 페이지로 이동
			strList = strList +"<a href=javascript:goPage('"+curpage+"') ><i class='fa fa-angle-double-left'></i></a>";
		}
						
		//시작페이지 번호부터 마지막 페이지 번호까지 화면에 표시
		curpage = startpage;
		while(curpage <= endpage){
			if(curpage == current_page){
				strList = strList +"<a class='active'>"+current_page+"</a>";
			} else {
				strList = strList +"<a href=javascript:goPage('"+curpage+"')>"+curpage+"</a>";
			}
			curpage++;
		}
		//뒤에 페이지가 더 있는 경우
		if(totalpage > endpage){
			curpage = endpage+1;
			strList = strList + "<a href=javascript:goPage('"+curpage+"') ><i class='fa fa-angle-double-right'></i></a>";
		}
		return strList;
	}				
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
