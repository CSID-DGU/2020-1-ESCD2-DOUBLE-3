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
				&nbsp;&nbsp;과별 계좌 조회
				
			</h3>
		</div>
	
		<table class="table">
			<thead>
			  <tr>
  				<td colspan="5" align="right"> 총 내역 목록 : <b>${totalCount }</b>개
  			</tr>
			<tr>
			<th>학과</th>	<th>계좌 번호</th>	<th>잔액</th>
			</tr>
			</thead>
			<tbody>
	  <c:if test="${!empty allbank }">
	  
   <c:forEach var= "list" items="${allbank }">

   <tr>  
       <th><a href="adminblist?bname='${list.getBname() }'">${list.getBname() }</a></th>
    <th>${list.getBid() }</th>

    <th>${list.getBrest() }</th>
  </tr> 
  </form>
  </c:forEach>
  </c:if>
  
    <c:if test="${empty allbank }">
  <tr>   <th colspan="5">게시판 목록이 없습니다!</th></tr></c:if>
			</tbody>
	
		</table>
			<div class="panel-footer"><form action="addbank" method="post">
					<blockquote>
					<input type="text" placeholder="bank_id" name="Bid">
					<input type="password" placeholder="bank_password" name="Bpw">
					<input type="text" placeholder="bank_name" name="Bname">
					<input type="submit" value="계좌 추가" name="addbank"></blockquote>
					</form>
			</div>
		
		</div></div>
	</div>
</div>

<div class="footer">
<%@include file="../template/footer.jsp"%></div>
</body>
</html>