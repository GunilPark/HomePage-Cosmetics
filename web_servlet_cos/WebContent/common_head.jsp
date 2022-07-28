<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>젤스엘</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<script type="text/javascript" src="../js/common.js"></script> 
	<script type="text/javascript" src="../js/jquery-1.8.1.min.js"></script>  
	<link rel="stylesheet" type="text/css" href="../css/base.css" /> 	
	<link rel="stylesheet" type="text/css" href="../css/main_menu.css" />
	<link rel="stylesheet" type="text/css" href="../css/subpage.css" />
<script type="text/javascript">
    //<![CDATA[
    $(function(){
    	$(".top_menu_main_right > ul > li > a").mouseover(function(){
			$(".top_menu_main_right div").hide();
			$(this).next().slideDown(1000);
    	});    
    	$(".top_menu_main_right").mouseleave(function(){
			$(".top_menu_main_right div").slideUp(1000);
		}) 
    });     

 //]]>
</script>

<script type="text/javascript">
function goPageHead(gubun){
	view.t_gubun.value = gubun;
	view.method="post";
	view.action="/Member";
	view.submit();
}

</script>
</head>
<body>
<form name="view">
	<input type="hidden" name="t_gubun">
	<input type="hidden" name="t_id" value="${sessionId}">
</form>

<div id="container_top">

	<div id="top_menu">
		<div class="top_menu_top">
			<ul class="topRight">
				<!--<li><span class="wid"></span></li>-->
				<li><a href="/Index"><i class="fa fa-home"></i>홈</a></li>
				<c:if test="${empty sessionId}">
				<li><a href="javascript:goPageHead('login')">로그인</a></li>
				<li><a href="javascript:goPageHead('join')">회원가입</a></li>
				</c:if>
				<c:if test="${not empty sessionId}">
				<li><a href="javascript:goPageHead('logout')">로그아웃</a></li>
				<li><a href="javascript:goPageHead('myPage')">마이페이지</a></li>
				<li><a href="">장바구니</a></li>
				</c:if>
				
				
				
				<li><span class="allclick"><i class="fas fa-bars"></i></span></li>
			</ul>
			<ul class="topLeft">
				<li><a class="snsBasic"><i class="fab fa-instagram"></i></a></li>
				<li><a class="snsBasic"><i class="fab fa-facebook"></i></a></li>
				<li><a class="snsBasic"><i class="fab fa-twitter"></i></a></li>
				<li><a class="snsBasic"><i class="fab fa-youtube"></i></a></li>
				<li><a class="snsBasic"><i class="fas fa-comment-dots"></i></a></li>
			</ul>			
		</div>
		
		<div class="top_menu_main">
			<div class="top_menu_main_left">
				<a href="/Index"><img src="img/images/logo.jpg"></a>
			</div>
			<div class="top_menu_main_right">
				<ul>
					<li><a href="">Toner<br>Skin</a>
						<div id="ddd">
							<ul>
								<li><a href="">Toner</a></li>
								<li><a href="">Skin</a></li>
							</ul>
						</div>					
					</li>
					<li><a href="">Essence<br>Ample<br>Serum</a>
						<div>
							<ul>
								<li><a href="">Essence</a></li>
								<li><a href="">Ample</a></li>
								<li><a href="">Serum</a></li>
							</ul>
						</div>					
					</li>
					<li><a href="">Emulsion<br>Lotion</a>
						<div>
							<ul>
								<li><a href="">Emulsion</a></li>
								<li><a href="">Lotion</a></li>
							</ul>
						</div>					
					</li>
					<li><a href="">Cream</a>
						<div>
							<ul>
								<li><a href="">바니싱</a></li>
								<li><a href="">콜드</a></li>
								<li><a href="">마사지</a></li>
								<li><a href="">데이</a></li>
								<li><a href="">나이트</a></li>
							</ul>
						</div>						
					</li>
					<li><a href="">Oil</a>
						<div>
							<ul>
								<li><a href="">Body</a></li>
								<li><a href="">Face</a></li>
							</ul>
						</div>					
					</li>
				</ul>
			</div>
		</div>
		
	</div>
</div>
	