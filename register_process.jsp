<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
  request.setCharacterEncoding("UTF-8");
  String memberName = request.getParameter("memberName");
  String email = request.getParameter("email");
  String password = request.getParameter("password");
  String gender = request.getParameter("gender");
  String phoneNumber = request.getParameter("phoneNumber");
  String city = request.getParameter("city");
  String district = request.getParameter("district");
  String address = request.getParameter("address");
  String birthday = request.getParameter("birthday");

  // 驗證表單欄位
  if (memberName == null || email == null || password == null || memberName.isEmpty() || email.isEmpty() || password.isEmpty()) {
	request.getSession().setAttribute("error", "invalid");
    response.sendRedirect("login.jsp?error=invalid");
  }

  Connection conn = null;
  PreparedStatement stmt = null;

  try {
    // 建立資料庫連線
    String dburl = "jdbc:mysql://localhost:3306/bookstore?useUnicode=true&characterEncoding=UTF-8";
    String dbusername = "root";
    String dbpassword = "1234";
    conn = DriverManager.getConnection(dburl, dbusername, dbpassword);

    // 檢查帳號是否已存在
    String checkQuery = "SELECT * FROM members WHERE email = ?";
    stmt = conn.prepareStatement(checkQuery);
    stmt.setString(1, email);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
      // 帳號已存在，返回註冊頁面 error=duplicate
    	request.getSession().setAttribute("error", "duplicate");
    	response.sendRedirect("login.jsp");

    } else {
      // 帳號不存在，進行註冊
      String insertQuery = "INSERT INTO members (member_name, email, password, gender, phone_number, city, district, address, birthday) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	  stmt = conn.prepareStatement(insertQuery.toString());

	  stmt.setString(1, memberName);
	  stmt.setString(2, email);
	  stmt.setString(3, password);
	  stmt.setString(4, gender);
	  stmt.setString(5, phoneNumber);
	  stmt.setString(6, city);
	  stmt.setString(7, district);
	  stmt.setString(8, address);
	  stmt.setString(9, birthday);
      
      stmt.executeUpdate();

      // 註冊成功，導向登入頁面
      out.print("<script>alert('您已註冊成功，進行登入！'); window.location='login.jsp'</script>");
    }
  } catch (SQLException e) {
    e.printStackTrace();
    // 處理資料庫錯誤，返回註冊頁面  error=database
    request.getSession().setAttribute("error", "database");
    response.sendRedirect("login.jsp?error=database");
  } catch (Exception e) {
    e.printStackTrace();
    // 處理其他例外情況，返回註冊頁面  error=unknown
    request.getSession().setAttribute("error", "unknown");
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
