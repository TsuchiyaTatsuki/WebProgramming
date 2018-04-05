<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container">

<div style="margin-left:150px;margin-right:150px">

	<c:if test="${errMsg != null}" >
	    <div class="alert alert-danger" role="alert">
		  ${errMsg}
		</div>
	</c:if>


<br>
<br>
<center><h1><strong>ログイン画面</strong></h1></center>
<br>
<br>
<br>
<br>

<form action="LoginServlet" method="post">
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-5 col-form-label"><h3><strong>ログインID</strong></h3></label>
    <div class="col-sm-7">
      <input type="text" class="form-control" name="loginId" id="inputLoginId" placeholder="ID">
    </div>
  </div>
  <br>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-5 col-form-label"><h3><strong>パスワード</strong></h3></label>
    <div class="col-sm-7">
      <input type="password" class="form-control" name="password" id="inputPassword" placeholder="Password">
    </div>
  </div>
  <center><button type="submit" class="btn btn-primary btn-lg">ログイン</button></center>
</form>
<br>
<br>


</div>
</div>
</body>

</html>