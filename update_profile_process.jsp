<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "setsql.jsp" %>
<%
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
	    rs = stmt.executeQuery();
	    
	    // 取得目前登入帳號的ID與email
	    String memberID = (String) session.getAttribute("userId");
	    String memberEmail = (String) session.getAttribute("email");
	    // 如果查詢得到帳號的話就要進行判斷，否則就是新的email而已（因為ID會和現有登入的一樣）
	    if (rs.next()) {
	    	// 取得檢查用的ID與email
	        String checkID = rs.getString("member_id");
	        String checkEmail = rs.getString("email");
	        // 如果Email一樣  但是！ID不一樣的話就表示有帳號重覆的問題！
	        if (email.equals(checkEmail) && !memberID.equals(checkID)) {
	            // 帳號已存在且不是自己的，返回修改頁面 error=duplicate
	            request.getSession().setAttribute("error", "duplicate");
	            response.sendRedirect("member.jsp");
	            return; // 終止程式執行，避免後續的更新程式碼被執行
	        }
	    }

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
	    stmt.setString(10, memberID);

	    stmt.executeUpdate();

	    // 修改成功，導向首頁並取得更新後資料
	    session.setAttribute("userEmail", email);
	    session.setAttribute("username", memberName);

	    out.print("<script>alert('您已修改成功，回首頁！'); window.location='index.jsp'</script>");
	} catch (SQLException e) {
	    e.printStackTrace();
	    // 處理資料庫錯誤，返回修改頁面 error=database
	    request.getSession().setAttribute("error", "database");
	} catch (Exception e) {
	    e.printStackTrace();
	    // 處理其他例外情況，返回修改頁面 error=unknown
	    request.getSession().setAttribute("error", "unknown");
	} finally {
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
