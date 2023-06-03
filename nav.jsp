<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% boolean loggedIn = (session != null && session.getAttribute("loggedIn") != null && (Boolean) session.getAttribute("loggedIn")); %>
<nav>
    <!--Logo-->
    <div class="logo"><a href="index.jsp"><img src="img/logo.png" alt="logo"></a></div>
    <!--產品分類-->
    <!--參考資料：https://www.astralweb.com.tw/pure-css-drop-down-menu/-->
    <ul class="product">產品分類&equiv;
        <ul class="dropdown-menu">
            <li><a href="product.jsp">恐怖</a></li>
            <li><a href="product.jsp">愛情</a></li>
            <li><a href="product.jsp">懸疑</a></li>
            <li><a href="product.jsp">科幻</a></li>
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
        <a href="cart.jsp"><img src="img/cart.png" alt="cart"></a>
        
    </div>
    <input type="search" id="search" placeholder="Search for something...">
    <!--搜尋-->
    <input type="image" name="submit_Btn" id="submit_Btn" img src="img/search.png" onClick="" >
</nav>
<!-- 處理登出的部分 -->
<script>
  function logoutCheck() {
    let check = "確定要登出嗎？";
    if (confirm(check) === true) {
      window.location.href = "logout.jsp";
    }
  }
</script>