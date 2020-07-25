<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type = "text/css">
table {
   width: 570px;
}

#searchForm table th {
   width: 114px;
}

#searchForm table td {
   width: 104px;
   text-align: center;
}

#deptname {
   width: 328px;
}
</style>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type = "text/javascript">
$(document).ready(function() {
   console.log("jQuery 블럭 안으로");
   
   /* [등록] 버튼 클릭 시 이벤트. */
   $("#insertPopup").on("click", function(){
      console.log("insertPopup 블럭 안으로");
      
      $("#deptid").val("");
      
      window.open("","pop", "width=480, height=280");
      
      $("#popupForm").attr("action", "selectDepartment.sws");
      $("#popupForm").attr("target","pop"); //$("selector").attr("attribute, value")
      
      $("#popupForm").submit();
   });
   
   /* [수정/삭제] 버튼 클릭 시 이벤트. */
   $(".updatePopup").on("click", function(){
      console.log("updatePopup 블럭 안으로");
      
      $("#deptid").val($(this).attr("id"));
      
      window.open("", "pop", "width=480, height=280");
      
      $("#popupForm").attr("action", "selectDepartment.sws");
      $("#popupForm").attr("target","pop");
      
      $("#popupForm").submit();
   });
   
   /* [검색] 버튼 클릭 시 이벤트.  */
   $("#listSearch").on("click", function(){
      console.log("listSearch 블럭 안으로");
      $("#searchForm").attr("action", "listDepartment.sws");
      
      $("searchForm").submit();
   });
});
</script>

<title>학과 테이블</title>
</head>
<body>
   <form id="popupForm" name="popupForm" method="post">
      <input type="hidden" name="deptid" id="deptid" />
   </form>
   
   <div>
      <table border="0">
         <tr>
            <th>
               <h4>학과 테이블[Spring]</h4>
            </th>
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
         </colgroup>
         <thead>
            <tr>
               <th>학과코드</th>
               <th>학과명</th>
               <th>전화번호</th>
               <th>상세보기</th>
            </tr>
         </thead>
         <tbody>
            <c:if test="${empty departmentList}">
               <tr>
                  <td colspan="5" align="center">등록된 학과 정보가 존재하지 않습니다.</td>
               </tr>
            </c:if>
            <c:forEach items="${departmentList}" var="row">
               <tr>
                  <td align="center">${row.deptid}</td>
                  <td align="left">${row.deptname}</td>
                  <td align="center">${row.depttel}</td>
                  <td align="center">
                     <input type="button" id="${row.deptid}" class="updatePopup" value="[수정/삭제]" />
                  </td>
               </tr>
            </c:forEach>
            <tr>
               <td colspan="3" align="center">처리할 버튼을 선택하게요</td>
               <td align="center">
                  <input type="button" id="insertPopup" value="[등록]" />
               </td>
            </tr>
         </tbody>
      </table>
   </div>
   
   <p></p>
   
   <div>
      <!-- search -->
      <form id="searchForm" name="searchForm" method="post">
         <table border="1" cellpadding="1" cellspacing="1">
            <tr>
               <th>학 과 명</th>
               <td>
                  <input type="text" id="deptname" name="deptname" />
               </td>
               <td>
                  <input type="button" id="listSearch" value="검색" />
               </td>
            </tr>
         </table>
      </form>
   </div>
</body>
</html>