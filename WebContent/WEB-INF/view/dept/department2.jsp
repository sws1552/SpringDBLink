<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.spring.dept.vo.DeptVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>학과 테이블 -javascript</title>
		<!-- 
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.6.4.js"></script>
		 -->
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body>
	
<%

	request.setCharacterEncoding("UTF-8");
	

%>
		<div>
			<table border="1">
				<colgroup>
					<col width="120px"/>
					<col width="220px"/>
					<col width="120px"/>
					<col width="110px"/>
				</colgroup>
				<thead>
					<tr>
						<th>학과코드</th>
						<th>학과명 </th>
						<th>전화번호</th>
						<th>상세보기</th>
					</tr>
				</thead>
				<tbody>
<%


	Object obj = request.getAttribute("departmentList");

	if(obj != null){
	
		List<DeptVO> listAll = (List<DeptVO>)obj;
		int nCnt = listAll.size();




	for(int i = 0; i < nCnt; i++){
		
			DeptVO dvo = listAll.get(i);
			
			if(obj == null){
				
			
						
		
%>
						<tr>
							<td colspan="5" align="center">
							등록된 학과 정보가 존재하지 않습니다.</tr>
						<tr>
<%
			}else{
%>
							<td align="center"><%= dvo.getDeptid() %></td>
							<td align="center"><%= dvo.getDeptname() %></td>
							<td align="center"><%= dvo.getDepttel() %></td>
							<td align="center">
								<input type="button" value="[수정/삭제]"
								onclick="updatePopup('<%= dvo.getDeptid() %>')"/>
							</td>
						</tr>
<%
			}
		}
	}

%>
						<tr>
							<td colspan="3" align="center">처리할 버튼을 선택하세요</td>
							<td align="center">
								<input type="button" onclick="insertPopup()" value="[등록]"/>
							</td>
						</tr>
				</tbody>
			
			</table>
		
		
		</div>
	</body>
</html>