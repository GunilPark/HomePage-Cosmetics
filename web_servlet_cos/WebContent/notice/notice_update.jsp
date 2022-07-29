<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/common_head.jsp" %>


	<div id="top_main">
		<!--<img src="img/images/top_back_1.jpg">-->
	</div>

	<%@ include file="/common_menu.jsp" %>
		
		<div id="b_right">
			<p class="n_title">
				<i class="fas fa-edit"></i> NOTICE
			</p>
	
			<table class="boardForm notice">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="15%">
					<col width="35%">
				</colgroup>
				<tbody>
			<tr>
					<th><label for="t_title"><i class="fas fa-asterisk important"></i>Title</label></th>
					<td colspan="3">
						<input name="t_title" value="${t_dto.getTitle()}" type="text" class="inputBox_500">
					</td>
				</tr>
				<tr>
					<th><label for="t_content"><i class="fas fa-asterisk important"></i>Content</label></th>
					<td colspan="3">
						<textarea name="t_content" class="textArea_H250">${t_dto.getContent()}</textarea>
					</td>
				</tr>
				<tr>
					<th><i class="fas fa-asterisk"></i>Attach</th>
					<td colspan="3" class="hei30">
						송금계좌번호.hwp 삭제<input type="checkbox"><br>
						<input type="file" class="inputFile">
					</td>
				</tr>					
				<tr>
					<th><i class="fas fa-asterisk"></i>Import</th>
					<td colspan="3">
						<input type="radio" value="y" checked /> 일반공지&nbsp;&nbsp;        
						<input type="radio" value="y" /> 중요공지        
					</td>
				</tr>
				<tr>
					<th>Writer</th>
					<td>
						관리자
					</td>
					<th>Reg Date</th>
					<td>
						2021-02-28
					</td>
				</tr>
				
				
				</tbody>
			</table>
			<div class="buttonGroup_center">
				<a href="homepage_6_css분리_공지사항_목록.html" class="butt">LIST</a>
				<a href="" class="butt">UPDATE</a>
			</div>	
		</div>	
	
	</div>
</div>
<div id="footer_div">	
	<div id="footer">
		<div class="footer_left">
			<img src="img/images/footer_logo.jpg">
		</div>
		<div class="footer_center">
			<p>개인정보처리방침  | 개인정보보호정책 | 이용약관 | 협회소개</p>
			우편번호 (26349) 강원 원주시 호저면 우무개로 365 2층, 2호 | 사업자번호 : 209-82-64664<br>
			TEL: 033-747-4012 | FAX: 033-747-4014 | E-mail: korbamtb@daum.net<br>
			COPYRIGHT 2012 KOREA OFF ROAD BIKE ASSOCIATION. ALL RIGHT RESERVED		
		</div>
		<div class="footer_right">
			서울사무소: (02) 4545- 8545<br>
			대전사무소: (042) 5417- 8842<br>
			광주사무소: (052) 4545- 2214<br>
			부산사무소: (048) 4545- 7546
		</div>	
	</div>
</div>	

</body>
</html>









