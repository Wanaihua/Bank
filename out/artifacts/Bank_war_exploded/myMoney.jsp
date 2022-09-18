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
    
    <title>My JSP 'myMoney.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/right.css">

  </head>
  
  <body>
  <%
  		int sum=0,timeMoney=0;
  		if(request.getAttribute("sum")!=null){
  			sum=Integer.parseInt(request.getAttribute("sum").toString());
  		}
		  if(request.getAttribute("timeMoney")!=null){
  			timeMoney=Integer.parseInt(request.getAttribute("timeMoney").toString());
  		}
   %>
     <div id="main">
		<div id="top" style="padding-top:20px; padding-left: 100px;">
			<table>
				<tr>
					<td>
						<spring:message code="your money"></spring:message><%=sum %>
					</td>
				</tr>
				<tr>
					<td>
						<spring:message code="time money"></spring:message><%=timeMoney %>
					</td>
				</tr>
				<tr>
					<td>
						<spring:message code="all money"></spring:message><%=sum+timeMoney %>
					</td>
				</tr>
			</table>

		</div>

	</div>
  </body>
</html>
