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
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/top.css">
	

  </head>
  
  <body>
    <div id="main">
	<div id="left"><img src="images/logo-m.png" height="18%" width="60%"></div>
	<div id="right">
		<p><spring:message code="Service hotline"></spring:message>：<span>95566</span> <span><spring:message code="Credit card hotline"></spring:message>：<span>40066 95566</span></p>
	</div>
		<h1><marquee direction="left" scrollamount="10" scrolldelay="10" behavior="scroll" bgcolor="#D4D4D4" height="30px">在任何情况下，爱华很行不会向您查询密码。在任何情况下都不要将您的密码告诉他人（包括银行员工或警方），不要轻信任何套取网上银行用户名（登录卡号）和密码的行为，不法分子可能通过电子邮件、信函、电话、手机短信等方式向您索要银行卡号、用户名和密码。若有任何怀疑，请立即致电爱华很行客户服务热线与我们联系。</marquee></h1>
	</div>
  </body>
</html>
