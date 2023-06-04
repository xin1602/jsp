<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "setsql.jsp" %>
 <%
 if (loggedIn == "false") {
   // 未登入，導向登入頁面
   response.sendRedirect("login.jsp");
 } else {
    String userEmail = (String) session.getAttribute("userEmail");
    try {
    // 查詢目前使用者的資料
    String query = "SELECT * FROM members WHERE email = ?";
    stmt = con.prepareStatement(query);
    stmt.setString(1, userEmail);
    rs = stmt.executeQuery();

    // 檢查是否有資料並將資料填入表單欄位
    if (rs.next()) {
    	String memberName = rs.getString("member_name");
    	String email = rs.getString("email");
    	String gender = rs.getString("gender");
    	String phoneNumber = rs.getString("phone_number");
    	String city = rs.getString("city");
    	String district = rs.getString("district");
    	String address = rs.getString("address");
    	String birthday = rs.getString("birthday");
    	%>
     <div class="sec">
        <h1>會員資料</h1>
        <hr>
        <div class="revise">
			<form action="update_profile_process.jsp" method="post">
			    <label for="name">姓　名：</label>
			    <input type="text" name="memberName" id="name" value="<%= memberName %>" required"><br>
			    <label for="bday">生　日：</label>
			    <input type="text" name="birthday" id="bday" value="<%= birthday %>" required><br>
			    <label for="gender">性　別：</label>
			    <input type="text" name="gender" id="gender" value="<%= gender %>" required><br>
			    <label for="tel">電　話：</label>
			    <input type="text" name="phoneNumber" id="tel" value="<%= phoneNumber %>" required><br>
			    <label for="city">縣　市：</label>
			    <input type="text" name="city" id="city" value="<%= city %>" required><br>
			    <label for="city">鄉鎮區：</label>
			    <input type="text" name="district" id="district" value="<%= district %>" required><br>
			    <label for="addr">地　址：</label>
			    <input type="text" name="address" id="addr" value="<%= address %>" required><br>
			    <label for="email">郵　箱：</label>
			    <input type="text" name="email" id="email" value="<%= email %>" required><br>
			    <label for="password">密　碼：</label>
			    <input type="password" name="password" id="psw" value="" required><br>
			    <input type="submit" value="修改" id="revise_btn">
			</form>
        </div>
    </div>
    <%
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
    if (con != null) {
      try {
        con.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }
 }
%>
