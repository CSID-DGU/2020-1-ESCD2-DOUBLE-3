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
</head>

<body class="body">

<%@include file="../template/header.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-xs-12">
		<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-tags"></span>
				&nbsp;&nbsp;학생 회비 내역 - 현 칼럼에서 해쉬 값을 다시 계산 했을 때 안 맞는 경우
				
			</h3>
		</div>
	
		<table class="table">
			<thead>
			  <tr>
  				<td colspan="5" align="right"> 총 내역 목록 : <b>${totalCount }</b>개
  			</tr>
			<tr>
			<th>날짜</th>	<th>잔액</th>	<th>사용자</th>	<th>사용 금액</th><th>내역</th><th>파일</th>
			</tr>
			</thead>
			<tbody>
	  <c:if test="${!empty blv1 }">
   <c:forEach var= "list" items="${blv1 }">
   <tr>
    <th>${list.getBdate() }</th><input type="hidden" name="Bdate">
    <th>${list.getBrest() }</th><input type="hidden" name="Brest">
    <th>${list.getBuser() }</th><input type="hidden" name="Buser">
    <th>${list.getBinout() }</th><input type="hidden" name="Binout">
    <th>${list.getBmemo() }</th><input type="hidden" name="Bmemo">
    <th><a href="/web/downloadFile?fname=${list.getFname() }  ">${list.getFname() }  </a><br>
    

    </th>
  </tr></c:forEach></c:if>
  
    <c:if test="${empty blv1 }">
  <tr>
   <th colspan="5">게시판 목록이 없습니다!</th></tr></c:if>
			</tbody>
	
		</table>
		
		
		<br><br><br><br><br>
			<div class="panel-heading">
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-tags"></span>
				&nbsp;&nbsp;학생 회비 내역 - 현 칼럼의 prehash 값과 전 칼럼의 thishash값이 안 맞는 경우
				
			</h3>
		</div>
		
		
			
		<table class="table">
			<thead>
			  <tr>
  			</tr>
			<tr>
			<th>날짜</th>	<th>잔액</th>	<th>사용자</th>	<th>사용 금액</th><th>내역</th><th>파일</th>
			</tr>
			</thead>
			<tbody>
	  <c:if test="${!empty blv2 }">
   <c:forEach var= "list" items="${blv2 }">
   <tr>
    <th>${list.getBdate() }</th><input type="hidden" name="Bdate">
    <th>${list.getBrest() }</th><input type="hidden" name="Brest">
    <th>${list.getBuser() }</th><input type="hidden" name="Buser">
    <th>${list.getBinout() }</th><input type="hidden" name="Binout">
    <th>${list.getBmemo() }</th><input type="hidden" name="Bmemo">
    <th><a href="/web/downloadFile?fname=${list.getFname() }  ">${list.getFname() }  </a><br>
    

    </th>
  </tr></c:forEach></c:if>
  
    <c:if test="${empty blv2 }">
  <tr>
   <th colspan="5">게시판 목록이 없습니다!</th></tr></c:if>
			</tbody>
	
		</table>
		
		
			<br><br><br><br><br>
			<div class="panel-heading">
			<h3 class="panel-title">
				<span class="glyphicon glyphicon-tags"></span>
				&nbsp;&nbsp;학생 회비 내역 - 다른 기관의 블록체인과 지금의 블록체인의 비교
				
			</h3>
		</div>
		
			
		<table class="table">
			<thead>
			  <tr>
  			</tr>
			<tr>
			<th>날짜</th>	<th>잔액</th>	<th>사용자</th>	<th>사용 금액</th><th>내역</th><th>파일</th>
			</tr>
			</thead>
			<tbody>
	  <c:if test="${!empty blv3 }">
   <c:forEach var= "list" items="${blv3 }">
   <tr>
    <th>${list.getBdate() }</th><input type="hidden" name="Bdate">
    <th>${list.getBrest() }</th><input type="hidden" name="Brest">
    <th>${list.getBuser() }</th><input type="hidden" name="Buser">
    <th>${list.getBinout() }</th><input type="hidden" name="Binout">
    <th>${list.getBmemo() }</th><input type="hidden" name="Bmemo">
    <th><a href="/web/downloadFile?fname=${list.getFname() }  ">${list.getFname() }  </a><br>
    

    </th>
  </tr></c:forEach></c:if>
  
    <c:if test="${empty blv3 }">
  <tr>
   <th colspan="5">게시판 목록이 없습니다!</th></tr></c:if>
			</tbody>
	
		</table>
	
		
		</div></div>
	</div>
</div>

<div id="footer">
<%@include file="../template/footer.jsp"%></div>
</body>
</html>