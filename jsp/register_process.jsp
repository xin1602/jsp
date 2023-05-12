<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
  String username = request.getParameter("username");
  String password = request.getParameter("password");

  Connection conn = null;
  PreparedStatement stmt = null;

  try {
    // 建立資料庫連線
    String dburl = "jdbc:mysql://localhost:3306/bookstore";
    String dbusername = "root";
    String dbpassword = "1234";
    conn = DriverManager.getConnection(dburl, dbusername, dbpassword);

    // 檢查帳號是否已存在
    String checkQuery = "SELECT * FROM members WHERE username = ?";
    stmt = conn.prepareStatement(checkQuery);
    stmt.setString(1, username);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
      // 帳號已存在，返回註冊頁面並顯示錯誤訊息
      response.sendRedirect("register.jsp?error=exist");
    } else {
      // 帳號不存在，進行註冊
      String insertQuery = "INSERT INTO members (username, password) VALUES (?, ?)";
      stmt = conn.prepareStatement(insertQuery);
      stmt.setString(1, username);
      stmt.setString(2, password);
      stmt.executeUpdate();

      // 註冊成功，導向登入頁面或其他處理
      response.sendRedirect("login.jsp?success=true");
    }
  } catch (Exception e) {
    e.printStackTrace();
    // 處理例外情況，返回註冊頁面並顯示錯誤訊息
    response.sendRedirect("register.jsp?error=unknown");
  } finally {
    // 關閉資源
    if (stmt != null) {
      try {
        stmt.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    if (conn != null) {
      try {
        conn.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }
%>
