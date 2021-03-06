<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="controller.UserUpdateServlet" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ情報更新</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>

<!-- メニュー -->
<span class="d-block p-2 bg-dark text-white">
<div class="d-flex flex-row-reverse">
  <div class="p-2"><h4><a href="LogoutServlet" class="text-danger">ログアウト</a></h4></div>
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
<center><h1><strong>ユーザ情報更新</strong></h1></center>
<br>


<!-- 入力フォーム -->
<form action="UserUpdateServlet" method="post">
<input type="hidden" name="id" value="${user.id}">
  <div class="form-group row">
    <label for="colFormLabelLg" class="col-sm-5 col-form-label col-form-label-lg">ログインID</label>
    <div class="col-sm-7">
      <input type="text" readonly class="form-control-plaintext form-control-lg" id="loginId" name="loginId" value="${user.loginId}">
    </div>
  </div>
    <div class="form-group row">
    <label for="colFormLabelLg" class="col-sm-5 col-form-label col-form-label-lg">パスワード</label>
    <div class="col-sm-7">
      <input type="password" class="form-control form-control-lg" id="password" name="password" placeholder="パスワード">
    </div>
  </div>
    <div class="form-group row">
    <label for="colFormLabelLg" class="col-sm-5 col-form-label col-form-label-lg">パスワード(確認)</label>
    <div class="col-sm-7">
      <input type="password" class="form-control form-control-lg" id="passwordb" name="passwordb" placeholder="パスワード(確認)">
    </div>
  </div>
    <div class="form-group row">
    <label for="colFormLabelLg" class="col-sm-5 col-form-label col-form-label-lg">ユーザ名</label>
    <div class="col-sm-7">
      <input type="text" class="form-control form-control-lg" id="name" name="name" placeholder="ユーザ名">
    </div>
  </div>
    <div class="form-group row">
    <label for="colFormLabelLg" class="col-sm-5 col-form-label col-form-label-lg">生年月日</label>
    <div class="col-sm-7">
      <input type="date" class="form-control form-control-lg" id="birthDate" name="birthDate" placeholder="生年月日">
    </div>
  </div>
  <center><button type="submit" class="btn btn-outline-secondary btn-lg"><strong>　　更新　　</strong></button></center>
</form>


<!-- 入力フォーム -->

<h5><a href="javascript:history.back()" class="text-primary">戻る</a></h5>

</div>
</div>
</body>
</html>