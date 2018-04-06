<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ユーザ一覧</title>
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
<center><h1><strong>ユーザ一覧</strong></h1></center>
<br>


<div align="right"><h5><a href="NewUserServlet" class="text-primary">新規登録</a></h5></div>

<!-- 入力フォーム -->
<form>
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-5 col-form-label"><h3><strong>ログインID</strong></h3></label>
    <div class="col-sm-7">
      <input type="text" class="form-control form-control-lg" id="formGroupExampleInput" placeholder="ID">
    </div>
  </div>
  <br>
  <div class="form-group row">
    <label for="inputPassword" class="col-sm-5 col-form-label"><h3><strong>パスワード</strong></h3></label>
    <div class="col-sm-7">
      <input type="text" class="form-control form-control-lg" id="formGroupExampleInput" placeholder="Password">
    </div>
    </div>
    <br>
  <div class="form-group row">
    <label for="staticEmail" class="col-sm-5 col-form-label"><h3><strong>生年月日</strong></h3></label>
    <div class="col">
   	  <input type="text" class="form-control form-control-lg" placeholder="年/月/日">
    </div>
    <label for="staticEmail" class="col-sm-2 col-form-label"><h3><strong>　 ～</strong></h3></label>
    <div class="col">
      <input type="text" class="form-control form-control-lg" placeholder="年/月/日">
    </div>
  </div>
</form>

<div align="right"><button type="button" class="btn btn-outline-secondary btn-lg"><strong>　　検索　　</strong></button></div>
<!-- 入力フォーム -->

<!-- 区切り -->
<Hr>
<!-- 区切り -->

<!-- テーブル -->
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col"><center>ログインID</center></th>
      <th scope="col"><center>ユーザ名</center></th>
      <th scope="col"><center>生年月日</center></th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
  <c:forEach var="user" items="${userList}" >
    <tr>
      <td>${user.loginId}</td>
      <td>${user.name}</td>
      <td>${user.birthDate}</td>
      <td>
      	<a href="UserMoreServlet?id=${user.id}"><button type="button" class="btn btn-outline-primary btn-sm">　詳細　</button></a>
      	<a href="UserUpdateServlet?id=${user.id}"><button type="button" class="btn btn-outline-success btn-sm">　更新　</button></a>
      	<a href="UserDeleteServlet?id=${user.id}"><button type="button" class="btn btn-outline-danger btn-sm">　削除　</button></a>
      </td>
    </tr>
    </c:forEach>

  </tbody>
</table>
<!-- テーブル -->

<br>
<br>
<br>

</div>
</div>
</body>
</html>