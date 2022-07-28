<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/common_head.jsp" %>
<script type="text/javascript">
	function goSearch(){
		noti.method="post";
		noti.action="/Notice";
		noti.submit();
	}
	function goPage(pageNumber){
		pageForm.t_nowPage.value = pageNumber;
		pageForm.method="post";
		pageForm.action="/Notice";
		pageForm.submit();		
	}
	function goWrite(){
		notiForm.t_gubun.value ="write";
		notiForm.method="post";
		notiForm.action="/Notice";
		notiForm.submit();
	}
</script> 
<form name="notiForm">
<input name="t_gubun" type="hidden">
</form>
<div id="container">

	<div id="top_main">
		<!--<img src="img/images/top_back_1.jpg">-->
	</div>

	<div id="member">
		<%@ include file="/common_menu.jsp" %>
		
		<div id="b_right">
			<p class="n_title">
				<i class="fas fa-edit"></i> NOTICE
			</p>
			<form name="noti">
			<p class="select_box">
				<select name="t_select" class="sel_box">
				
					<option value="a.title" <c:if test="${t_select eq 'a.title'}">selected</c:if>>Title</option>
					<option value="a.content" <c:if test="${t_select eq 'a.content'}">selected</c:if>>Content</option>
				</select>
				<input name="t_search" type="text" class="sel_text">

				<button type="button" onclick="goSearch()" class="sel_button"><i class="fa fa-search"></i> SEARCH</button>
			</p>
			</form>
			<table class="boardList">
				<colgroup>
					<col width="5%">
					<col width="60%">
					<col width="5%">
					<col width="10%">
					<col width="14%">
					<col width="6%">
				</colgroup>
				<thead>
					<tr>
						<th>No</th>
						<th>Title</th>
						<th>Attach</th>
						<th>Reg Name</th>
						<th>Reg Date</th>
						<th>Hit</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${t_dtos}" var="dto">
					<tr>
						<td><a href="/Notice">${dto.getNo()}</a></td>
						<td class="t_center"><a href="/Notice">${dto.getTitle()}</a></td>
						<td><c:if test="${dto.getAttach() ne null}">
						<i class="fas fa-paperclip"></i>
						</c:if></td>
						<td>${dto.getReg_id()}</td>
						<td>${dto.getReg_date()}</td>
						<td>${dto.getHit()}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="paging">
				${t_pageDisplay} 
				<c:if test="${sessionLevel eq 'top'}">
					<a href="javascript:goWrite()" class="write">WRITE</a>
				</c:if>
			</div>	
			<!--  
			<div class="paging">
				<a href=""><i class="fa fa-angle-double-left"></i></a>
				<a href=""><i class="fa fa-angle-left"></i></a>
				<a href="" class="active">1</a>
				<a href="">2</a>
				<a href="">3</a>
				<a href="">4</a>
				<a href="">5</a>
				<a href=""><i class="fa fa-angle-right"></i></a>
				<a href=""><i class="fa fa-angle-double-right"></i></a>
				<a href="/Notice" class="write">WRITE</a>
			</div>			
			-->
		</div>	
	
	</div>
</div>
<%@include file = "/common_footer.jsp" %>

</body>
</html>









