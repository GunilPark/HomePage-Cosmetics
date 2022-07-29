<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/common_head.jsp" %>



<div id="container">

	<div id="top_main">
		<!--<img src="img/images/top_back_1.jpg">-->
	</div>

	<div id="member">
		<div id="b_left">
			<P>MEMBER</P>
			<ul>
				<li><a href="javascript:goPageHead('myPage')"><i class="fas fa-apple-alt"></i> MyPage</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				MyPage
			</p>
			<form name="mem">
			<c:if test="${empty sessionId}">
				<script>
					alert("로그인 정보 만료되었습니다.");
					location.href="/Member";
				</script>
			</c:if>

			
			<input name="t_gubun" type="hidden">
			<input name="t_id" type="hidden" value="${t_dto.getId()}">
			<table class="boardForm">
			  <colgroup>
				<col width="200" />
				<col width="500" />
			  </colgroup>  
			  <tbody>
				<tr>
				  <th><label for="id">I D</label></th>
				  <td>
				  	${t_dto.getId()}
				  </td>
				</tr>
				<tr>
				  <th><label for="nana">성 명</label></th>
				  <td>${t_dto.getName()}</td>
				</tr>
				<tr>
				  <th>비빌번호</th>
				  <td>${t_lenght}</td>
				</tr>
				<tr>
				  <th>지역</th>
				  <td>
				  	${t_dto.getArea()}
				  </td>
				</tr>	
				
				<tr>
				  <th>주소</th>
				  <td>${t_dto.getAddress()}</td>
				</tr>
				<tr>
				  <th>연락처</th>
				  <td>
					${t_dto.getTell_1()} - ${t_dto.getTell_2()} - ${t_dto.getTell_3()}
				  </td>
				</tr>
				<tr>
				  <th>남여구분</th>
				  <td>
					${t_dto.getGender()}
				  </td>
				</tr>
				<tr>
				  <th>취미</th> 
				  <td>
					  ${t_reading} ${t_sports} ${t_travel}
				  </td>
				</tr>
			  </tbody>
			</table>
			</form>

			<div class="buttonGroup_center">
				<a href="javascript:goPage('update')" class="butt">Update</a>
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









