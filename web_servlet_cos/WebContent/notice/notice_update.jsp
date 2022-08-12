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
			<form name="update">
			<input type="hidden" name="t_no" value="${t_dto.getNo()}">
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
						<textarea name="t_content" class="textArea_H250" name="t_content">${t_dto.getContent()}</textarea>
					</td>
				</tr>
				<tr>
					<th><i class="fas fa-asterisk"></i>Attach</th>
					<td colspan="3" class="hei30">
						${t_dto.getAttach()} 삭제<input type="checkbox"><br>
						<input name="t_" type="file" class="inputFile">
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
			</form>
			<div class="buttonGroup_center">
				<a href="/Notice" class="butt">LIST</a>
				<a href="javascript:goSave()" class="butt">UPDATE</a>
			</div>	
		</div>	
	
	</div>
</div>
<%@ include file="../common_footer.jsp"%>

</body>

<script>
function goSave(){
	var fileName = update.t_attach.value;
	if(fileName !=""){
		var pathFileName = fileName.lastIndexOf(".")+1;    //확장자 제외한 경로+파일명
		var extension = (fileName.substr(pathFileName)).toLowerCase();	//확장자명
		//파일명.확장자
//		if(extension != "jpg" && extension != "gif" && extension != "png"){
		if(extension != "pdf" && extension != "hwp"){
			alert(extension +" 형식 파일은 업로드 안됩니다. 한글, PDF 파일만 가능!");
			return;
		}		
	}
		
	//첨부 용량 체크	
	var file = update.t_attach;
	var fileMaxSize  = 5; // 첨부 최대 용량 설정
	if(file.value !=""){
		// 사이즈체크
		var maxSize  = 1024 * 1024 * fileMaxSize;  
		var fileSize = 0;

		// 브라우저 확인
		var browser=navigator.appName;
		// 익스플로러일 경우
		if (browser=="Microsoft Internet Explorer"){
			var oas = new ActiveXObject("Scripting.FileSystemObject");
			fileSize = oas.getFile(file.value).size;
		}else {
		// 익스플로러가 아닐경우
			fileSize = file.files[0].size;
		}
		//alert("파일사이즈 : "+ fileSize);

		if(fileSize > maxSize){
			alert(" 첨부파일 사이즈는 "+fileMaxSize+"MB 이내로 등록 가능합니다. ");
			return;
		}	
	}		

	if(checkValue(update.t_title,"제목 입력!")) return;
	if(checkValue(update.t_content,"내용 입력!")) return;
	if(checkValue(update.t_reg_date,"등록일자 입력!")) return;
	update.method="post";
	update.action="/Notice";
	update.submit();
	
}

</script>
</html>









