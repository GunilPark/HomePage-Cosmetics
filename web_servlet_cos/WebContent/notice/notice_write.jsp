<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/common_head.jsp"%>

<script>
function goSave(){
	if(checkValue(notice.t_title,"제목 입력!")) return;
	if(checkValue(notice.t_content,"내용 입력!")) return;
//첨부파일 검사
//확장자 검사
	
var fileName = notice.t_attach.value;
if(fileName !=""){
	var pathFileName = fileName.lastIndexOf(".")+1;    //확장자 제외한 경로+파일명
	var extension = (fileName.substr(pathFileName)).toLowerCase();	//확장자명

	//파일명.확장자
	if(extension != "jpg" && extension != "gif" && extension != "png"){
//	if(extension != "pdf" && extension != "hwp"){
		alert(extension +" 형식 파일은 업로드 안됩니다. 한글, PDF 파일만 가능!");
		return;
		}		
	}
//첨부 용량 체크	
var file = notice.t_attach;
var fileMaxSize  = 5; // 첨부 최대 용량 설정
if(file.value !=""){
	// 사이즈체크
	var maxSize  = 1024 * 1024 * fileMaxSize;  
	var fileSize = 10;

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
		notice.method="post";
		notice.action="/NoticeSave";
		notice.submit();
	}
	
</script>


<c:if test="${sessionLevel ne 'top'}">
	<script>
		alert("관리자 화면입니다.");
		location.href ="/Notice";
	</script>
</c:if>
    
<div id="container">

	<div id="top_main">
		<!--<img src="img/images/top_back_1.jpg">-->
	</div>

	<div id="member">
		<div id="b_left">
			<P>NOTICE</P>
			<ul>
				<li><a href="/Notice"><i class="fas fa-apple-alt"></i> NOTICE</a></li>
				<li><a href="/News">NEWS</a></li>
				<li><a href="/QandA">QandA</a></li>
				<li><a href="/Faq">FAQ</a></li>
			</ul>
		</div>
		
		<div id="b_right">
			<p class="n_title">
				<i class="fas fa-edit"></i> NOTICE
			</p>
			<form name="notice" enctype="multipart/form-data">
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
						<input name="t_title" type="text" class="inputBox_500">
					</td>
				</tr>
				<tr>
					<th><label for="t_content"><i class="fas fa-asterisk important"></i>Content</label></th>
					<td colspan="3">
						<textarea name="t_content" class="textArea_H250"></textarea>
					</td>
				</tr>
				<tr>
					<th><i class="fas fa-asterisk"></i>Attach</th>
					<td colspan="3" class="hei30"><input type="file" name="t_attach" class="inputFile"></td>
				</tr>
<!-- 									
				<tr>
					<th><i class="fas fa-asterisk"></i>Import</th>
					<td colspan="3">
						<input type="radio" value="y" checked /> 일반공지&nbsp;&nbsp;        
						<input type="radio" value="y" /> 중요공지        
					</td>
				</tr>
 -->				
				<tr>
					<th>Writer</th>
					<td>
						${sessionName}
					</td>
					<th>Reg Date</th>
					<td>
						${toDay}
					</td>
				</tr>
				
				</tbody>
			</table>
			</form>
			<div class="buttonGroup_center">
				<a href="javascript:goSave()" class="butt">SAVE</a>
				<a href="/Notice" class="butt">LIST</a>
			</div>	
		</div>	
	
	</div>
</div>
<%@ include file="/common_footer.jsp"%>

</body>
</html>    