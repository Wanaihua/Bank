<%--
  Created by IntelliJ IDEA.
  User: 万爱华
  Date: 2022/9/18
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
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
    <script type="text/javascript" src="js/jquery.min.js"></script>
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
                <td>金额</td><td>交易时间</td><td>年数</td><td>到期结款</td><td>操作</td>
            </tr>
            <c:forEach var="fixedDeposit" items="${page.tradelist }" varStatus="s">
                　					<tr align="left"  class="column_${s.count }" height="50px" id=${fixedDeposit.id} >
                <td width="50px">${fixedDeposit.money }</td>
                <td width="200px">${fixedDeposit.dataTime }</td>
                <td width="50px">${fixedDeposit.year }</td>
                <td width="200px">${fixedDeposit.balanceDue }</td>
                <td width="50px"><input type="button" name="get" id="get" value="取出"></td>
            </tr>
            </c:forEach>
        </table>
        <spring:message code="page"></spring:message>：${page.currentPage}/${page.totalPage}&nbsp;<spring:message code="EachPage"></spring:message>${page.pageSize}&nbsp;<spring:message code="PageSum"></spring:message>${page.totalRecord}&nbsp;&nbsp;&nbsp;&nbsp;
        <br>
        <a href="
          	<c:url value='FixedToCurrent.do'>
           	<c:param name='p' value='1' ></c:param>
       		<c:param name='id' value='<%=id %>'></c:param>
           	</c:url>
       	"><spring:message code="FirstPage"></spring:message></a>
        <c:choose>
            <c:when test="${page.currentPage>1}">
                <a href="
               			<c:url value='FixedToCurrent.do'>
               				<c:param name='p' value='${page.currentPage-1 }' ></c:param>
               				<c:param name='id' value='<%=id %>'></c:param>
               			</c:url>
               		"><spring:message code="PreviousPage"></spring:message></a>
            </c:when>

        </c:choose>
        <c:choose>
            <c:when test="${page.currentPage<page.totalPage}">
                <a href="
               			<c:url value='FixedToCurrent.do'>
               				<c:param name='p' value='${page.currentPage+1 }' ></c:param>
               				<c:param name='id' value='<%=id %>'></c:param>
               			</c:url>
               		"><spring:message code="NextPage"></spring:message></a>
            </c:when>
        </c:choose>
        <a href="
        	<c:url value='FixedToCurrent.do'>
  			<c:param name='p' value='${page.totalPage}' ></c:param>
   			<c:param name='id' value='<%=id %>'></c:param>
 			</c:url>
         "><spring:message code="LastPage"></spring:message></a>
    </div></div>
    <script type="text/javascript">
        $(document).ready(function (){
            $("input[type='button']").click(function (){
               var id=$(this).parent().parent().attr("id");
               var money=$(this).parent().parent().children().eq(0).text();
               var balanceDue=$(this).parent().parent().children().eq(3).text();
               var money1=balanceDue-money;
               if(confirm("取出定期您将损失"+money1+"元")){
                   window.location.href="getTimeMoney.do?id="+id+"";
               }else{
                   return false;
               }

            });
        })
    </script>
</body>
</html>
