<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../common_head.jsp" %>

<div id="container">

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
					<th><i class="fas fa-asterisk important"></i>Title</th>
					<td colspan="2">
						${t_dto.getTitle()}
					</td>
					<td> <i class="fa-solid fa-eye"></i> ${t_dto.getHit()}</td>
				</tr>
				<tr>
					<th><label for="t_content"><i class="fas fa-asterisk important"></i>Content</label></th>
					<td colspan="3">
						<textarea name="t_content" class="textArea_H250_noBorder">${t_dto.getContent()}
						</textarea>
					</td>
				</tr>
				<tr>
					<th><i class="fas fa-asterisk"></i>Attach</th>
					<td colspan="3" class="hei30">
						<!--
						<a href="/common/filedown.jsp?t_fileDir=notice&t_file=${t_dto.getAttach()}">${t_dto.getAttach()}</a>
						-->
						<a href="/AttachDown?t_fileDir=notice&t_file=${t_dto.getAttach()}">${t_dto.getAttach()}</a>
					
					</td>
				</tr>					
				<tr>
					<th>Writer</th>
					<td>
						${t_dto.getReg_id()}
					</td>
					<th>Reg Date</th>
					<td>
						${t_dto.getReg_date()}
					</td>
				</tr>
				
				</tbody>
			</table>

			<div class="preNext">
			
			<c:if test="${not empty t_preDto}">
				<p class="pre">
					<a href="javascript:goView('${t_preDto.getNo()}')"><span class="preNextInfo"><i class="fa-solid fa-circle-arrow-left"></i>이전글</span><br></a>
					<span class="preNextTitle">
						<c:if test="${fn:length(t_preDto.getTitle()) > 10}">
							${fn:substring(t_preDto.getTitle(),0,10) }…
						</c:if>
						<c:if test="${fn:length(t_preDto.getTitle()) <= 10}">
							${t_preDto.getTitle()}
						</c:if>
					</span>
				</p>
			</c:if>	
			<c:if test="${not empty t_nextDto}">
				<p class="next">
					<a href="javascript:goView('${t_nextDto.getNo()}')"><span class="preNextInfo">다음글<i class="fa-solid fa-circle-arrow-right"></i></span><br></a>
					<span class="preNextTitle">
						<c:if test="${fn:length(t_nextDto.getTitle()) > 10}">
							${fn:substring(t_nextDto.getTitle(),0,10) }…
						</c:if>
						<c:if test="${fn:length(t_nextDto.getTitle()) <= 10}">
							${t_nextDto.getTitle()}
						</c:if>
					</span>
				</p>
			</c:if>
			</div>
			<div class="buttonGroup_center" style="float: right;">
				<a href="/Notice" class="butt">LIST</a>
				<c:if test="${sessionLevel eq 'top'}">
					<a href="javascript:goWrite()" class="butt">UPDATE</a>
					<a href="javascript:goDelete()" class="butt">DELETE</a>
				</c:if>
			</div>	
		</div>	
	
	</div>
</div>
<%@ include file="../common_footer.jsp"%>

</body>
<form name="viewno">
	<input type="hidden" name="t_gubun" value="">
	<input type="hidden" name="t_no" value="">
</form>
<form name="update">
	<input name="t_gubun" type="hidden">
	<input name="t_no" type="hidden" value="${t_dto.getNo()}">
</form>
<script>
function goDelete(){
	update.t_gubun.value = "delete";
	update.method="post";
	update.action="/Notice";
	update.submit();
}
function goWrite(){
	update.t_gubun.value = "update";
	update.method="post";
	update.action="/Notice";
	update.submit();
						
}

function goView(no){
	viewno.t_gubun.value ="view";
	viewno.t_no.value = no;
	viewno.method="post";
	viewno.action="/Notice";
	viewno.submit();
}
</script>
</html>









