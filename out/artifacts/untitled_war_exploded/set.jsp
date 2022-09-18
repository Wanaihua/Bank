<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'get.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="css/right.css">

  </head>
  
  <body>
   <%
    	int n=Integer.parseInt(request.getParameter("id").toString());
    	String l="";
    	if(request.getAttribute("no")!=null){
    		int m=Integer.parseInt(request.getAttribute("no").toString());
    		l="存款成功,余额为:"+m+"";
    	}
   %>
    <script type="text/javascript">
		function a(){
		var v=document.getElementById("much").value;
			if(v==""){
				window.alert("金额不能为空!!!");
			}else
				form1.submit();
		}
	</script>
    <div id="main">
		<div id="top" style="padding-top:20px; padding-left: 100px;">
			<form name="form1" id="form1" action="set.do?id=<%=n %>" method="post">
				<table>
					<tr>
						<td><spring:message code="Please enter the deposit amount"></spring:message>:</td><td><input type="text" name="much" id="much"></td>
					</tr>
					<tr>
						<td></td><td align="right"><input type="button" value='<spring:message code="deposit"></spring:message>' class="but" onclick="a()"></td>
					</tr>
				</table>
				<%=l %>
			</form>
	</div></div>

  </body>
</html>
