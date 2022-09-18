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
    
    <title>My JSP 'selfInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/right.css">
	
  </head>
  
  <body>
   <div id="main">
		<div id="top" style="padding-top:20px; padding-left: 100px;">
	<jsp:useBean id="command" class="Bean.BankUser" scope="request"></jsp:useBean>
	<form:form action="update.do" method="post">
	<input type="hidden" name="id" value="${sessionScope.list.get(0).id }"/>
    <table style="border-collapse:separate; border-spacing:0px 10px;">
    	<tr>
    		<td width="100px"><spring:message code="card"></spring:message>:</td><td>${sessionScope.list.get(0).card }</td>
    	</tr>
    	<tr>
    		<td><spring:message code="ps"></spring:message>:</td><td><form:input path="passWord" value="${sessionScope.list.get(0).passWord }"/></td>
    	</tr>
    	<tr>
    		<td><spring:message code="tel"></spring:message>:</td><td><form:input path="tel" value="${sessionScope.list.get(0).tel }"/></td>
    	</tr>
    	<tr>
    		<td><spring:message code="city"></spring:message>:</td><td><form:input path="city" value="${sessionScope.list.get(0).city }" /></td>
    	</tr>
    	<tr>
    		<td><spring:message code="moreInfo"></spring:message>:</td><td><form:textarea path="userAddress" id="address" /></td>
    	</tr>
    	<tr>
    		<td></td><td align="right"><input type="submit" value='<spring:message code="update"></spring:message>' class="but"><td>
    	</tr>
    </table>
    </form:form>
    </div></div>
<script type="text/javascript">
  		var add=document.getElementById("address");
  		add.value='${sessionScope.list.get(0).userAddress }';
  	</script>
  </body>
</html>
