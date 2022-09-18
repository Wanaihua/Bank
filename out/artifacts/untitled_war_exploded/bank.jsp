<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bank.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
   <%
    	int n=Integer.parseInt(request.getAttribute("id").toString());
    	int m=Integer.parseInt(request.getAttribute("m").toString());
   %>
		<frameset cols="42%,*" border="0">
		<frame name="left" src="left.jsp?id=<%=n %>&m=<%=m %>" scrolling="no"></frame>
		<frame name="right" src="right.jsp" scrolling="no"></frame>
		</frameset><noframes></noframes>
	
  <body>
  </body>
</html>
