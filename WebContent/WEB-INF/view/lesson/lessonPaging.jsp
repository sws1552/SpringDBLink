<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.spring.lesson.vo.LessonVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 테이블</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type = "text/javascript">
	/*function insertPopup(){
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
	}*/
	
	$(document).ready(function(){
		console.log("jQuery 블럭 안으로");
		
		// 등록 버튼 클릭시
		$("#insertPopup").on("click",function(){
			console.log("insertPopup 함수");
			
			$("#num").val(0);
			
			window.open("", "pop", "width=480, height=280");
			$("#popupForm").attr("action","selectLesson.sws");
			$("#popupForm").attr("target","pop");
			$("#popupForm").submit();
			
		});
		
		// 수정 삭제 버튼 클릭시
		$("#updatePopup").on("click",function(){
			console.log("updatePopup 함수");
			
			$("#num").val($(this).attr("class"));
			
			window.open("", "pop", "width=480, height=280");
			$("#popupForm").attr("action","selectLesson.sws");
			$("#popupForm").attr("target","pop");
			$("#popupForm").submit();
			
		});
		
		// 검색 버튼 클릭시
		$("#listSearch").on("click",function(){
			console.log("listSearch 함수");
			
			$("#searchForm").attr("action","listLesson.sws");
			$("#searchForm").submit();
			
		});
	});


</script>
<style type="text/css">
	table{width:570px}
	#searchForm table th{width:114px}
	#searchForm table td{width:104px; text-align:center;}
	#lname{width:328px}
</style>
</head>
<body>
<%
	int pageSize = 0;
	int groupSize = 0;
	int curPage = 0;
	int totalCount = 0;
	
	Object obj = request.getAttribute("listLessonPaging");
	
	List<LessonVO> aList = (List<LessonVO>)obj;
	int nCnt = aList.size();
%>



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
<%
	for(int i=0; i < nCnt; i++){
		LessonVO lvo = aList.get(i);
		System.out.println("lvo.getPagesize !! " + lvo.getPagesize());
		System.out.println("lvo.getGroupsize !! " + lvo.getGroupsize());
		System.out.println("lvo.getCurpage !! " + lvo.getCurpage());
		System.out.println("lvo.getTotalCount !! " + lvo.getTotalcount());
		
		pageSize = Integer.parseInt(lvo.getPagesize());
		groupSize = Integer.parseInt(lvo.getGroupsize());
		curPage = Integer.parseInt(lvo.getCurpage());
		totalCount = Integer.parseInt(lvo.getTotalcount());
		
	}

%>
				<c:if test="${empty listLessonPaging }">
					<tr>
						<td colspan="6" align="center">
						등록된 과목 데이터가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:forEach items="${listLessonPaging }" var="row">
					<tr align="center">
						<td>${row.num }</td>
						<td>${row.lnum }</td>
						<td>${row.lname }</td>
						<td>${row.deleteyn }</td>
						<td>${row.insertdate }</td>
						<td>${row.updatedate }</td>
						<td><input type="button" value="[수정/삭제]"
							id="updatePopup" class="${row.num}" /></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="6" align="center">
					처리할 버튼을 선택하세요.</td>
					<td align="center">
						<input type="button" value="[등록]"
						id="insertPopup"/></td>
				</tr>
				<tr>
					<td colspan = "7">
					<jsp:include page="paging.jsp" flush="true">
					<jsp:param name="url" value="listLessonPaging.sws"/>
					<jsp:param name="str" value=""/>
					<jsp:param name="pageSize" value="<%=pageSize%>"/>
					<jsp:param name="groupSize" value="<%=groupSize%>"/>
					<jsp:param name="curPage" value="<%=curPage%>"/>
					<jsp:param name="totalCount" value="<%=totalCount%>"/>
				</jsp:include>
				</td>
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
						<td><input type="button" value="검색" id="listSearch" /></td>
					</tr>	
				</table>
			</div>
		</form>
	</div>

</body>
</html>