<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
  HttpSession httpSession = request.getSession(false);
  if (httpSession != null) {
    // 移除登入狀態的屬性
    httpSession.removeAttribute("loggedIn");
    httpSession.removeAttribute("username");
    httpSession.invalidate(); // 無效化 session
  }
  // 重導向回首頁
  response.sendRedirect("index.jsp");
%>
