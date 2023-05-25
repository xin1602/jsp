<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
  request.setCharacterEncoding("UTF-8");
  String memberName = request.getParameter("memberName");
  String email = request.getParameter("email");
  String password = request.getParameter("password");
  String gender = request.getParameter("gender");
  String phoneNumber = request.getParameter("phoneNumber");
  String county = request.getParameter("county");
  String district = request.getParameter("district");
  String address = request.getParameter("address");
  String birthday = request.getParameter("birthday");

  // 驗證表單欄位
  if (memberName == null || email == null || password == null || memberName.isEmpty() || email.isEmpty() || password.isEmpty()) {
	request.getSession().setAttribute("error", "invalid");
    response.sendRedirect("update_profile_data.jsp?error=invalid");
  }

  Connection conn = null;
  PreparedStatement stmt = null;

  try {
    // 建立資料庫連線
    String dburl = "jdbc:mysql://localhost:3306/bookstore?useUnicode=true&characterEncoding=UTF-8";
    String dbusername = "root";
    String dbpassword = "1234";
    conn = DriverManager.getConnection(dburl, dbusername, dbpassword);

    String checkQuery = "SELECT * FROM members WHERE email = ?";
    stmt = conn.prepareStatement(checkQuery);
    stmt.setString(1, email);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
    	int memberID = rs.getInt("member_id");
		String updateQuery = "UPDATE members SET member_name = ?, email = ?, password = ?, gender = ?, phone_number = ?, county = ?, district = ?, address = ?, birthday = ? WHERE member_id = ?";
			
		stmt = conn.prepareStatement(updateQuery);
		
		stmt.setString(1, memberName);
		stmt.setString(2, email);
		stmt.setString(3, password);
		stmt.setString(4, gender);
		stmt.setString(5, phoneNumber);
		stmt.setString(6, county);
		stmt.setString(7, district);
		stmt.setString(8, address);
		stmt.setString(9, birthday);
		stmt.setInt(10, memberID);
		
		stmt.executeUpdate();


      // 註冊成功，導向登入頁面
      response.sendRedirect("index.jsp");
    }
  } catch (SQLException e) {
    e.printStackTrace();
    // 處理資料庫錯誤，返回修改頁面  error=database
    request.getSession().setAttribute("error", "database");
  } catch (Exception e) {
    e.printStackTrace();
    // 處理其他例外情況，返回修改頁面  error=unknown
    request.getSession().setAttribute("error", "unknown");
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
