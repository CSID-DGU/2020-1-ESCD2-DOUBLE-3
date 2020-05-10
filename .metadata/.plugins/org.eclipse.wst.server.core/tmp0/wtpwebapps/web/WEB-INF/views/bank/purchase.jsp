<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/customize.css">
<link rel="stylesheet" href="resources/css/template.css">
</head>

<body class="body">
<style>
#unvisfile { visibility: hidden; }
</style>
<%@include file="../template/header.jsp"%>



<div class="container">
    <div class="row">
		<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">input</h3>
			 	</div>
			  	<div class="panel-body">
							    	
				    <form name="uploadForm" method="post" role="form" action="purchase_ok" enctype="multipart/form-data">		
                    <fieldset>
			    	  	<div class="form-group">
<input class="form-control" type="text" name="Binout" placeholder="사용 금액">
			    		</div>
			    		<div class="form-group">
<input class="form-control" type="password" name="Bpw" placeholder="계좌 비밀번호">
			    		</div>			    	
			    		<div class="form-group">
<input class="form-control" type="text" name="Bmemo" placeholder="내역">
			    		</div>
			    		<input type="hidden">
    <input type="file" id="unvisfile" name="imgFile"></input>
<input class="btn btn-lg btn-success btn-block" type="submit" value="내역 입력 완료">
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>

<div class="footer">
<%@include file="../template/footer.jsp"%></div>


</body>
</html>