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
    
    <title>My JSP 'registerShow.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/r1.css">
	<script type="text/javascript">
		function a(){
			window.parent.parent.location.replace("index.jsp");  
		}
	</script>
  </head>
  
  <body>
    <div id="main">
  <div id="top">
    	<table style="border-collapse:separate; border-spacing:0px 10px;">
    		<tr>
    			<td colspan="2" style="font-size: 20px; font-weight: bold;">注册成功,你的个人信息如下</td>
    		</tr>
    		<tr>
    			<td><spring:message code="user"></spring:message>:</td><td>${sessionScope.list.get(0).card }</td>
    		</tr>
    		<tr>
    			<td><spring:message code="Account balance"></spring:message>:</td><td>0</td>
    		</tr>
    		<tr>
    			<td><spring:message code="userName"></spring:message>:</td><td>${sessionScope.list.get(0).userName }</td>
    		</tr>
    		<tr>
    			<td><spring:message code="userSex"></spring:message>:</td><td>${sessionScope.list.get(0).sex }</td>
    		</tr>
    		<tr>
    			<td><spring:message code="userAge"></spring:message>:</td><td>${sessionScope.list.get(0).userAge }</td>
    		</tr>
    		<tr>
    			<td>身&nbsp;份&nbsp;证:</td><td>${sessionScope.list.get(0).idCard }</td>
    		</tr>
    		<tr>
    			<td><spring:message code="tel"></spring:message>:</td><td>${sessionScope.list.get(0).tel }</td>
    		</tr>
    		<tr>
    			<td>城&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;市:</td><td>${sessionScope.list.get(0).city }</td>
    		</tr>
    		<tr>
    			<td><spring:message code="userAddress"></spring:message>:</td><td>${sessionScope.list.get(0).userAddress }</td>
    		</tr>
    	
    	</table>
    </div>
    <input type="button" onclick="a()" value='<spring:message code="goLogin"></spring:message>' class="but" style="margin-top: 420px; margin-left: 20px;">
    </div>
  </body>
</html>
