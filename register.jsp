<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>註冊</title>
</head>
<body>
    <h1>註冊</h1>
     <% // 正式
	  String error = (String) session.getAttribute("error");
	  if (error != null) {
	    if (error.equals("invalid")) {
	      out.println("<p class='error'>無效的帳號或密碼。</p>");
	    }  else if (error == "duplicate") {
	    	out.println("<p class='error'>已經有重複的帳號了！</p>");
	    } else {
		  out.println("<p class='error'>發生錯誤。請稍後再試。</p>");
		}
	  }
	  session.removeAttribute("error");
	%>
    <form action="register_process.jsp" method="post" >
    	<label for="memberName">會員姓名</label>
        <input type="text" name="memberName" id="memberName" required><br>
        
        <label for="email">電子郵件(帳號)：</label>
        <input type="email" name="email" id="email" required><br>
        
        <label for="password">密碼：</label>
        <input type="password" name="password" id="password" required><br>
        
        <label for="gender">性別：</label>
		<input type="radio" name="gender" id="genderMale" value="male" required>
		<label for="genderMale">男性</label>
		<input type="radio" name="gender" id="genderFemale" value="female" required>
		<label for="genderFemale">女性</label>
		<input type="radio" name="gender" id="genderOther" value="other" required>
		<label for="genderOther">其他</label><br>
        
        <label for="phoneNumber">電話號碼：</label>
        <input type="tel" name="phoneNumber" id="phoneNumber" required><br>
        
        <label for="county">縣市區：</label>
        <input type="text" name="county" id="county" required><br>
        
        <label for="district">鄉鎮市區：</label>
        <input type="text" name="district" id="district" required><br>
        
        <label for="address">詳細地址：</label>
        <input name="address" id="address" required><br>
        
        <label for="birthday">生日：</label>
        <input type="date" name="birthday" id="birthday" required><br>
        
        <input type="submit" value="註冊">
    </form>
</body>
</html>
