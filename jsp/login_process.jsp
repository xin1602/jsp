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

    // 檢查帳號密碼是否正確
    String query = "SELECT * FROM members WHERE username = ? AND password = ?";
    stmt = conn.prepareStatement(query);
    stmt.setString(1, username);
    stmt.setString(2, password);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
      session.setAttribute("loggedIn", true);
      // 登入成功，導向會員頁面或其他處理
      response.sendRedirect("index.jsp");
    } else {
      // 登入失敗，返回登入頁面並顯示錯誤訊息
      response.sendRedirect("login.jsp?error=invalid");
    }
  } catch (Exception e) {
    e.printStackTrace();
    // 處理例外情況，返回登入頁面並顯示錯誤訊息
    response.sendRedirect("login.jsp?error=unknown");
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
