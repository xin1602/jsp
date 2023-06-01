<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head><title>訪客計數器init</title>
</head>
<body>
<%
  application.setAttribute("counter", "1000");
  out.print("計數器初始值設定為1000");
%>

</body>
</html>
