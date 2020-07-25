<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스프링 MVC 데이터 베이스 연동</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		alert("!!!!");
		var sendData = {
				deptid: "aa",
				deptname: "bb",
				depttel: "cc"
		}
		$("#btn").click(function(){
			alert("!!");
			$.ajax({
				url: "listDepartment.sws",
				data: sendData,
				success: function(data){
					console.log("sucess");
				},
				error: function(){
					console.log("error");
				}
			});
		});
	});

</script>
</head>
<body>
	<h3>Spring-Mybatis</h3>
	<hr>
	<div>
		<a href="listDepartment.sws">[학과 데이터]</a>
		<a href="listLesson.sws">[과목 데이터]</a>
		<a href="listLessonPaging.sws">[과목 데이터 페이징]</a>
	</div>
	<div>
		<button id="btn" name="btn">[학과 데이터]</button>
	</div>

</body>
</html>