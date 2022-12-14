<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>젤스엘</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script><!-- 날리는 꽃잎-->	
<script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
	<script type="text/javascript" src="js/jquery-sakura.js"></script>  
	<link rel="stylesheet" type="text/css" href="css/base.css" /> 	
	<link rel="stylesheet" type="text/css" href="css/main_menu.css" /> 	
	<link rel="stylesheet" type="text/css" href="css/index.css" /> 	
	<link rel="stylesheet" type="text/css" href="css/jquery-sakura.css" /> 	
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
function goPage(gubun){
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
</form>
<style>
#disableDiv { 
position:absolute; 
left:0; 
top:0;
width:100%; 
height:1800px;
z-index:995 ; 
background:rgba(245,244,245,0.7);
}
</style>
<div id="disableDiv" class="disableDiv" style="display:none"></div>

<div id="container_top">

	<div id="top_menu">
		<div class="top_menu_top">
			<ul class="topRight">
				<!--<li><span class="wid"></span></li>-->
				<li><a href="/Index"><i class="fa fa-home"></i>홈</a></li>
				<c:if test="${sessionId eq ''}">
				<li><a href="javascript:goPage('login')">로그인</a></li>
				<li><a href="javascript:goPage('join')">회원가입</a></li>
				</c:if>
				<c:if test="${sessionId ne ''}">
				<li><a href="javascript:goPage('logout')">로그아웃</a></li>
				<li><a href="javascript:goPage('myPage')">마이페이지</a></li>
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


<script type="text/javascript">
	$(function(){
		$(".allclick").click(function(e){
			//e.preventDefault();
			$("#disableDiv").css("display","block");
			$("#all_menu_view").slideDown(1000);
			$("#all_menu_view").css("z-index","999");
		});
		
		$(".closeclick").click(function(e){
			//e.preventDefault();
			$("#all_menu_view").slideUp(1000);
			$("#disableDiv").css("display","none");
		});

	});	
</script>
<style>
		#all_menu_view{
			display:none;
			position:absolute;
			z-index:1000;
			opacity:0.8;
			background:#b369b3;
			border-radius:20px;	
		}
		#all_menu_view a{
			color:#fff;
		}	
		#all_menu_view a:hover{
			font-weight:bold;
		}
		#all_menu_view_top{
			//width:1024px;
			width:800px;
			height:200px;
			padding:10 112px;
		
			//border:1px solid red;
		}
		#all_menu_view_top div{
			float:left;
			width:133.3px; //170.6px
		}
		#all_menu_view_top div ul li{
			padding-top:15px;
			color:#F2F2F2;
		}
		.menu_close{
			width:1024px;
			height:30px;
			text-align:center;
			//background:#b369b3;
			//border:1px solid green;
		}		
</style>


<div id="container">

		<div id="all_menu_view">		
			<div id="all_menu_view_top">
				<div><a href=""><span class="maintitle">Accessories</span></a>
					<ul>
						<li>Toner / Skin</li>
						<li>menu1 sub2</li>
						<li>menu1 sub3</li>
						<li>menu1 sub4</li>
						<li>menu1 sub5</li>
					</ul>
				</div>
				<div><a href=""><span class="maintitle">Toner / Skin</span></a>
					<ul>
						<li>Toner</li>
						<li>Skin</li>
					</ul>
				</div>
				<div><a href=""><span class="maintitle">Bikes & Frames</span></a>
					<ul>
						<li>menu2 sub1</li>
						<li>menu2 sub2</li>
						<li>menu2 sub3</li>
						<li>menu2 sub4</li>
					</ul>
				</div>
				<div><a href=""><span class="maintitle">Clothing</span></a>
					<ul>
						<li>menu3 sub1</li>
						<li>menu3 sub2</li>
						<li>menu3 sub3</li>
						<li>menu3 sub4</li>
					</ul>
				</div>
				<div><a href=""><span class="maintitle">Maintenance</span></a>
					<ul>
						<li>menu4 sub1</li>
						<li>menu4 sub2</li>
						<li>menu4 sub3</li>
						<li>menu4 sub4</li>
						<li>menu4 sub5</li>
					</ul>
				</div>
				<div><a href="notice/notice_list.html"><span class="maintitle">Notice & News</span></a>
					<ul>
						<li><a href="notice/notice_list.html">Notice</a></li>
						<li><a href="">News</a></li>
						<li><a href="">Q & A</a></li>
						<li><a href="">Free Board</a></li>
						<li><a href="">Etc</a></li>
					</ul>
				</div>
				
			</div>
			<div class="menu_close"><a href="#" class="closeclick">[CLOSE]</a></div>
		</div>	







	<div id="top_main">
		<!--<img src="img/images/top_back_1.jpg">-->
