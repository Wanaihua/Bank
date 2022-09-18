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
    
    <title>My JSP 'remittance.jsp' starting page</title>
    
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
    		if(m==-1){
    			l="不存在该账户或账户与名字错误!!!";
    		}else if(m==-2){
    			l="该用户已注销";
    		}else if(m==0){
    			l="余额不足!!";
    		}else{
    			m--;
    			l="汇款成功,余额为:"+m+"";
    		}
    	}
   %>
    <script type="text/javascript">
		function a(){
		var v=document.getElementById("much").value;
		var d=document.getElementById("who").value;
		var e=document.getElementById("number").value;
			if(v==""){
				window.alert("金额不能为空!!!");
			}else if(d==""){
				window.alert("收款人姓名不能为空!!!");
			}else if(e==""){
				window.alert("收款账号不能为空!!!");
			}else
				form1.submit();
		}
	</script>
    <div id="main">
		<div id="top" style="padding-top:20px; padding-left: 100px;">
			<form name="form1" id="form1" action="remittance.do?id=<%=n %>" method="post">
				<table style="border-collapse:separate; border-spacing:0px 10px;">
					<tr>
						<td width="150px"><spring:message code="Please input remittance amount"></spring:message>:</td><td><input type="text" name="much" id="much"></td>
					</tr>
					<tr>
						<td><spring:message code="Please enter the payee's name"></spring:message>:</td><td><input type="text" name="who" id="who"></td>
					</tr>
					<tr>
						<td><spring:message code="Please enter the payee account number"></spring:message>:</td><td><input type="text" name="number" id="number"></td>
					</tr>
					<tr>
						<td></td><td align="right"><input type="button" value='<spring:message code="remittance"></spring:message>' class="but" onclick="a()"></td>
					</tr>
				</table>
				<%=l %>
			</form>
	</div></div>
  </body>
</html>
