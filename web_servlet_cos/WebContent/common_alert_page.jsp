<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
<form name="post">
<input type="hidden" name="t_url" value="${t_url}">
<input type="hidden" name="t_msg" value="${t_msg}">
</form>
<script type="text/javascript">
alert(post.t_msg.value);
post.method="post";
post.action=post.t_url.value;
post.submit();
</script>
</html>