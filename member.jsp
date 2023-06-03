<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bar！ | 會員中心</title>
    <link rel="icon" type="image" href="img/icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/member.css">
</head>

<%@ include file="nav.jsp"%>

<body>
	<%
	  // 回報 error message
	  String error = (String) session.getAttribute("error");
	    if (error != null) {
	      if (error.equals("invalid")) {
		  %>
	        <script>
	            alert("無效的輸入。請確保填寫必填欄位。");
	        </script>
		  <% } else { %>
	        <script>
	            alert("發生錯誤。請稍後再試。");
	        </script>
		<% }
	  }
	  session.removeAttribute("error");
	%>

	<%
		// 有登入的話才會呈現會員資料/評價等等
		if(loggedIn) {
	%>
	<%@ include file="update_profile_data.jsp"%>

    <div class="sec">
        <h1>訂單記錄</h1>
        <hr>
        <table>
            <tr>
                <td>產品圖片</td>
                <td>產品名稱</td>
                <td>單價</td>
                <td>數量</td>
                <td>小計</td>
            </tr>
            <tr>
                <td><img src="img/horry/horry01.jpg" alt=""></td>
                <td>樓下的房客</td>
                <td>$260</td>
                <td>2</td>
                <td>$520</td>
            </tr>
            <tr>
                <td><img src="img/love/love01.jpg" alt=""></td>
                <td>喜歡你的日子像海</td>
                <td>$252</td>
                <td>1</td>
                <td>$252</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td>總計：</td>
                <td>$772</td>
            </tr>
        </table>
    </div>

    <div class="sec">
        <h1>評論紀錄</h1>
        <hr>
        <table>
            <tr>
                <td>產品圖片</td>
                <td>時間</td>
                <td>產品名稱</td>
                <td>評論內容</td>
            </tr>
            <tr>
                <td><img src="img/fantasy/fantasy02.jpg" alt=""></td>
                <td>2023/5/30 10:48</td>
                <td>華龍之宮</td>
                <td>
                    ⭐⭐⭐⭐⭐<br>
                    這本書超級好看的喔~~
                </td>
            </tr>
            <tr>
                <td><img src="img/suspense/suspense03.jpg" alt=""></td>
                <td>2023/5/20 21:17</td>
                <td>一個都不留</td>
                <td>
                    ⭐⭐⭐⭐⭐<br>
                    喜歡!
                </td>
            </tr>
            <tr>
                <td><img src="img/fantasy/fantasy05.jpg" alt=""></td>
                <td>2023/4/1 17:28</td>
                <td>靈魂穿越手稿</td>
                <td>
                    ⭐⭐⭐⭐<br>
                    好看~但是不是我的菜!
                </td>
            </tr>
        </table>
    </div>
    <%
 	 // 有登入的話才會呈現會員資料/評價等等，沒登入就去登入吧~
     } else {
    	 out.print("<script>alert('請先登入！'); window.location='login.jsp'</script>");
   	 } 
   	%>
    <%@ include file="footer.jsp"%>
</body>
</html>