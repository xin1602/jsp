<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file="setsql.jsp"%>

<%
	String userId=(String)session.getAttribute("userId");
	String product_id=(String)request.getParameter("pid");

    sql = "DELETE FROM cart WHERE `member_id`='" + userId + "' AND `product_id`='" + product_id + "'";
    con.createStatement().execute(sql);


	//String query = "DELETE FROM cart WHERE `member_id`=? AND `product_id`=? ";
    //stmt = con.prepareStatement(query);
    //stmt.setString(1, userId);
    //stmt.setString(2, product_id);
    //rs = stmt.executeUpdate();
	
	con.close();
	
	out.print("<script>alert('此書籍已移出購物車'); window.location='cart.jsp'; </script>");
%>