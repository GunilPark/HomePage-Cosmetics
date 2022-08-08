<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/common_head.jsp" %>

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
						${t_dto.getAttach()} 삭제<input type="checkbox"><br>
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
						${t_dto.getReg_id()}
					</td>
					<th>Reg Date</th>
					<td>
						${t_dto.getReg_date()}
					</td>
				</tr>
				
				
				</tbody>
			</table>
			<div class="buttonGroup_center">
				<a href="/Notice" class="butt">LIST</a>
				<a href="javascript:goSave()" class="butt">UPDATE</a>
			</div>	
		</div>	
	
	</div>
</div>
<%@ include file="../common_footer.jsp"%>

</body>
</html>









