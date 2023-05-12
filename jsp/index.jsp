<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
  <title>Bookstore</title>
  <link rel="stylesheet" type="text/css" href="../css/style.css">
  <!-- <link rel="stylesheet" type="text/css" href="../css/index.css"> -->
</head>
<body>
  <header>
    <h1>Welcome to the Bookstore</h1>
  </header>

<nav>
  <ul>
    <li><a href="index.jsp">Home</a></li>
    <li><a href="books.jsp">Books</a></li>
    <li><a href="member.jsp">Member</a></li>
    <li>
      <% boolean loggedIn = (session != null && session.getAttribute("loggedIn") != null && (Boolean) session.getAttribute("loggedIn")); %>
      <% if (loggedIn) { %>
        <a href="logout.jsp">Logout</a>
      <% } else { %>
        <a href="login.jsp">Login</a>
      <% } %>
    </li>
    <li><a href="cart.jsp">Cart</a></li>
  </ul>
</nav>


  <section>
    <h2>Featured Books</h2>
    <%
      // 建立資料庫連接
      String url = "jdbc:mysql://localhost:3306/bookstore";
      String username = "root";
      String password = "1234";
      Connection conn = DriverManager.getConnection(url, username, password);

      // 執行 SQL 查詢
      String query = "SELECT * FROM books";
      Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery(query);

      // 迭代顯示每本書籍的資訊
      while (rs.next()) {
        String title = rs.getString("title");
        String author = rs.getString("author");
        double price = rs.getDouble("price");
        // String imageUrl = rs.getString("image_url");
    %>
    <div class="book">
      <h3><%= title %></h3>
      <p>Author: <%= author %></p>
      <p>Price: <%= price %></p>
    </div>
    <%
      }

      // 關閉資源
      rs.close();
      stmt.close();
      conn.close();
    %>
  </section>

  <footer>
    <p>&copy; 2023 Bookstore. All rights reserved.</p>
  </footer>
</body>
</html>
