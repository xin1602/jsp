<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "setsql.jsp" %>
<%
  String email = request.getParameter("email");
  String password = request.getParameter("password");
  
  try {
    // 檢查帳號密碼是否正確
    String query = "SELECT * FROM members WHERE email = ? AND password = ?";
    stmt = con.prepareStatement(query);
    stmt.setString(1, email);
    stmt.setString(2, password);
    rs = stmt.executeQuery();

    if (rs.next()) {
      // 登入成功，設定 session 變數
      String memberName = rs.getString("member_name");
      session.setAttribute("userId", rs.getString("member_id"));
      session.setAttribute("loggedIn", true);
      session.setAttribute("username", memberName);
      session.setAttribute("userEmail", email);
      session.setAttribute("horry_count",0);
      session.setAttribute("love_count",0);
      session.setAttribute("suspense_count",0);
      session.setAttribute("fantasy_count",0);
      String userId = (String) session.getAttribute("userId");
      // 導向首頁
      if (userId.equals("1")) {
    	  response.sendRedirect("manage.jsp");
      } else {
	      response.sendRedirect("index.jsp");	  
      }
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
    if (con != null) {
      try {
        con.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }
%>
