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
					${t_dto.getId()}
					<input type="hidden" name="t_id" value="${t_dto.getId()}" size="8" class="inputBox">
				  </td>
				</tr>
				<tr>
				  <th><label for="nana">성 명</label></th>
				  <td><input type="text" name="t_name" value="${t_dto.getName()}" size="8" class="inputBox"></td>
				</tr>
				<tr>
				  <th>지역</th>
				  <td>
					<select name="t_area">
						<option value="">--선택--</option>
						<option value="서울" <c:if test="${t_dto.getArea() eq '서울'}"> selected </c:if>>서울</option>
						<option value="대전" <c:if test="${t_dto.getArea() eq '대전'}"> selected </c:if>>대전</option>
						<option value="부산" <c:if test="${t_dto.getArea() eq '부산'}"> selected </c:if>>부산</option>
						<option value="대구" <c:if test="${t_dto.getArea() eq '대구'}"> selected </c:if>>대구</option>        
					</select>	  
				  </td>
				</tr>	
				
				<tr>
				  <th>주소</th>
				  <td><input type="text" name="t_address" value="${t_dto.getAddress()}" size="40" class="inputBox"></td>
				</tr>
				<tr>
				  <th>연락처</th>
				  <td>
					<input type="text" name="t_tel1" size="3" value="${t_dto.getTell_1()}" class="inputBox"> -
					<input type="text" name="t_tel2" size="4" value="${t_dto.getTell_2()}" class="inputBox"> -
					<input type="text" name="t_tel3" size="4" value="${t_dto.getTell_3()}" class="inputBox">
				  </td>
				</tr>
				<tr>
				  <th>남여구분</th>
				  <td>
					  <input type="radio" value="f" name="t_gender" class="middleCheck" <c:if test="${t_dto.getGender() eq '여'}"> checked </c:if>> 여&nbsp;&nbsp;        
					  <input type="radio" value="m"name="t_gender" class="middleCheck"  <c:if test="${t_dto.getGender() eq '남'}"> checked </c:if>> 남        
				  </td>
				</tr>
				<tr>
				  <th>취미</th>
				  <td>
					  <input type="checkbox" value="y" readonly <c:if test="${t_dto.getHobby_reading() eq 'y'}"> checked </c:if> name="t_hobby_travel" class="middleCheck" > 여행&nbsp;&nbsp; 
					  <input type="checkbox" value="y" readonly <c:if test="${t_dto.getHobby_sports() eq 'y'}"> checked </c:if> name="t_hobby_reading" class="middleCheck" > 독서&nbsp;&nbsp; 
					  <input type="checkbox" value="y" readonly <c:if test="${t_dto.getHobby_travel() eq 'y'}"> checked </c:if> name="t_hobby_sports" class="middleCheck" > 운동&nbsp;&nbsp;
				  </td>
				</tr>
				<tr>
				  <th>비밀번호확인</th>
				  <td>
				 	<input name="t_level_gubun" type="hidden" value="">
				  	<input type="hidden" name="t_pw" value="">
				  	<input name="t_password_confirm"  maxlength="10" onkeyup="passwordCheck()" id="pwInputBox" type="text" size="13">
				  	<input type="text" name="t_pw_YN" value="">
				  </td>
				</tr>
			  </tbody>
			</table>
			</form>
			<div class="buttonGroup_center">
				<a href="javascript:goUpdate()" class="butt">Save</a>
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
	/*
	var inputPW = document.querySelector("#pwInputBox");
	
	inputPW.onblur = function(e){
		passwordCheck();
	};
	
	*/
	
	function goUpdate(){
		if(checkValue(join.t_name,"성명 입력!")) return;

		if(checkValue(join.t_area,"지역 입력!")) return;
		if(checkValue(join.t_address,"주소 입력!")) return;
		if(checkValue(join.t_tel1,"첫번째 연락처 입력!")) return;		
		if(checkValue(join.t_tel2,"두번째 연락처 입력!")) return;		
		if(checkValue(join.t_tel3,"세번째 연락처 입력!")) return;		
		
		if(checkValue(join.t_password_confirm,"비밀번호 확인!")) return;	
		
		//passwordCheck();
		
		
		join.t_gubun.value="memberUpdate";
		
		if(join.t_pw_YN.value != 'Yes'){
			alert("비밀번호 확인바람!");
			join.t_password_confirm.focus();
			return;
		}else{
			alert("성공으로 가는길!");
			join.method="post";
			join.action="/Member";
			join.submit();
			
		}
	
	}
	
	
	function passwordCheck(){
		
		if(checkValue(join.t_id,"ID 입력!")) return;
		var id = join.t_id.value;
		var pw = join.t_password_confirm.value;
		
		$.ajax({
            type : "POST",
            url : "/MemberCheckPw",
            data: "t_id="+id+"&t_pw="+pw,
            dataType : "text",
            error : function(){
               alert('통신실패!!');
            },
            success : function(data){
            	var yn = $.trim(data);
            	join.t_pw_YN.value=yn;
              // $("#idReasult").text(data);
               
               
            }
         });
	}

</script>
</html>









