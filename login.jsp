<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>看Bar！ | 登入註冊</title>
    <link rel="icon" type="image" href="img/icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

	<% 
	  // 登入報錯的部分
	  String error = (String) session.getAttribute("error");
	  if (error != null) {
	    if (error.equals("invalid")) { %>
	      <script>
	        alert("無效的帳號或密碼。");
	      </script>
	    <% } else { %>
	      <script>
	        alert("發生錯誤。請稍後再試。");
	      </script>
	    <% }
	  }
	  session.removeAttribute("error");
	%>

    <div class="container">
		<form action="rigister_process.jsp" class="signup-form">
			<h2 class="form-heading">註冊</h2>
			<label for="account">帳號</label>
      <input type="text" name="registeracc" id="registeracc" required>
      <label for="password">密碼</label>
      <input type="password" name="registerpwd" id="pwd" required>
      <label for="account">會員姓名</label>
      <input type="text" name="name" id="name" required>
      <label for="account">性別</label>
      <input type="radio" name="sex" value="男" id="male" checked><span class="radiotxt">男</span>
      <input type="radio" name="sex" value="女" id="female"><span class="radiotxt">女</span>
      <label for="account">生日</label>
      <input type="date" name="bday" id="bday" required>
      <label for="account">電子郵箱</label>
      <input type="email" name="email" id="email" required>
      <label for="account">電話號碼</label>
      <input type="tel" name="phone" id="phone" required>
      <label for="account">縣市</label>
      <select name="city" id="city">
          <option value="臺北市">臺北市</option>
          <option value="新北市">新北市</option>
          <option value="桃園市">桃園市</option>
          <option value="臺中市">臺中市</option>
          <option value="臺南市">臺南市</option>
          <option value="高雄市">高雄市</option>
          <option value="基隆市">基隆市</option>
          <option value="新竹市">新竹市</option>
          <option value="嘉義市">嘉義市</option>
          <option value="新竹縣">新竹縣</option>
          <option value="苗栗縣">苗栗縣</option>
          <option value="彰化縣">彰化縣</option>
          <option value="南投縣">南投縣</option>
          <option value="雲林縣">雲林縣</option>
          <option value="嘉義縣">嘉義縣</option>
          <option value="屏東縣">屏東縣</option>
          <option value="宜蘭縣">宜蘭縣</option>
          <option value="花蓮縣">花蓮縣</option>
          <option value="臺東縣">臺東縣</option>
          <option value="澎湖縣">澎湖縣</option>
          <option value="金門縣">金門縣</option>
          <option value="連江縣">連江縣</option>
      </select>
      <label for="account">鄉鎮區</label>
      <input type="text" name="district" id="district" required>
      <label for="account">詳細地址</label>
      <input type="text" name="addr" id="addr" required>
			<button type="submit" id="signup">註冊</button>
			<button type="button" id="login-toggle">去登入</button>
		</form>
		<form action="login_process.jsp" class="login-form">
			<h2 class="form-heading">登入</h2>
			<label for="email">帳號</label>
			<input type="email" name="email" id="email" placeholder="Account" required>
			<label for="name">密碼</label>
			<input type="password" name="password" id="password" placeholder="Password" required>
			<button type="submit" id="login">登入</button>
			<button type="button" id="signup-toggle">還沒有帳號？去註冊！</button>
		</form>
    <script src="js/login.js"></script>
</body>
</html>
