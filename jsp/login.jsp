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
 
 	  <% // 正式
	  String error = (String) session.getAttribute("error");
	  if (error != null) {
	    if (error.equals("invalid")) {
	      out.println("<p class='error'>無效的帳號或密碼。</p>");
	    } else {
		  out.println("<p class='error'>發生錯誤。請稍後再試。</p>");
		}
	  }
	  session.removeAttribute("error");
	%>
	<%-- //測試用
	  String error = (String) session.getAttribute("error");
	  if (error != null) {
	    if (error.equals("invalid")) {
	      out.println("<p class='error'>無效的帳號或密碼。</p>");
	    } else if (error.equals("database")) {
	      out.println("<p class='error'>資料庫錯誤。請稍後再試。</p>");
	    } else if (error.equals("unknown")) {
	      out.println("<p class='error'>發生未知錯誤。請稍後再試。</p>");
	    } else {
		  out.println("<p class='error'>發生錯誤。請稍後再試。</p>");
		}
	  }
	  session.removeAttribute("error");
	--%>
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
    <div class="form-group">
    <p>還沒有帳號？</p>
    <a href="register.jsp">註冊</a>
  </div>
</body>
</html>
