<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "setsql.jsp" %>
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
    response.sendRedirect("update_profile_data.jsp?error=invalid");
  }
  try {
    String checkQuery = "SELECT * FROM members WHERE email = ?";
    stmt = con.prepareStatement(checkQuery);
    stmt.setString(1, email);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
    	int memberID = rs.getInt("member_id");
		String updateQuery = "UPDATE members SET member_name = ?, email = ?, password = ?, gender = ?, phone_number = ?, city = ?, district = ?, address = ?, birthday = ? WHERE member_id = ?";
			
		stmt = con.prepareStatement(updateQuery);
		
		stmt.setString(1, memberName);
		stmt.setString(2, email);
		stmt.setString(3, password);
		stmt.setString(4, gender);
		stmt.setString(5, phoneNumber);
		stmt.setString(6, city);
		stmt.setString(7, district);
		stmt.setString(8, address);
		stmt.setString(9, birthday);
		stmt.setInt(10, memberID);
		
		stmt.executeUpdate();


      // 修改成功，導向首頁並取得更新後資料
      String memberEmail = rs.getString("email");
      session.setAttribute("userEmail", memberEmail);
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
    if (con != null) {
      try {
        con.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }
%>
