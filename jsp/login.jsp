<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>登入</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
  <h1>登入</h1>

  <%-- 檢查是否有錯誤訊息 --%>
  <% String error = request.getParameter("error"); %>
  <% if (error != null && error.equals("invalid")) { %>
    <p class="error">帳號或密碼錯誤</p>
  <% } %>

  <%-- 檢查是否有成功訊息 --%>
  <% String success = request.getParameter("success"); %>
  <% if (success != null && success.equals("true")) { %>
    <p class="success">登入成功</p>
  <% } %>

  <form action="login_process.jsp" method="POST">
    <div class="form-group">
      <label for="username">帳號：</label>
      <input type="text" id="username" name="username" required>
    </div>

    <div class="form-group">
      <label for="password">密碼：</label>
      <input type="password" id="password" name="password" required>
    </div>

    <div class="form-group">
      <button type="submit">登入</button>
    </div>
  </form>
</body>
</html>
