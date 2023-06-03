<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
  HttpSession httpSession = request.getSession(false);
  if (httpSession != null) {
    // 移除登入狀態的屬性
    httpSession.removeAttribute("userId");
    httpSession.removeAttribute("loggedIn");
    httpSession.removeAttribute("username");
    httpSession.removeAttribute("userEmail");
    httpSession.removeAttribute("sub_total");
    httpSession.removeAttribute("discount");
    httpSession.removeAttribute("total");
    httpSession.invalidate(); // 無效化 session
  }
  // 重導向回首頁並顯示已經登出
  out.print("<script>alert('您已登出，回首頁！'); window.location='index.jsp'</script>");
%>