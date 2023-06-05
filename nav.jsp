<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% boolean loggedIn = (session != null && session.getAttribute("loggedIn") != null && (Boolean) session.getAttribute("loggedIn")); %>
<nav>
    <!--Logo-->
    <div class="logo"><a href="index.jsp"><img src="img/logo.png" alt="logo"></a></div>
    <!--產品分類-->
    <!--參考資料：https://www.astralweb.com.tw/pure-css-drop-down-menu/-->
    <ul class="product">產品分類&equiv;
        <ul class="dropdown-menu">
            <li><a href="horry.jsp">恐怖</a></li>
            <li><a href="love.jsp">愛情</a></li>
            <li><a href="suspense.jsp">懸疑</a></li>
            <li><a href="fantasy.jsp">科幻</a></li>
        </ul>
    </ul>
    <!--關於我們-->
    <div class="aboutus"><a href="about_team.jsp">關於我們</a></div>
    <!--會員中心-->
    <div class="mem-center"><a href="member.jsp">會員中心</a></div>
    <div class="nav_img">
        <!--會員登入/會員資料-->
      <%
    	// 登入後把link改登出
    	if (loggedIn) {
    		out.print("<a onclick = 'logoutCheck()'><img src='img/member.png' alt='member'></a>");
    	} else {
    		out.print("<a href = 'login.jsp'><img src='img/member.png' alt='member'></a>");
    	}
      %>
        <!--購物車-->
      <%
    	// 如果尚未登入，不可進入購物車
    	if (loggedIn) {
    		out.print("<a href='cart.jsp'><img src='img/cart.png' alt='cart'></a>");
    	} else {
    		out.print("<a onclick='alert(\"請先登入！\"); window.location.href=\"login.jsp\";'><img src='img/cart.png' alt='cart'></a>");
    	}
      %>
    </div>
    <input type="search" id="search" placeholder="Search for something...">
    <!--搜尋-->
    <input type="image" name="submit_Btn" id="submit_Btn" img src="img/search.png" onclick="search()">
    	<%		// 讓admin可以去管理者頁面
    	if (loggedIn) {
    		String m_userId = (String) session.getAttribute("userId");
			if (m_userId.equals("1")) {
				out.print("<a href='manage.jsp' style='background-color: transparent; color: white; display: block; margin: 0 auto; font-size: 30px; padding-top:30px;'>管理</a>");
		      } 
    	}
    	%>
</nav>
<!-- 處理登出的部分 -->
<script>
  function logoutCheck() {
    let check = "確定要登出嗎？";
    if (confirm(check) === true) {
      window.location.href = "logout.jsp";
    }
  }
  function search() {
	  var searchInput = document.getElementById("search").value;
	  if (searchInput === null || searchInput.trim() === "" || !/^[a-zA-Z0-9\s\u4e00-\u9fa5]+$/.test(searchInput)) {
		  alert("請重新輸入有效的搜尋詞，僅限中英文、數字");
		} else {
		  window.location.href = "search.jsp?keyword=" + encodeURIComponent(searchInput);
	  }
	}
</script>