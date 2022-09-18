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
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/r1.css">
	<script type="text/javascript">
		function register(){
			window.open("register.jsp","_self");
		}
		<%
		if(request.getAttribute("id")!=null){
		%>
			window.alert("用户名或密码错误!!!");
		<%
		}
		 %>
	</script>
  </head>
  
  <body>
  <div id="main">
  <div id="top">
  <jsp:useBean id="command" class="Bean.BankUser" scope="request"></jsp:useBean>
    <form:form id="form1" name="form1" action="login.do" method="post">
    <table style="border-collapse:separate; border-spacing:0px 10px;">
    <tr>
    	<td><spring:message code="username"></spring:message>:</td><td><form:input path="userName"/><form:errors path="userName"></form:errors></td>
    </tr>
    <tr>
    	<td><spring:message code="ps"></spring:message>:</td><td><form:input path="passWord" type="password" /><form:errors path="passWord"></form:errors><form:errors path="idCard"></form:errors><form:errors path="tel"></form:errors><form:errors path="city"></form:errors></td>
    </tr>
    <tr>
    	<td></td><td><input type="submit" value='<spring:message code="submit"></spring:message>' style="margin-left:40px" class="but"><input type="reset" value='<spring:message code="reset"></spring:message>' style="margin-left:50px" class="but"></td>
    </tr>
    </table>
    <a href="register.jsp" style="padding-top: 70px;"><spring:message code="goRegister"></spring:message></a>
    </form:form></div></div>
  </body>
</html>
