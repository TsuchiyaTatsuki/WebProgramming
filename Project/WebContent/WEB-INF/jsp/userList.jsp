<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="controller.UserUpdateServlet" %>


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
<form action="UserListServlet" method="post">
  <div class="form-group row">
    <label for="colFormLabelLg" class="col-sm-3 col-form-label"><h3><strong>ログインID</strong></h3></label>
    <div class="col-sm-9">
      <input name="loginId" type="text" class="form-control form-control-lg" id="loginId" placeholder="ID">
    </div>
  </div>
  <br>
  <div class="form-group row">
    <label for="colFormLabelLg" class="col-sm-3 col-form-label"><h3><strong>ユーザ名</strong></h3></label>
    <div class="col-sm-9">
      <input name="name" type="text" class="form-control form-control-lg" id="name" placeholder="name">
    </div>
    </div>
    <br>
  <div class="form-group row">
    <label for="colFormLabelLg" class="col-sm-3 col-form-label"><h3><strong>生年月日</strong></h3></label>
    <div class="col col-sm-4">
   	  <input name="date1" type="date" class="form-control form-control-lg" placeholder="年/月/日">
    </div>
    <label for="colFormLabelLg" class="col col-form-label"><h3><strong>～</strong></h3></label>
    <div class="col col-sm-4">
      <input name="date2" type="date" class="form-control form-control-lg" placeholder="年/月/日">
    </div>
  </div>
  <div align="right"><button type="submit" class="btn btn-outline-secondary btn-lg"><strong>　　検索　　</strong></button></div>
</form>
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

<c:if test="${userInfo.loginId == 'admin'}">
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
</c:if>

<c:if test="${userInfo.loginId != 'admin'}">
  <c:forEach var="user" items="${userList}" >
    <tr>
      <td>${user.loginId}</td>
      <td>${user.name}</td>
      <td>${user.birthDate}</td>
      <td>
      	<a href="UserMoreServlet?id=${user.id}"><button type="button" class="btn btn-outline-primary btn-sm">　詳細　</button></a>
      	<c:if test="${user.loginId == userInfo.loginId}">
      	<a href="UserUpdateServlet?id=${user.id}"><button type="button" class="btn btn-outline-success btn-sm">　更新　</button></a>
      	</c:if>
      </td>
    </tr>
    </c:forEach>

</c:if>

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