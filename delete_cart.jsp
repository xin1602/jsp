<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file="setsql.jsp"%>

<%
	String ID=(String)session.getAttribute("ID");
	String product_id=(String)request.getParameter("product_id");

	sql="DELETE FROM cart WHERE `member_id`='" + ID+ "' AND `product_id`='"+product_id+"'";
	con.createStatement().execute(sql);
	
	con.close();
	
	out.print("<script>alert('此書籍已移出購物車'); window.location='cart.jsp' </script>");
%>