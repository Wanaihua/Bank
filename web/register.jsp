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
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/r1.css">
	<style type="text/css">
		.a{
			margin-left: 50px;
		}
		.b{
			margin-left: 20px;
		}
	</style>
	<script type="text/javascript">
		function look(){
			var one=document.getElementById("ps1").value;
			var two=document.getElementById("ps2").value;
			if(one==two){
				form1.submit();
			}else{
				window.alert("密码不一致!!");
			}
		}
		function checkCode(n){
		var result="";
		var card=document.getElementById("card");
		for(i=0;i<n;i++){
			result=result+(Math.floor(Math.random()*10)).toString();
		}
		card.value=result;
		}
	</script>

  </head>
  
  <body onload="checkCode(10)">
  <div id="main">
  <div id="top" style="padding-top:0px; padding-left: 20px;">
    <jsp:useBean id="command" class="Bean.BankUser" scope="request"></jsp:useBean>
    <form:form name="form1" id="form1" action="register.do">
    <input type="hidden" name="card" id="card" >
    <table style="border-collapse:separate; border-spacing:0px 10px;">
    	<tr>
    		<td><spring:message code="Enterusername"></spring:message>:</td><td><form:input path="userName"/><form:errors path="userName"></form:errors></td>
    	</tr>
    	<tr>
    		<td><spring:message code="password"></spring:message>:</td><td><form:input  path="passWord" type="password" id="ps1"/><form:errors path="passWord"></form:errors></td>
    	</tr>
    	<tr>
    		<td><spring:message code="password1"></spring:message>:</td><td><input  name="passWord1" type="password" id="ps2"/></td>
    	</tr>
    	<tr>
    		<td><spring:message code="age"></spring:message>:</td><td><input name="userAge" placeholder=" "/></td>
    	</tr>
    	<tr>
    		<td><spring:message code="Sex"></spring:message>:</td>
    		<td><input type="radio" name="sex" value="<spring:message code="man"></spring:message>" checked class="b"><spring:message code="man"></spring:message>
     			<input type="radio" name="sex" value="<spring:message code="woman"></spring:message>" class="a" ><spring:message code="woman"></spring:message>
     		</td>
    	</tr>
    	<tr>
    		<td><spring:message code="personTelephone"></spring:message>:</td>
    		<td><form:input path="tel" /><form:errors path="tel"></form:errors></td>
    	</tr>
    	<tr>
    		<td><spring:message code="IdCard"></spring:message>:</td><td><form:input path="idCard"/><form:errors path="idCard"></form:errors></td>
    	</tr>
    	<tr>
    		<td><spring:message code="city"></spring:message>:</td><td><form:input path="city"/><form:errors path="city"></form:errors></td>
    	</tr>
    	<tr>
    		<td><spring:message code="moreInfo"></spring:message>:</td><td><form:textarea path="userAddress"/></td>
    	</tr>
    	<tr>
    		<td></td>
    		<td><input type="button" onclick="look()" value='<spring:message code="register"></spring:message>' class="but" ><input type="reset" value='<spring:message code="reset"></spring:message>' style="margin-left:80px" class="but"></td>
    	</tr>
    
    </table>
    	
    	
    </form:form>
    </div>
    </div>
  </body>
</html>
