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
		<link rel="stylesheet" type="text/css" href="css/right1.css">

  </head>
  
  <body>
  <%
  String id="1";
  	if(request.getParameter("id")!=null){
  	 id=request.getParameter("id");
  	}else{
  	 id=request.getAttribute("id").toString();
  	}
  	
   %>
    <div id="main">
		<div id="top">
				<table border="1" style="margin-top:-20px; border-collapse:collapse;" >
					<tr align="left" style="background: rgb(223, 216, 232)">
						<td>类型</td><td>金额</td><td>交易时间</td><td>余额</td><td>备注</td>
					</tr>
					<c:forEach var="trade" items="${page.tradelist }" varStatus="s">
　					<tr align="left"  class="column_${s.count }" height="50px" >
		    		<td width="50px">${trade.trade }</td>
		     		<td width="50px">${trade.balance }</td>
		     		<td width="200px">${trade.dataTime }</td>
		     		<td width="50px">${trade.money }</td>
		     		<td width="200px">${trade.info }</td>
		   			</tr>
					 </c:forEach>
				</table>
				 <spring:message code="page"></spring:message>：${page.currentPage}/${page.totalPage}&nbsp;<spring:message code="EachPage"></spring:message>${page.pageSize}&nbsp;<spring:message code="PageSum"></spring:message>${page.totalRecord}&nbsp;&nbsp;&nbsp;&nbsp;
  <br>
 	<a href="
          	<c:url value='info.do'>
           	<c:param name='p' value='1' ></c:param>
       		<c:param name='id' value='<%=id %>'></c:param>
           	</c:url>
       	"><spring:message code="FirstPage"></spring:message></a>
    <c:choose>  
           <c:when test="${page.currentPage>1}">
               <a href="
               			<c:url value='info.do'>
               				<c:param name='p' value='${page.currentPage-1 }' ></c:param>
               				<c:param name='id' value='<%=id %>'></c:param>
               			</c:url>
               		"><spring:message code="PreviousPage"></spring:message></a>
           </c:when>  

    </c:choose>
    <c:choose>  
           <c:when test="${page.currentPage<page.totalPage}">
               <a href="
               			<c:url value='info.do'>
               				<c:param name='p' value='${page.currentPage+1 }' ></c:param>
               				<c:param name='id' value='<%=id %>'></c:param>
               			</c:url>
               		"><spring:message code="NextPage"></spring:message></a>
           </c:when>  
    </c:choose>
    <a href="
        	<c:url value='info.do'>
  			<c:param name='p' value='${page.totalPage}' ></c:param>
   			<c:param name='id' value='<%=id %>'></c:param>
 			</c:url>
         "><spring:message code="LastPage"></spring:message></a>
	</div></div>

  </body>
</html>
