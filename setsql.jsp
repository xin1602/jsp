<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
Connection conn = null;
PreparedStatement stmt = null;
// 建立資料庫連線
String dburl = "jdbc:mysql://localhost:3306/bookstore?characterEncoding=utf8";
String dbusername = "root";
String dbpassword = "1234";
conn = DriverManager.getConnection(dburl, dbusername, dbpassword);
%>