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
    
    <title>My JSP 'right.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/right.css">
	<style type="text/css">
		.one{
			font-style:italic;
			letter-spacing:5px;
			line-height: 30px;
			font-weight: bold;
		}	
	</style>
  </head>
  
  <body>
    <div id="main">
		<div id="top">
	<p class="one">鸦片战争后，外国银行涌入中国，通过垄断国际汇兑业务、资本输出、政治贷款、发钞、经营中国对外赔款等手段，扼住了中国金融、财政的咽喉。1895年甲午战争后，外国资本大量涌进国门，中国的金融、财政状况更加恶化。19世纪末，国内有识之士倡导兴办银行，“以中国之银，供中国之用”。</p>

<p class="one">中国银行的前身是中国第一家国家银行——户部银行。光绪30年元月28日（1903年3月14日），奕劻上奏“试办大清户部银行推行银币”。经过一年多的筹备，中国历史上第一家国家银行——户部银行于1905年8月在北京成立。1906年，户部更名为度支部。1908年2月，户部银行改为大清银行，行使中央银行职能。到1911年，大清银行在全国各省省会和通商口岸设立分支机构35处，成为清末规模最大的银行。
</p></div></div>

  </body>
</html>
