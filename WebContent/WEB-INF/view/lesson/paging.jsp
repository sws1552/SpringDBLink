<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collection" %>

<%
	/**********************************
	전달해야 할 변수
	***********************************/
	String	url = null;
	String	str = null;
	
	url = request.getParameter("url");
	str = request.getParameter("str");
	if(str != null)
	{
		str = str + "&";
	}
%>

<%
	/**********************************
	페이지 네비게이션 관련 변수
	***********************************/
	// 한페이지에 보여질 게시물의 수
	int pageSize = 0;
	
	// 그룹의 크기
	int groupSize = 0;
	
	// 전체 게시물의 개수
	int totalCount = 0;
	
	//현재 페이지
	int curPage = 0;
	
	// 전체 페이지의 개수
	int pageCount = 0;
	
	if(request.getParameter("pageSize") != null)
	{
		pageSize = Integer.parseInt(request.getParameter("pageSize"));
	}
	
	if(request.getParameter("groupSize") != null)
	{
		groupSize = Integer.parseInt(request.getParameter("groupSize"));
	}
	
	if(request.getParameter("curPage") != null)
	{
		curPage = Integer.parseInt(request.getParameter("curPage"));
	}
	
	if(request.getParameter("totalCount") != null)
	{
		totalCount = Integer.parseInt(request.getParameter("totalCount"));
	}
	
	// 전체게시물수와 페이지크기를 가지고 전체 페이지 개수를 계산함.
	// 소수점에 따라 계산상의 오류가 없도록 한것임.
	// Math.ceil() 함수는 double형을 반환한다. int로 형변환후 전체페이지개수 변수에 대입.
	pageCount = (int)Math.ceil(totalCount / (pageSize+0.0));
	System.out.println("pageCount >>> " + pageCount);
	
	// 현재그룹 설정
	// ex) 0 그룹-> 1 2 3 4 5
	// 	   1 그룹-> 6 7 8 9 10
	int curGroup = (curPage-1) / groupSize;
	
	System.out.println("curGroup >>> " + curGroup);
	
	// 0 = 0 * 5
	// 5 = 1 * 5
	// 10 = 2 * 5
	// 15 = 3 * 5
	int linkPage = curGroup * groupSize;
	
	System.out.println("linkPage >>> " + linkPage);
%>
<p align="right">
<%
	// curGroup이 1, 2, 3, ~~~ 인 경우
	// 첫번째 그룹인 아닌경우
	if(curGroup > 0) {
%>
	<a href="<%=url%>?<%=str%>curPage=1">◁◁</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url%>?<%=str%>curPage=<%=linkPage%>">◀</a>&nbsp;&nbsp;&nbsp;
<%
	}
	else
	{
%>
◁◁&nbsp;&nbsp;&nbsp;◀&nbsp;&nbsp;&nbsp;
<%
	}
	
	// 다음 링크를 위해 증가시킴
	// 현재 페이지가 6이라고 할때
	// 링크페이지는 5이지만, 증감연산자로 인해
	// 6이 된다.
	linkPage++;
	
	// 5
	int loopCount = groupSize;
	
	// 그룹범위내에서 페이지 링크만듬.
	// 루프 카운트이자 그룹의 크기이다 = 5
 	// 반복문의 조건은 현재페이지가 6이라고 가정했을때
 	// 5 > 0 && 6 <= 20
 	// 4 > 0 && 7 <= 20
 	// 5 > 0 && 17 <= 20
 	// 페이지 쪽수 를 만드는 구문
 	// 그룹사이즈 > 0 	&& 현재페이지 +1 <= 전체 페이지 수
	while((loopCount > 0) && (linkPage <= pageCount))
	{
		// 링크페이지와 현재페이지 같을때
		if(linkPage == curPage)
		{
%>
	<%=linkPage%>
<%
		}
		else
		{
%>
	[<a href="<%=url%>?<%=str%>curPage=<%=linkPage%>"><%=linkPage%></a>]&nbsp;
<%
		}
		// 6일때가 출력되고 증감
		// 7
		// 8
		linkPage++;
		
		// 4
		// 3
		loopCount--;
	}
	
	// 다음그룹이 있는 경우
	// 6페이지일때 11 <= 20
 	// 16페이지일때 21 <= 20
	if(linkPage <= pageCount)
	{
%>
	<a href="<%=url%>?<%=str%>curPage=<%=linkPage%>">▶</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url%>?<%=str%>curPage=<%=pageCount%>">▷▷</a>&nbsp;&nbsp;&nbsp;
<%
	}
	else
	{
%>
	▶&nbsp;&nbsp;&nbsp;▷▷&nbsp;&nbsp;&nbsp;
<%
	}
%>
</p>