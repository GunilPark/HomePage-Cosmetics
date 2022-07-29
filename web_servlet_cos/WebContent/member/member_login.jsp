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
				<li><a href="javascript:goPageHead('login')"><i class="fas fa-apple-alt"></i> LOGIN</a></li>
				<li><a href="javascript:goPageHead('findPw')">ID / PASSWORD</a></li>
				<li><a href="javascript:goPageHead('join')">JOIN</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				MEMBER LOGIN
			</p>
			
			<div class="login">
				<div class="member_boxL">
					<h2>LOGIN</h2>
					<div class="login_form">
						<form name="mem">
							<input type="hidden" name="t_gubun" value="">
							<div class="fl_clear"><label for="mbrId">아이디</label><input name="t_id" id="mbrId" type="text" onkeypress="inputCheck()"></div>
							<div class="fl_clear"><label for="scrtNo">비밀번호</label><input name="t_pw" id="scrtNo" type="password" onkeypress="passwordCheck()"></div>
							<a class="btn_login btn_Blue" href="javascript:memberLogin()">로그인</a>
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
<script type="text/javascript">
	$()
	
	function inputCheck(){
		var keyValue = event.keyCode;
		if(keyValue == 13){
			if(mem.t_id.value==""){
				alert("ID 입력하시오!");
				return;
			}
			mem.t_pw.focus();
		}
	}
	function passwordCheck(){
		var keyValue = event.keyCode;
		if(keyValue == 13){
			if(mem.t_pw.value==""){
				alert("비밀번호 입력!");
				return;
			}else{
				memberLogin();
			}
		}
	}
	function memberLogin(){
		if(checkValue(mem.t_id,"ID 입력하시오!")) return;
		if(checkValue(mem.t_pw,"비밀번호 입력하시오!")) return;
		mem.t_gubun.value="memberLogin";
		mem.method="post";
		mem.action="/Member";
		mem.submit();
	}
</script>
</html>









