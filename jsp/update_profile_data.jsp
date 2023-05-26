<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>修改會員資料</title>
</head>
<body>
    <h1>修改會員資料</h1>
    <% //測試
	  String error = (String) session.getAttribute("error");
	  if (error != null) {
	    if (error.equals("invalid")) {
	      out.println("<p class='error'>無效的輸入。請確保填寫必填欄位。</p>");
	    } else if (error.equals("duplicate")) {
		  out.println("<p class='error'>已經有重複的帳號申請。</p>");
		} else if (error.equals("database")) {
	      out.println("<p class='error'>資料庫錯誤。請稍後再試。</p>");
	    } else if (error.equals("unknown")) {
	      out.println("<p class='error'>發生未知錯誤。請稍後再試。</p>");
	    }
	  }
	  session.removeAttribute("error");
	%>
<%
	  //HttpSession session = request.getSession();
      Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
      if (loggedIn == null || !loggedIn) {
	    // 未登入，導向登入頁面
	    response.sendRedirect("login.jsp");
	  } else {

	      String userEmail = (String) session.getAttribute("userEmail");
		  Connection conn = null;
		  PreparedStatement stmt = null;
		  ResultSet rs = null;
		  try {
		    // 建立資料庫連線
		    String dburl = "jdbc:mysql://localhost:3306/bookstore";
		    String dbusername = "root";
		    String dbpassword = "1234";
		    conn = DriverManager.getConnection(dburl, dbusername, dbpassword);
		
		    // 查詢目前使用者的資料
		    String query = "SELECT * FROM members WHERE email = ?";
		    stmt = conn.prepareStatement(query);
		    stmt.setString(1, userEmail);
		    rs = stmt.executeQuery();
		
		    // 檢查是否有資料並將資料填入表單欄位
		    if (rs.next()) {
		    	String memberName = rs.getString("member_name");
		    	String email = rs.getString("email");
		    	String gender = rs.getString("gender");
		    	String phoneNumber = rs.getString("phone_number");
		    	String county = rs.getString("county");
		    	String district = rs.getString("district");
		    	String address = rs.getString("address");
		    	String birthday = rs.getString("birthday");

		    	out.println("<form action='update_profile_process.jsp' method='post'>");
		    	out.println("<label for='memberName'>會員姓名：</label>");
		    	out.println("<input type='text' name='memberName' id='memberName' value='" + memberName + "' required><br>");
		    	out.println("<label for='email'>電子郵件(帳號)：</label>");
		    	out.println("<input type='email' name='email' id='email' value='" + email + "' required><br>");
		    	out.println("<label for='password'>新密碼：</label>");
		    	out.println("<input type='password' name='password' id='password' value='********' required><br>");
		    	out.println("<label for='gender'>性別：</label>");
		    	out.println("<input type='text' name='gender' id='gender' value='" + gender + "' required><br>");
		    	out.println("<label for='phoneNumber'>電話號碼：</label>");
		    	out.println("<input type='tel' name='phoneNumber' id='phoneNumber' value='" + phoneNumber + "' required><br>");
		    	out.println("<label for='county'>縣市區：</label>");
		    	out.println("<input type='text' name='county' id='county' value='" + county + "' required><br>");
		    	out.println("<label for='district'>鄉鎮市區：</label>");
		    	out.println("<input type='text' name='district' id='district' value='" + district + "' required><br>");
		    	out.println("<label for='address'>詳細地址：</label>");
		    	out.println("<input type='text' name='address' id='address' value='" + address + "' required><br>");
		    	out.println("<label for='birthday'>生日：</label>");
		    	out.println("<input type='date' name='birthday' id='birthday' value='" + birthday + "' required><br>");
		    	out.println("<input type='submit' value='更新資料'>");
		    	out.println("</form>");

		    }
		  } catch (Exception e) {
		    e.printStackTrace();
		    // 處理例外狀況
		  } finally {
		    // 關閉資源
		    if (rs != null) {
		      try {
		        rs.close();
		      } catch (SQLException e) {
		        e.printStackTrace();
		      }
		    }
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
	  }

	%>
</body>
</html>
