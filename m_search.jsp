<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>後台|查詢&更改</title>
    <link rel="icon" type="image" href="img/icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/manage.css">
    <link rel="stylesheet" href="css/m_shelves.css">
    <style>
        .hide{
            display: none;
        }
    </style>
</head>

<nav>
    <!--Logo-->
    <div class="logo"><a href="index.jsp"><img src="img/logo.png" alt="logo"></a></div>
 
    <!--會員登入/會員資料-->
    <div class="member"><a href="manage.jsp"><img src="img/member.png" alt="member"></a></div>
</nav>
<%
    boolean loggedIn = false;
    boolean adminCheck = false;
    if (session != null && session.getAttribute("loggedIn") != null) {
        loggedIn = (Boolean) session.getAttribute("loggedIn");
        adminCheck = (Boolean) session.getAttribute("userId").equals("1");
    }
    if (!loggedIn || !adminCheck) {
        out.print("<script>alert('非管理員帳號'); window.location='index.jsp'</script>");
    }
%>
<body>
    <p>產品查詢&更改</p>
    <div class="m_text3" style="width: 300px; display: flex;">
        <form action="m_edit.jsp" method="get">
            <input class="search" type="search" id="search" name="searchproduct" placeholder="輸入產品ID/產品名/ISBN" style="width: 200px;" >
            <input class="search_img" type="image" name="submit_Btn" id="submit_Btn" img src="img/search.png" onClick="" >
        </form>
    </div>
</body>
</html>