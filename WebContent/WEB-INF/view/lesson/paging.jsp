<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collection" %>

<%
	/**********************************
	�����ؾ� �� ����
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
	������ �׺���̼� ���� ����
	***********************************/
	// ���������� ������ �Խù��� ��
	int pageSize = 0;
	
	// �׷��� ũ��
	int groupSize = 0;
	
	// ��ü �Խù��� ����
	int totalCount = 0;
	
	//���� ������
	int curPage = 0;
	
	// ��ü �������� ����
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
	
	// ��ü�Խù����� ������ũ�⸦ ������ ��ü ������ ������ �����.
	// �Ҽ����� ���� ������ ������ ������ �Ѱ���.
	// Math.ceil() �Լ��� double���� ��ȯ�Ѵ�. int�� ����ȯ�� ��ü���������� ������ ����.
	pageCount = (int)Math.ceil(totalCount / (pageSize+0.0));
	System.out.println("pageCount >>> " + pageCount);
	
	// ����׷� ����
	// ex) 0 �׷�-> 1 2 3 4 5
	// 	   1 �׷�-> 6 7 8 9 10
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
	// curGroup�� 1, 2, 3, ~~~ �� ���
	// ù��° �׷��� �ƴѰ��
	if(curGroup > 0) {
%>
	<a href="<%=url%>?<%=str%>curPage=1">����</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url%>?<%=str%>curPage=<%=linkPage%>">��</a>&nbsp;&nbsp;&nbsp;
<%
	}
	else
	{
%>
����&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;
<%
	}
	
	// ���� ��ũ�� ���� ������Ŵ
	// ���� �������� 6�̶�� �Ҷ�
	// ��ũ�������� 5������, ���������ڷ� ����
	// 6�� �ȴ�.
	linkPage++;
	
	// 5
	int loopCount = groupSize;
	
	// �׷���������� ������ ��ũ����.
	// ���� ī��Ʈ���� �׷��� ũ���̴� = 5
 	// �ݺ����� ������ ������������ 6�̶�� ����������
 	// 5 > 0 && 6 <= 20
 	// 4 > 0 && 7 <= 20
 	// 5 > 0 && 17 <= 20
 	// ������ �ʼ� �� ����� ����
 	// �׷������ > 0 	&& ���������� +1 <= ��ü ������ ��
	while((loopCount > 0) && (linkPage <= pageCount))
	{
		// ��ũ�������� ���������� ������
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
		// 6�϶��� ��µǰ� ����
		// 7
		// 8
		linkPage++;
		
		// 4
		// 3
		loopCount--;
	}
	
	// �����׷��� �ִ� ���
	// 6�������϶� 11 <= 20
 	// 16�������϶� 21 <= 20
	if(linkPage <= pageCount)
	{
%>
	<a href="<%=url%>?<%=str%>curPage=<%=linkPage%>">��</a>&nbsp;&nbsp;&nbsp;
	<a href="<%=url%>?<%=str%>curPage=<%=pageCount%>">����</a>&nbsp;&nbsp;&nbsp;
<%
	}
	else
	{
%>
	��&nbsp;&nbsp;&nbsp;����&nbsp;&nbsp;&nbsp;
<%
	}
%>
</p>