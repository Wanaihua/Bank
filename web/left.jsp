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
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/left.css">
	<%
    	int n=Integer.parseInt(request.getParameter("id").toString());
    	request.setAttribute("no", -1);
    	int m=Integer.parseInt(request.getParameter("m").toString());
    %>
	<script type="text/javascript">
	function FixedToCurrent() {
			window.open("FixedToCurrent.do?id=<%=n %>","right");
	}
	function a(){
		if(confirm("确定要退出吗?"))
    		window.parent.parent.location.replace("index.jsp");  
    }
    function select(){
    	window.open("select.do?id=<%=n %>","right");
    }
    function get(){
    	if(<%=m %>==1){
    		window.open("get.jsp?id=<%=n %>","right");
    	}
    	else{
    		window.alert("你账户已注销,不支持权限!!");
    	}
    }
    function set(){
    	if(<%=m %>==1){
    		window.open("set.jsp?id=<%=n %>","right");
    	}
    	else{
    		window.alert("你账户已注销,不支持权限!!");
    	}
    }
    function info(){
    	window.open("info.do?id=<%=n %>","right");
    }
    function selfInfo(){
    	window.open("selfInfo.do?id=<%=n %>","right");
    }
    function find(){
    	window.open("find.do?id=<%=n %>","right");
    }
    function cancel(){
    	window.open("cancel.jsp?id=<%=n %>","right");
    }
    function remittance(){
    	if(<%=m %>==1){
    		window.open("remittance.jsp?id=<%=n %>","right");
    	}else{
	    	window.alert("你账户已注销,不支持权限!!");
    	}
    }
	</script>
	<style type="text/css">
	.but {
			margin-left: -20px;
  			display: inline-block;
 			border-radius: 4px;
  			background-color: #FFC1C1;
  			border: none;
  			color: black;
  			text-align: center;
  			font-size: 14px;
  			padding: 10px 0px 10px 0px;
 			 width: 100px;
  			transition: all 0.5s;
  			cursor: pointer;
		}

		.but span {
  			cursor: pointer;
  			display: inline-block;
  			position: relative;
  			transition: 0.5s;
		}

		.but span:after {
 	 		content: '»';
  			position: absolute;
  			opacity: 0;
  			top: 0;
  			right: -10px;
  			transition: 0.5s;
		}
		.but:hover{
			background-color: #CD9B9B;
		}
		.but:hover span {
 	 		padding-right: 12px;
		}
		.but:hover span:after {
  			opacity: 1;
  			right: 0;
		}
	</style>
  </head>
  
  <body>
    <div id="main">
		<div id="left">
	<ul>
		<li><button onclick="select()" class="but"><span><spring:message code="My Money"></spring:message></span></button></li>
		<li><button onclick="get()" class="but"><span><spring:message code="Withdraw money"></spring:message></span></button></li>
		<li><button onclick="set()" class="but"><span><spring:message code="Deposits"></spring:message></span></button></li>
		<li><button onclick="remittance()" class="but"><span><spring:message code="remittance"></spring:message></span></button></li>
		<li><button onclick="FixedToCurrent()" class="but"><span><spring:message code="FixedToCurrent"></spring:message></span></button></li>
		<li><button onclick="info()" class="but"><span><spring:message code="Transaction information"></spring:message></span></button></li>
		<li><button onclick="selfInfo()" class="but"><span><spring:message code="selfInfo"></spring:message></span></button></li>
		<li><button onclick="find()" class="but"><span><spring:message code="updateInfo"></spring:message></span></button></li>
		<li><button onclick="a()" class="but"><span><spring:message code="sign out"></spring:message></span></button></li>
		<li><button onclick="cancel()" class="but"><span><spring:message code="cancellation"></spring:message></span></button></li>
      </ul></div></div>

  </body>
</html>
