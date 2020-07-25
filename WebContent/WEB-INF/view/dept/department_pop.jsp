<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
.required {
   color: red;
}

table {
   width: 450px;
}

table th {
   width: 120px;
   text-align: left;
}

input[type="text"] {
   width: 330px
}
</style>

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(document).ready(function() {
   var mode = "${mode}";
   
   // 수정 버튼 클릭 시 이벤트.
   if (mode == "insert") {
      $("#insertData").attr("disabled", false);
      $("#updateData").attr("disabled", true);
      $("#deleteData").attr("disabled", true);
      
   // 수정 버튼 클릭 시 이벤트.
   } else if (mode == "update") {
      $("#insertData").attr("disabled", true);
      $("#updateData").attr("disabled", false);
      $("#deleteData").attr("disabled", false);

   }

   // 등록 버튼 클릭 시 이벤트.
   $("#insertData").on("click", function() {
      if (!validateForm()) {
         return;
      }

      if (confirm('등록을 진행할까요?')) {
         $("#deptForm").attr("action", "insertDepartment.sws");
         
         $("#deptForm").submit();
      }
   });

   // 수정 버튼 클릭 시 이벤트.
   $("#updateData").on("click", function() {
      if (!validateForm()) {
         return;
      }
      
      if (confirm('수정을 진행할까요?')) {
         $("#deptForm").attr("action", "updateDepartment.sws");
         
         $("#deptForm").submit();
      }
   });

   // 삭제 버튼 클릭 시 이벤트.
   $("#deleteData").on("click", function() {
      if (confirm('삭제를 진행할까요?')) {
         $("#deptForm").attr("action", "deleteDepartment.sws");
         
         $("#deptForm").submit();
      }
   });

   // 닫기 버튼 클릭 시 이벤트.
   $("#closeWindow").on("click", function() {
      window.close();
   });

});

// 유효성 검사 양식.
function validateForm() {
   if ($("#deptid").val().replace(/\s/g, "") == "") {
      alert('학과코드를 입력해주세요');
      
      return false;
   }
   
   if ($("#deptname").val().replace(/\s/g, "") == "") {
      alert('학과명을 입력해주세요');
      
      return false;
   }
   
   return true;
}
</script>

<title>학과 테이블 팝업</title>
</head>
<body>
   <p></p>

   <div>
      <form id="deptForm" name="deptForm" method="post">
         <table border="1">
            <thead>
               <tr>
                  <td colspan="2" align="center">
                     <h4>학과 테이블 팝업창 [Spring]</h4>
                  </td>
               </tr>
            </thead>
            <tbody>
               <tr>
                  <th>
                     <span class="required">*</span>학과코드
                  </th>
                  <td>
                     <input type="text" id="deptid" name="deptid" value="${DeptVO.deptid}" />
                  </td>
               </tr>
               <tr>
                  <th>
                     <span class="required">*</span>학과명
                  </th>
                  <td>
                     <input type="text" id="deptname" name="deptname" value="${DeptVO.deptname}" />
                  </td>
               </tr>
               <tr>
                  <th>
                     <span class="required">*</span>전화번호
                  </th>
                  <td>
                     <input type="text" id="depttel" name="depttel" value="${DeptVO.depttel}" />
                  </td>
               </tr>
            </tbody>
         </table>
      </form>
   </div>
   
   <div>
      <p></p>
      <table border="0">
         <tr align="center">
            <td><input type="button" id="insertData" value="등록" /></td>
            <td><input type="button" id="updateData" value="수정" /></td>
            <td><input type="button" id="deleteData" value="삭제" /></td>
            <td><input type="button" id="closeWindow" value="닫기" /></td>
         </tr>
      </table>
   </div>
</body>
</html>