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
</head>
<body>

<%@include file="../template/header.jsp"%>



<div class="container">
    <div class="row">
		<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">input</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form" action="purchase_ok" method="post">
                    <fieldset>
			    	  	<div class="form-group">
<input class="form-control" type="text" name="Binout" placeholder="��� �ݾ�">
			    		</div>
			    		<div class="form-group">
<input class="form-control" type="password" name="Bpw" placeholder="���� ��й�ȣ">
			    		</div>			    	
			    		<div class="form-group">
<input class="form-control" type="text" name="Bmemo" placeholder="����">
			    		</div>

<input class="btn btn-lg btn-success btn-block" type="submit" value="���� �Է� �Ϸ�">
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>



<%@include file="../template/footer.jsp"%>


</body>
</html>