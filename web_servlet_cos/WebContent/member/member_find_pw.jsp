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
				<li><a href="javascript:goPageHead('login')">LOGIN</a></li>
				<li><a href="javascript:goPageHead('findPw')"><i class="fas fa-apple-alt"></i> ID / PASSWORD</a></li>
				<li><a href="javascript:goPageHead('join')">JOIN</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				MEMBER FIND PASSWORD
			</p>
			
			<div class="login">
				<div class="member_boxL">
					<h2>FIND PASSWORD</h2>
					<div class="login_form">
						<form name="frmLogin">
							<input type="hidden" name="t_gubun" value="memberSendPw">
							<div class="fl_clear"><label for="mbrId">아이디</label><input name="t_id" id="mbrId" type="text" onkeypress="if( event.keyCode==13 ){goPw()}"></div>
							<div class="fl_clear"><label for="scrtNo">연락처</label><input name="t_tel_1" class="tell_1" type="text">-<input name="t_tel_2" class="tell" type="text">-<input name="t_tel_3" class="tell" type="text">
																				  </div>
							<div class="fl_clear"><label for="scrtNo">e-mail</label><input name="t_mail_1" class="email" type="text">@<input name="t_mail_2" class="email" type="text"></div>
							<a class="btn_find_pw btn_Blue" href="javascript:memberLogin()">찾기</a>
						</form>
					</div>
				   
				</div>		
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
<script>


function memberLogin(){
	frmLogin.method="post";
	frmLogin.action="/Member";
	frmLogin.submit();
	
	
}

</script>
</html>









