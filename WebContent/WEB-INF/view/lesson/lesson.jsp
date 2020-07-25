<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 테이블</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type = "text/javascript">
	function insertPopup(){
		$("#num").val(0);
		window.open("", "pop", "width=480, height=250");
		$("#popupForm").attr("action","selectLesson.sws");
		$("#popupForm").attr("target","pop");
		$("#popupForm").submit();
	}
	
	function updatePopup(num){
		$("#num").val(num);
		window.open("", "pop", "width=480, height=250");
		$("#popupForm").attr("action","selectLesson.sws");
		$("#popupForm").attr("target","pop");
		$("#popupForm").submit();
	}
	
	function listSearch(){
		$("#searchForm").attr("action","listLesson.sws");
		$("#searchForm").submit();
	}


</script>
<style type="text/css">
	table{width:570px}
	#searchForm table th{width:114px}
	#searchForm table td{width:104px; text-align:center;}
	#lname{width:328px}
</style>
</head>
<body>



	<form id="popupForm" name="popupForm" method="post">
		<input type="hidden" id="num" name="num" />
	</form>
	<div>
		<table border="0" cellpadding="1" cellspacing="1">
			<tr>
				<th width="650"><h4>과목 테이블[Spring]</h4></th>
			</tr>	
		</table>
	</div>
	<div>
		<table border="1">
			<colgroup>
				<col width="120px" />
				<col width="220px" />
				<col width="120px" />
				<col width="110px" />
				<col width="110px" />
				<col width="110px" />
				<col width="110px" />
			</colgroup>
			<thead>
			<tr>
				<th>번호</th>
				<th>과목코드</th>
				<th>과목명</th>
				<th>삭제여부</th>
				<th>등록날짜</th>
				<th>수정날짜</th>
				<th>상세보기</th>
			</tr>
			</thead>
			<tbody>
				<c:if test="${empty lessonList }">
					<tr>
						<td colspan="6" align="center">
						등록된 과목 데이터가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${lessonList }" var="row">
					<tr align="center">
						<td>${row.num }</td>
						<td>${row.lnum }</td>
						<td>${row.lname }</td>
						<td>${row.deleteyn }</td>
						<td>${row.insertdate }</td>
						<td>${row.updatedate }</td>
						<td><input type="button" value="[수정/삭제]"
							onclick="updatePopup(${row.num})" /></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="6" align="center">
					처리할 버튼을 선택하세요.</td>
					<td align="center">
						<input type="button" value="[등록]"
						onclick="insertPopup()"/></td>
				</tr>							
			</tbody>						
		</table>
	</div>
	<p></p>
	<div>
		<form id="searchForm" name="searchForm" method="post">
			<div>
				<table border="1" cellpadding="1" cellspacing="1">
					<tr>
						<th width="100px">과목명</th>
						<td><input type="text" id="updatedate" name="updatedate" /></td>
						<td><input type="button" value="검색" onclick="listSearch()" /></td>
					</tr>	
				</table>
			</div>
		</form>
	</div>

</body>
</html>