<%@page import="com.sun.corba.se.spi.ior.Writeable"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cancel.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/right.css">
	<style type="text/css">
		.b	{
			margin-top:100px; 
			margin-left: -40px;
		}
		.b {
		  	display: inline-block;
		  	padding: 3px 5px;
		  	font-size: 4px;
		  	cursor: pointer;
		  	text-align: center;   
		  	text-decoration: none;
		  	outline: none;
		 	color: #fff;
		 	background-color: #8b8682;
		  	border: none;
		  	border-radius: 5px;
		 	box-shadow: 0 4px #999;
		}
		
		.b:hover {
			background-color: #363636;
		}
		
		.b:active {
		  	background-color: #363636;
		  	box-shadow: 0 2px #666;
		  	transform: translateY(4px);
		}
		h4,a{
			padding-left: 50px;
		}
	</style>
  </head>
  
  <body>
  <div id="main">
		<div id="top">
		<form method="post">
		<p style="font-size: 15px;">1.你的账户余额必须为零方可进行注销操作;</p>
		<p style="font-size: 15px;">2.账户注销以后可以登录本系统并查看交易信息、个人信息;</p>
		<p style="font-size: 15px;">3.账户注销以后不可以使用本系统的存款、取款、汇款功能</p>
		<input type="button" value="注销" onclick="a()" class="b">
		</form>
		<script type="text/javascript">
  		<%
  			int id=Integer.parseInt(request.getParameter("id"));
  			if(request.getAttribute("n")!=null){
  			int n=Integer.parseInt(request.getAttribute("n").toString());
			out.print("document.write('<h4>余额不为0,请取款后注销.余额:"+n+"</h4>')");
			%>
			document.write('<a href="get.jsp?id=<%=id %>">去取款</a>');
			<%
  		}else{
  		%>
    		function a(){
    			if(confirm("确定注销!!!")){
    				window.open("cancel.do?id=<%=id %>","_self");
    			}
    		
    		}
  		<%
  	}
   %>
   </script>		
    </div>
    </div>
  </body>
</html>
