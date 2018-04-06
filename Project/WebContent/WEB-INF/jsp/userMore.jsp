<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="controller.UserMoreServlet" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ情報詳細参照</title>
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


<br>
<br>
<div class="container">
<div style="margin-left:150px;margin-right:150px">
<center><h1><strong>ユーザ情報詳細参照</strong></h1></center>
<br>


<!-- 入力フォーム -->
<form>
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-5 col-form-label col-form-label-lg">ログインID</label>
    <div class="col-sm-7">
      <input type="text" readonly class="form-control-plaintext form-control-lg" id="loginId" value="${userList[id - 1].loginId}">
    </div>
  </div>
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-5 col-form-label col-form-label-lg">ユーザ名</label>
    <div class="col-sm-7">
      <input type="text" readonly class="form-control-plaintext form-control-lg" id="name" value="${userList[id - 1].name }">
    </div>
  </div>
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-5 col-form-label col-form-label-lg">生年月日</label>
    <div class="col-sm-7">
      <input type="text" readonly class="form-control-plaintext form-control-lg" id="birthDate" value="${userList[id - 1].birthDate }">
    </div>
  </div>
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-5 col-form-label col-form-label-lg">登録日時</label>
    <div class="col-sm-7">
      <input type="text" readonly class="form-control-plaintext form-control-lg" id="createDate" value="${userList[id - 1].createDate }">
    </div>
  </div>
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-5 col-form-label col-form-label-lg">更新日時</label>
    <div class="col-sm-7">
      <input type="text" readonly class="form-control-plaintext form-control-lg" id="updateDate" value="${userList[id - 1].updateDate }">
    </div>
  </div>
</form>
<!-- 入力フォーム -->

<h5><a href="javascript:history.back()" class="text-primary">戻る</a></h5>

</div>
</div>
</body>
</html>