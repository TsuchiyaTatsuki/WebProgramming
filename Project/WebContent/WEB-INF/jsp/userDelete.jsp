<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="controller.UserUpdateServlet" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ削除確認</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>

<!-- メニュー -->
<span class="d-block p-2 bg-dark text-white">
<div class="d-flex flex-row-reverse">
  <div class="p-2"><h4><a href="LogoutServlet">ログアウト</a></h4></div>
  <div class="p-2"><h4>${userInfo.name} さん</h4></div>
</div>
</span>
<!-- メニュー -->
<c:if test="${errMsg != null}" >
	<div class="alert alert-danger" role="alert">${errMsg}</div>
</c:if>

<br>
<br>
<div class="container">
<div style="margin-left:150px;margin-right:150px">
<center><h1><strong>ユーザ削除確認</strong></h1></center>
<br>


<form>
  <div class="form-group row">
    <label for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg">ログインID:</label>
    <div class="col-sm-5">
      <input type="text" readonly class="form-control-plaintext form-control-lg" id="loginId" name="loginId" value="${user.loginId}">
    </div>
  </div>
</form>

<p><h5>を本当に削除してよろしいでしょうか。</h5></p>
<br>
<br>
<!-- ボタン -->
<form method="post" action="UserDeleteServlet">
<input type="hidden" name="id" value="${user.id}">
<center>
<a href="UserListServlet"><button namme="cancel" type="button" class="btn btn-outline-secondary btn-lg" style="margin-right:100px;"><strong>キャンセル</strong></button></a>
<button type="submit" class="btn btn-outline-secondary btn-lg"><strong>　　OK　　</strong></button>
</center>
</form>
<!-- ボタン -->

<br>

</div>
</div>
</body>
</html>