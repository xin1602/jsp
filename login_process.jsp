<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
  String username = request.getParameter("username");
  String password = request.getParameter("password");

  Connection conn = null;
  PreparedStatement stmt = null;

  try {
    // 建立資料庫連線
    String dburl = "jdbc:mysql://localhost:3306/bookstore?characterEncoding=utf8";
    String dbusername = "root";
    String dbpassword = "1234";
    conn = DriverManager.getConnection(dburl, dbusername, dbpassword);

    // 檢查帳號密碼是否正確
    String query = "SELECT * FROM members WHERE email = ? AND password = ?";
    stmt = conn.prepareStatement(query);
    stmt.setString(1, username);
    stmt.setString(2, password);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
      // 登入成功，設定 session 變數
      String memberName = rs.getString("member_name");
      String memberEmail = rs.getString("email");
      session.setAttribute("loggedIn", true);
      session.setAttribute("username", memberName);
      session.setAttribute("userEmail", memberEmail);

      // 導向首頁
      response.sendRedirect("index.jsp");
    } else {
      // 登入失敗，返回登入頁面
      request.getSession().setAttribute("error", "invalid");
      response.sendRedirect("login.jsp");
    }
  } catch (SQLException e) {
    e.printStackTrace();
    // 處理資料庫錯誤，返回登入頁面
    request.getSession().setAttribute("error", "database");
    response.sendRedirect("login.jsp");
  } catch (Exception e) {
    e.printStackTrace();
    // 處理其他例外情況，返回登入頁面
    request.getSession().setAttribute("error", "unknown");
    response.sendRedirect("login.jsp");
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