<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%

  // 移除相應的屬性
  session.invalidate();
  // 重導向回首頁並顯示已經登出
  out.print("<script>alert('您已登出，回首頁！'); window.location='index.jsp'</script>");
%>