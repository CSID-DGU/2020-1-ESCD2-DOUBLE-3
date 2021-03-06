<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/customize.css">
<link rel="stylesheet" href="resources/css/template.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<body class="body">

<style>

blockquote{
background:#f9f9f9;
border-left:10px solid #cccccc;
margin: 1.5em 10px;
padding: 0.5em 10px;
quotes: "\201C""\201D""\2018""\2019"
}
blockquote:before{
color:#cccccc;
content:open-quote;
font-size:3em;
line-height:0.1em;
margin-left:0.25em;
vertical-align:-0.4em;
}
blockquote:after{
color:#cccccc;
content:close-quote;
font-size:3em;
line-height:0.1em;
margin-left:0.25em;
vertical-align:-0.4em;
}


</style>

<%@include file="../template/header.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-xs-12">
		<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-tags"></span>
				&nbsp;&nbsp;학생 회비 내역 사용 요청 내역
			</h3>
		</div>
	
		<table class="table">
			<thead>
			<tr><td>내 학번</td><td>내 이름</td>	<td>내 전화번호</td>	<td>내 학년</td>	<td>내 전공</td>	<td>내 권한</td></tr>
			<tr>	<td>${Sid }</td><td>${Sname }</td>	<td>${Snum }</td>	<td>${Sgrade }</td>	<td>${Smajor }</td>	<td>${Siscouncil }</td>
			<td>
			<c:if test="${Siscouncil!=10}">	
			<form action="fee" method="post">
			<input type="text" placeholder="후원/납부 금액" name="money">
			<input type="submit" value="후원/회비납부"></form>
			</c:if>
			</td></tr>
				<tr>권한에 따라 보이지 않을 수 있습니다.</tr>
			  <tr>
  				<td colspan="5" align="right"> 총 내역 목록 : <b>${totalCount }</b>개
  			</tr>
			<tr>
			<th>날짜</th>	<th>잔액</th>	<th>사용자</th>	<th>사용 금액</th><th>내역</th><th>파일</th>
			</tr>
			</thead>
			<tbody>
		<c:if test="${Siscouncil>1}">	
	  <c:if test="${!empty bl }">

   <c:forEach var= "list" items="${bl }">
 
    <form name="uploadForm" method="post" action="purchase_ok" enctype="multipart/form-data">
   <tr>
    <th>${list.getBdate() }</th><input type="hidden" value="${list.getBdate()}" name="Bdate">
    <th>${list.getBrest() }</th><input type="hidden" value="${list.getBrest()}" name="Brest">
    <th>${list.getBuser() }</th><input type="hidden" value="${list.getBuser()}" name="Buser">
    <th>${list.getBinout() }</th><input type="hidden" value="${list.getBinout()}" name="Binout">
    <th>${list.getBmemo() }</th><input type="hidden" value="${list.getBmemo()}" name="Bmemo">
    <th>${list.getFname() }</th>
    <th>
    <input type="file" name="imgFile">


  </th>
    <th><input type="password" name="Bpw"></th>
    <th><input type="submit" value="승인"></th>
  </tr>  </form></c:forEach>
</c:if>
  
    <c:if test="${empty bl }">
  <tr>
   <th colspan="5">게시판 목록이 없습니다!</th></tr></c:if>
			</tbody>
</c:if>
			
	<center><tr>
   		<th colspan="5">
   			<c:if test="${page<=1 }">
   				[이전]&nbsp;
   			</c:if>
   			<c:if test="${page>1 }">
   				<a href="/web/blistall?page=${page-1 }">[이전]</a>&nbsp;
   			</c:if>
   			
   			<%--현재쪽 번호 출력 --%>
   			<c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
   				<c:if test="${a==page }"><%--현재 쪽번호가 선택된 경우는 링크 없어도됨 --%>
   					 <${a }>
   				</c:if>
   				<c:if test="${a!=page}">
   					<a href="/web/blistall?page=${a }">[${a }]</a>&nbsp;
   					
   				</c:if>
   			</c:forEach>
   			<c:if test="${page>=endpage }"><!-- maxpage =>endpage로바꾸면..? -->
   			[다음]
   			</c:if>
   			<c:if test="${page<endpage }">
   			<a href="/web/blistall?page=${page+1 }">[다음]</a>
   			</c:if>
   			
   		</th>
   </tr></center>
		</table>
	
		</div></div>
	</div>
</div>





<div class="footer">
<%@include file="../template/footer.jsp"%></div>

</body>
</html>