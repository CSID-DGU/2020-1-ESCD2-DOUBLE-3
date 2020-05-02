<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/customize.css">
</head>
<body>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>



<style type="text/css">

.jumbotron{
text-shadow:black 0.2em 0.2em 0.2em;
color:white;
background-image:url('images/apple.png');
background-size:cover;
}

</style>
<%@include file="header.jsp"%>
<div class="container">
	<div class="jumbotron" style='background-image:url("resources/images/apple.png")'>

	<c:if test="${empty Sid }">
	<center><div><h2>�α��� ���� ȭ���� ���Դϴ�.</h2></div><center></c:if>
	<c:if test="${not empty Sid }">
<h1 class="text-center">${bank.getBname() }</h1>
<p class="text-center">${bank.getBrest() }</p>	<c:if test="${Siscouncil=='1' }">
<center><button onclick="location='/web/purchase'">���� ���� ����ϱ�</button></center>
	
	
	
	
	</c:if>
	<c:if test="${Siscouncil=='0'|| empty Siscouncil }">
		</c:if>

	<center><button onclick="location='/web/blistall'">ȸ�� ���� ���� ����</button></center>
		</c:if>
	</div>
	


	
</div>
<%@include file="footer.jsp"%>

</body>
</html>