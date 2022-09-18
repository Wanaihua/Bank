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
	  <script type="text/javascript" src="js/jquery.min.js"></script>

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
						<td></td><td>
						<input type="radio" name="type" value="1" id="died" checked="checked"><spring:message code="Current deposit"></spring:message>
						<input type="radio" name="type" value="0" id="life" ><spring:message code="Fixed deposit"></spring:message>
						</td>
					</tr>
					<tr id="tr1">
						<td><spring:message code="Please enter the year"></spring:message>:</td><td><input type="text" name="year" id="year"></td>
					</tr>
					<tr id="tr2">
						<td><spring:message code="Balance due"></spring:message>:</td><td><input type="text" name="balanceDue" id="balanceDue"></td>
					</tr>
					<tr>
						<td></td><td align="right"><input type="button" value='<spring:message code="deposit"></spring:message>' class="but" onclick="a()"></td>
					</tr>
				</table>
				<%=l %>
			</form>
			<table style="padding-top: 100px;">
				<tr>
					<td>
						<spring:message code="time_money_1"></spring:message>
					</td>
				</tr>
				<tr>
					<td>
						<spring:message code="time_money_2"></spring:message>
					</td>
				</tr>
				<tr>
					<td>
						<spring:message code="time_money_3"></spring:message>
					</td>
				</tr>
				<tr>
					<td>
						<spring:message code="time_money_5"></spring:message>
					</td>
				</tr>
			</table>

	</div></div>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#tr1").hide();
			$("#tr2").hide();
			$("#died").click(function(){
				$("#tr1").hide();
				$("#tr2").hide();
			});
			$("#life").click(function(){
				$("#tr1").show();
				$("#tr2").show();
			});
			var money,year;
			money=year=null;
			$("#much").blur(function (){
				money=$("#much").val();
				if(money!=null&&year!=null){
					if(year==1){
						money=money*(1+0.0203);
					}else if(year==2){
						for(var i=1;i<=2;i++) money=money*(1+0.0282);
					}else if(year==3||year==4){
						for(var i=1;i<=year;i++) money=money*(1+0.0355);
					}else if(year>=5){
						for(var i=1;i<=year;i++) money=money*(1+0.0367);
					}
					document.getElementById("balanceDue").value=money;
				}
			});
			$("#year").blur(function (){
				year=$("#year").val();
				money=$("#much").val();
				if(money!=null&&year!=null){
					if(year==1){
						money=money*(1+0.0203);
					}else if(year==2){
						for(var i=1;i<=2;i++) money=money*(1+0.0282);
					}else if(year==3||year==4){
						for(var i=1;i<=year;i++) money=money*(1+0.0355);
					}else if(year>=5){
						for(var i=1;i<=year;i++) money=money*(1+0.0367);
					}
					document.getElementById("balanceDue").value=money;
				}
			});

		})
	</script>
  </body>
</html>
