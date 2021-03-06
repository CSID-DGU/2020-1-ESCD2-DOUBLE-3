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
<script>

</script>

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
				&nbsp;&nbsp;학생 회비 내역
				
			</h3>
		</div>
	
		<table class="table">
			<thead>
			  <tr>
  				<td colspan="5" align="right"> 총 내역 목록 : <b>${totalCount }</b>개
  			</tr>
			<tr>
			<th>날짜</th>	<th>잔액</th>	<th>사용자</th>	<th>사용 금액</th><th>내역</th><th>증빙 파일</th><th>증빙 파일 업로드</th>
			</tr>
			</thead>
			<tbody>
	  <c:if test="${!empty bl }">
	  
   <c:forEach var= "list" items="${bl }">
   <form name="uploadForm" method="post" action="upload_ok" enctype="multipart/form-data">
   <tr>
    <th>${list.getBdate() }</th><input type="hidden" value="${list.getBdate()}" name="Bdate"/>
    <th>${list.getBrest() }</th><input type="hidden" value="${list.getBrest()}" name="Brest"/>
    <th>${list.getBuser() }</th><input type="hidden" value="${list.getBuser()}" name="Buser"/>
    <th>${list.getBinout() }</th><input type="hidden" value="${list.getBinout()}" name="Binout"/>
    <th>${list.getBmemo() }</th><input type="hidden" value="${list.getBmemo()}" name="Bmemo"/>
    <c:if test="${!empty list.getFname()}">
    <th><a href="/web/downloadFile?fname=${list.getFname() }  ">${list.getFname() }  </a></th>  </c:if>
    
    <c:if test="${empty list.getFname() }">
    <c:if test="${Siscouncil>'1' }">
    <th> 
       <input type="file" name="imgFile"></th>
    <th><input type="submit" value="업로드"></th>
    </c:if></c:if>

  </tr>  </form>
  </c:forEach>
  </c:if>
  
    <c:if test="${empty bl }">
  <tr>   <th colspan="5">게시판 목록이 없습니다!</th></tr></c:if>
			</tbody>
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
			<div class="panel-footer"><form action="blockchain" method="post">
					<blockquote><input type="submit" value="무결성 검사" name="verify"></blockquote>
					</form>
			</div>
		
		</div></div>
	</div>
</div>

<div class="footer">
<%@include file="../template/footer.jsp"%></div>
</body>
</html>