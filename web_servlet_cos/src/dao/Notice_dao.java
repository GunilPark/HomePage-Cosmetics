package dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBConnection;
import dto.Notice_dto;

public class Notice_dao{
	Connection 			con = null;
	PreparedStatement 	ps  = null;
	ResultSet 			rs  = null;
	
	//사이즈 줄이기
	public String sizeDown(String title) {
		String result = title;
		if(title.length() > 14) {
			result = result.substring(0, 14);
			result += "...";
		}
			
		return result;
	}
	
	
	//조회수 증가
	public void setHitCount(String no) {
		String query = "update homepage_박건일_notice\r\n" + 
				"set hit = hit + 1\r\n" + 
				"where no = '"+no+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			ps.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("setHitCount() 오류: " + query);
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
	}
	
	
	//뷰생성
	public Notice_dto getView(String no) {
		Notice_dto dto = null;
		String query = "select a.no, a.title,a.content, a.attach, b.name,to_char(a.reg_date,'yyyy-MM-dd') as reg_date,a.hit\r\n" + 
				"from homepage_박건일_notice a, homepage_박건일_member b\r\n" + 
				"where a.reg_id = b.id\r\n" + 
				"and a.no = '"+no+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				no = rs.getString(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				String attach = rs.getString(4);
				String reg_id = rs.getString(5);
				String reg_date = rs.getString(6);
				String hit = rs.getString(7);		
				//dto의 순서: no,title,content,attach,hit,reg_id,reg_date
				dto = new Notice_dto(no,title,content,attach,hit,reg_id,reg_date);
			}	
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dto;		
	}
	//삭제
	public int getDelete(String no) {
		int result = 0;
		String query = "delete from homepage_박건일_notice\r\n" + 
				"where no = '"+ no +"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("getDelete() 오류!:" + query);
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
	
	
	//업데이트
	public int noticeUpdate(Notice_dto dto) {
		int result = 0;
		String query = "update homepage_박건일_notice\r\n" + 
				"set title = '"+dto.getTitle()+"',attach = '"+dto.getAttach()+"',reg_date = '"+dto.getReg_date()+"',hit = 0, content = '"+dto.getContent()+"'\r\n" + 
				"where no = '"+dto.getNo()+"'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			result = ps.executeUpdate();
		}catch(SQLException e) {
			System.out.println("noticeUpdate() 오류:" + query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return result;
	}
	
	// 등록
	public int noticeSave(Notice_dto dto){
		int result =0;
		String query="insert into homepage_박건일_notice\r\n" + 
				" (no,title,content,attach,reg_id,reg_date)\r\n" + 
				" values\r\n" + 
				" ('"+dto.getNo()+"','"+dto.getTitle()+"','"+dto.getContent()+"','"+dto.getAttach()+"','"+dto.getReg_id()+"','"+dto.getReg_date()+"')" ; 
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			result  = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println("noticeSave() 오류:"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}		
		return result;
	}
	
	// 번호 생성
	public String getMaxNo() {
		String no="";
		String query =" select nvl(max(no),'N000') "+
		              " from homepage_박건일_notice";
		try {
			con = DBConnection.getConnection();
			ps  = con.prepareStatement(query);
			rs  = ps.executeQuery();
			if(rs.next()) {
				no = rs.getString(1);
			}
		}catch(Exception e) {
			System.out.println("getMaxNo() 오류:"+query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return no;
	}
	//리스트 생성
		public ArrayList<Notice_dto> getList_one(String select, String search) {
			ArrayList<Notice_dto> dtos = new ArrayList<>();
			String query = 
					"select a.no, a.title, a.attach, b.name, to_char(a.reg_date,'yyyy-MM-dd') as reg_date,a.hit\r\n" + 
					"from homepage_박건일_notice a, homepage_박건일_member b\r\n" + 
					"where a.reg_id = b.id\r\n" + 
					"and "+select+" like '%"+search+"%'\r\n" +
					"order by a.no desc";
			try {
				con = DBConnection.getConnection();
				ps = con.prepareStatement(query);
				rs = ps.executeQuery();
				while(rs.next()) {
					String no = rs.getString(1);
					String title = rs.getString(2);
					String attach = rs.getString(3);
					String reg_id = rs.getString(4);
					String reg_date = rs.getString(5);
					String hit = rs.getString(6);
					//String rNum = rs.getString(7);
					//dto의 순서: no,title,content,attach,hit,reg_id,reg_date
					Notice_dto dto = new Notice_dto(no, title, "", attach, hit, reg_id, reg_date);
					dtos.add(dto);
				}
			}catch(SQLException e) {
				System.out.println("getList() 오류:" + query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}
			System.out.println(query);
			
			return dtos;
		}
		//목록조회
		public ArrayList<Notice_dto> getNoticeList(
								String select, String search,
								int start, int end){
			ArrayList<Notice_dto> dtos = new ArrayList<Notice_dto>();
			String query="select * from(\r\n" + 
					"select tbl.*, rownum as rnum\r\n" + 
					"from\r\n" + 
					"(" +
					"select a.no, a.title, a.attach, b.name,\r\n" + 
					"       to_char(a.reg_date,'yyyy-MM-dd') as reg_date,a.hit\r\n" + 
					" from homepage_박건일_notice a,homepage_박건일_member b\r\n" + 
					" where a.reg_id = b.id \r\n" + 
					" and "+select+" like '%"+search+"%' "+
					" order by a.no desc" +
					") tbl) \r\n" + 
					"where rnum >="+start+" and rnum <="+end+"" ;
			try {
				con = DBConnection.getConnection();
				ps  = con.prepareStatement(query);
				rs  = ps.executeQuery();
				
				while(rs.next()) {
					String no 		= rs.getString("no");
					String title 	= rs.getString("title");
					String attach 	= rs.getString("attach");
					String reg_name = rs.getString("name");
					String reg_date = rs.getString("reg_date");
					String hit 		= rs.getString("hit");
					Notice_dto dto = 
							new Notice_dto(no,title,"", attach,hit,reg_name,reg_date);
					dtos.add(dto);
				}
			}catch(Exception e) {
				System.out.println("getNoticeList() 오류:"+query);
				e.printStackTrace();
			}finally {
				DBConnection.closeDB(con, ps, rs);
			}			
			return dtos;
		}
	
	
	//리스트 생성
	public ArrayList<Notice_dto> getList(String select, String search, int start, int end) {
		ArrayList<Notice_dto> dtos = new ArrayList<>();
		String query = "select * from(\r\n" + 
				"select tbl.*, rownum as rnum\r\n" + 
				"from\r\n" + 
				"(select a.no, a.title, a.attach, b.name, to_char(a.reg_date,'yyyy-MM-dd') as reg_date,a.hit\r\n" + 
				"from homepage_박건일_notice a, homepage_박건일_member b\r\n" + 
				"where a.reg_id = b.id\r\n" + 
				"and "+select+" like '%"+search+"%'\r\n" + 
				"order by a.no desc)tbl)\r\n" + 
				"where rnum >="+start+" and rnum <="+end;
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String no = rs.getString(1);
				String title = rs.getString(2);
				String attach = rs.getString(3);
				String reg_id = rs.getString(4);
				String reg_date = rs.getString(5);
				String hit = rs.getString(6);
				String rNum = rs.getString(7);
				//dto의 순서: no,title,content,attach,hit,reg_id,reg_date
				Notice_dto dto = new Notice_dto(no, title, "", attach, hit, reg_id, reg_date);
				dtos.add(dto);
			}
		}catch(SQLException e) {
			System.out.println("getList() 오류:" + query);
			e.printStackTrace();
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return dtos;
	}
	
	//목록조회 전체
	public int getTotalCount(String select,String search) {
		int result = 0;
		String query = "select count(*)\r\n" + 
				"from homepage_박건일_notice a,homepage_박건일_member b\r\n" + 
				"where a.reg_id = b.id\r\n" + 
				"and "+select+" like '%"+search+"%'";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("getTotalCount() 오류: " + query);
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		
		return result;
	}


	public Notice_dto getPreNO(String no) {
		Notice_dto dto = null;
		String query = "select a.preNo,b.title\r\n" + 
				"from(\r\n" + 
				"select max(no) as preNo\r\n" + 
				"from homepage_박건일_notice\r\n" + 
				"where no < '"+no+"'\r\n" + 
				") a, homepage_박건일_notice b\r\n" + 
				"where a.preno = b.no";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String preNo = rs.getString("preNo");
				String title = rs.getString("title");
				
				dto = new Notice_dto(preNo,title);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("getPreNO() : 오류" + query);
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dto;
	}


	public Notice_dto getNextNO(String no) {
		Notice_dto dto = null;
		String query = "select a.nextNo,b.title\r\n" + 
				"from(\r\n" + 
				"select min(no) as nextNo\r\n" + 
				"from homepage_박건일_notice\r\n" + 
				"where no > '"+no+"'\r\n" + 
				") a, homepage_박건일_notice b\r\n" + 
				"where a.nextNo = b.no";
		try {
			con = DBConnection.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				String nextNo = rs.getString("nextNo");
				String title = rs.getString("title");
				
				dto = new Notice_dto(nextNo,title);
				
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("getNextNO() : 오류" + query);
		}finally {
			DBConnection.closeDB(con, ps, rs);
		}
		return dto;
	}
	
}







