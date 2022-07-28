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
				<li><a href="javascript:goPage('login')">LOGIN</a></li>
				<li><a href="javascript:goPage('findPw')">ID / PASSWORD</a></li>
				<li><a href="javascript:goPage('join')"><i class="fas fa-apple-alt"></i> JOIN</a></li>
			</ul>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				MEMBER JOIN
			</p>
			<form name="join">
			<input name="t_gubun" type="hidden" value="memberSave">
			<table class="boardForm">
			  <colgroup>
				<col width="200" />
				<col width="500" />
			  </colgroup>  
			  <tbody>
				<tr>
				  <th><label for="id">I D</label></th>
				  <td>
					<input name="t_id" type="text" size="10" class="inputBox" title="id입력하세요">
					<input type="button" id="check" onclick="checkId()" value="ID중복검사" class="checkB">
					<input type="hidden" id="checkValue" value="" name="t_idCheck">
					<span id="idReasult"></span>
				  </td>
				</tr>
				<tr>
				  <th><label for="nana">성 명</label></th>
				  <td><input type="text" name="t_name" size="8" class="inputBox"></td>
				</tr>
				<tr>
				  <th>비빌번호</th>
				  <td><input type="text" name="t_pw" size="13" class="inputBox"></td>
				</tr>
				<tr>
				  <th>비밀번호확인</th>
				  <td><input type="text" name="t_pw_check" size="13" class="inputBox"></td>
				</tr>
				<tr>
				  <th>지역</th>
				  <td>
					<select name="t_area">
						<option value="">--선택--</option>
						<option value="서울">서울</option>
						<option value="대전">대전</option>
						<option value="부산">부산</option>
						<option value="대구">대구</option>        
					</select>	  
				  </td>
				</tr>	
				
				<tr>
				  <th>주소</th>
				  <td><input type="text" name="t_address" size="40" class="inputBox"></td>
				</tr>
				<tr>
				  <th>연락처</th>
				  <td>
					<input type="text" name="t_tel1" size="3" class="inputBox"> -
					<input type="text" name="t_tel2" size="4" class="inputBox"> -
					<input type="text" name="t_tel3" size="4" class="inputBox">
				  </td>
				</tr>
				<tr>
				  <th>남여구분</th>
				  <td>
					  <input type="radio" value="f" name="t_gender" class="middleCheck" /> 여&nbsp;&nbsp;        
					  <input type="radio" value="m" name="t_gender" class="middleCheck" /> 남        
				  </td>
				</tr>
				<tr>
				  <th>취미</th>
				  <td>
					  <input type="checkbox" value="y" name="t_hobby_traval" class="middleCheck" /> 여행&nbsp;&nbsp; 
					  <input type="checkbox" value="y" name="t_hobby_reading" class="middleCheck" /> 독서&nbsp;&nbsp; 
					  <input type="checkbox" value="y" name="t_hobby_sports" class="middleCheck" /> 운동
				  </td>
				</tr>
			  </tbody>
			</table>
			</form>
			<div class="buttonGroup_center">
				<a href="javascript:goJoin()" class="butt">JOIN</a>
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
	function checkId(){
		if(checkValue(join.t_id,"ID 입력!")) return;
		
		$.ajax({
            type : "POST",
            url : "/MemberCheckId",
            data: "t_id="+join.t_id.value,
            dataType : "text",
            error : function(){
               alert('통신실패!!');
            },
            success : function(data){
               $("#idReasult").text(data);
               if($.trim(data) =="중복된 ID 사용 불가!"){
            	   $("#idReasult").css("color","red");
            	   check = false;
            	   $("#checkValue").val("");
               }else{
            	   $("#idReasult").css("color","blue");
            	   check = true;
            	   $("#checkValue").val(join.t_id.value);
               }
               
            }
         });
	}
	function goJoin(){
		if(checkValue(join.t_id,"ID 입력!")) return;
		if(checkValue(join.t_name,"성명 입력!")) return;

		if(checkValue(join.t_pw,"비밀번호 입력!")) return;
		if(checkValue(join.t_pw_check,"비밀번호 확인 입력!")) return;
		
		if(join.t_pw.value != join.t_pw_check.value){
			alert("비밀번호가 같지 않습니다.");
			join.t_password_confirm.select();
			return;
		}
		if(checkValue(join.t_area,"지역 입력!")) return;
		if(checkValue(join.t_address,"주소 입력!")) return;
		if(checkValue(join.t_tel1,"첫번째 연락처 입력!")) return;		
		if(checkValue(join.t_tel2,"두번째 연락처 입력!")) return;		
		if(checkValue(join.t_tel3,"세번째 연락처 입력!")) return;		

		if(checkValue(join.t_gender,"성별을 선택하시오!")) return;
		if(check == false){
			alert("id중복체크(사용가능한 아이디 입력 바람)!");
			join.t_id.focus();
			return;
		}
		if(join.t_id.value != join.t_idCheck.value){
			alert("변경된 id중복체크(사용가능한 아이디 입력 바람)!");
			join.t_id.focus();
			return;
		}
		join.method="post";
		join.action="/Member";
		join.submit();
		
	}

</script>
</html>