<!--		
<div data-slider-id="lpqojn"></div>
<script type="text/javascript" src="https://sliderui.com/sliders/lpqojn.js"></script>
-->
		<div class="textAni">
			<p>Your precious skin is Jellswell.</p>
			<p>Deeply moisturized in the skin<br>
			Smooth and elastic skin<br>
			Always always by my side "Jellswell"
			</p>
			<span class="textAniLine"></span>
		</div>
	</div>
	
	<div id="content">
		<div id="content_left">
			<div class="">
				<p class="product_1">
					<a href="">
						<span class="p_title">Lotion</span><br>
						<span class="p_desc">360ml</span>						
					</a>
				</p>
				<p class="product_2">
					<a href="">
						<span class="p_title">Skin</span><br>
						<span class="p_desc">470ml</span>
					</a>
				</p>
				<p class="product_3">
					<a href="">
						<span class="p_title">Essense</span><br>
						<span class="p_desc">550ml</span>
					</a>
				</p>
				<p class="product_4">
					<a href="">
						<span class="p_title">Emulsion</span><br>
						<span class="p_desc">200ml</span>
					</a>
				</p>
			</div>
			<div class="">
				<p><img src="img/images/m_005.jpg"></p>
				<p><img src="img/images/m_004.jpg"></p>
				<p><img src="img/images/m_007.jpg"></p>
				<p><img src="img/images/m_008.jpg"></p>
			</div>
			<div class="">
				<p><img src="img/images/m_009.jpg"></p>
				<p><img src="img/images/m_010.jpg"></p>
				<p><img src="img/images/m_011.jpg"></p>
				<p><img src="img/images/m_012.jpg"></p>
			</div>
		</div>
		
		<div id="content_right">
			<div>
				<fieldset>
					<legend>
						<a href="/Notice">&nbsp;NOTICE&nbsp;<i class="far fa-plus-square"></i></a>
					</legend>
					<ul>
					<c:forEach items="${t_dtos}" var="dto">
						<li>
							<a href="javascript:goView('${dto.getNo()}')">
							<span class="noti_t">${dto.getTitle()}</span>
							<span class="noti_d">${dto.getRegdate()}</span></a>	
						</li>
					</c:forEach>	
					</ul>
				</fieldset>	
			</div>
			<div>
				<a href=""><p>바로가기</p></a>
			</div>
		</div>
	</div>
	
	<div id="content2">
		<a href=""><p>바로가기</p></a>
	</div>	

	<div id="content3">
		<div class="best_menu">
			<div class="best_menu_title">
				<img src="img/images/best_sell_title.jpg">
			</div>
			<div class="best_menu_list">
				<ul>
					<li><a href="">스킨케어</a></li>
					<li><a href="">메이크업</a></li>
					<li><a href="">바디케어</a></li>
					<li><a href="">남성</a></li>
					<li><a href="">미용소품</a></li>
				</ul>
			</div>
		</div>
		
		<div class="bestseller_content">
			<ul>
				<li>
					<a href="">
						<img src="img/images/best_sell_1.jpg">
						<p class="best_item_name">크림 인 스킨</p>
						<p class="best_item_price">24,000원</p>
						<p class="best_item_desc">#귀찮니짐 추천템 #초코초코</p>
					</a>
				</li>
				<li>
					<a href="">
						<p><img src="img/images/best_sell_2.jpg"></p>
						<p class="best_item_name">히아루론산 보습 토너</p>
						<p class="best_item_price">
							<span><del>9,800원</del></span>
							6,860원
						</p>
						<p class="best_item_desc">#히아루론산함유</p>
					</a>
				</li>
				<li>
					<a href="">
						<p><img src="img/images/best_sell_3.jpg"></p>
						<p class="best_item_name">프레스티지 에클로젬므<br>블랙테스카르고3종</p>
						<p class="best_item_price">
							137,000원
						</p>
						<p class="best_item_desc"></p>
					</a>
				</li>
				<li>
					<a href="">
						<p><img src="img/images/best_sell_4.jpg"></p>
						<p class="best_item_name">히아루론산 보습 6종<br>스페셜 세트</p>
						<p class="best_item_price">
							55,000원
						</p>
						<p class="best_item_desc"></p>
					</a>
				</li>
			</ul>
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


<script>

    //<![CDATA[
    $(function(){
$(window).load(function () {
    $('#footer').sakura();
});
    });     
 //]]>
</script>
</body>
</html>
