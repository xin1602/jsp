<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
boolean loggedIn = (session != null && session.getAttribute("loggedIn") != null && (Boolean) session.getAttribute("loggedIn"));
// 檢查是否存在會話屬性
if (loggedIn) {
  // 移除相應的屬性
  session.removeAttribute("userId");
  session.removeAttribute("loggedIn");
  session.removeAttribute("username");
  session.removeAttribute("userEmail");
  session.removeAttribute("sub_total");
  session.removeAttribute("discount");
  session.removeAttribute("total");
}
// 重導向回首頁並顯示已經登出
out.print("<script>alert('您已登出，回首頁！'); window.location='index.jsp'</script>");
%>