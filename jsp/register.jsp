<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>註冊</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
  <h1>註冊</h1>

  <form action="register_process.jsp" method="POST">
    <div class="form-group">
      <label for="username">帳號：</label>
      <input type="text" id="username" name="username" required>
    </div>

    <div class="form-group">
      <label for="password">密碼：</label>
      <input type="password" id="password" name="password" required>
    </div>

    <div class="form-group">
      <button type="submit">註冊</button>
    </div>
  </form>
</body>
</html>
