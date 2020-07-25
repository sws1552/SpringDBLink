<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 화면</title>
<script type="text/javascript">
	alert("${result}");
	if("${result}".indexOf("문제") > -1){
		history.go(-1);
	}else{
		opener.parent.location.reload();
		window.close();
	}
</script>
</head>
<body>

</body>
</html>