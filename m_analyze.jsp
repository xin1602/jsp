<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="setsql.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>後台|分析</title>
    <link rel="icon" type="image" href="img/icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/manage.css">
    <link rel="stylesheet" href="css/m_analyze.css">
</head>

<nav>
    <!--Logo-->
    <div class="logo"><a href="index.jsp"><img src="img/logo.png" alt="logo"></a></div>
 
    <!--會員登入/會員資料-->
    <div class="member"><a href="manage.jsp"><img src="img/member.png" alt="member"></a></div>
</nav>
</head>
<body>
    <p>瀏覽者點閱行為分析</p>
    <table class="analyze" border="1">
        <tr>
            <th>類型</th>
            <th>點擊次數</th>
            <th>點擊人數</th>
            <th>年齡分佈</th>
            <th>性別比例</th>
        </tr>
    <%
        sql="select sum(`horry_count`) from `click`";
        ResultSet rsHS=con.createStatement().executeQuery(sql);
        rsHS.next();

        sql="select count(`horry_count`) from `click` where `horry_count`!= 0";
        ResultSet rsHC=con.createStatement().executeQuery(sql);
        rsHC.next();

        sql="select sum(`love_count`) from `click`";
        ResultSet rsLS=con.createStatement().executeQuery(sql);
        rsLS.next();

        sql="select count(`love_count`) from `click` where `love_count`!= 0";
        ResultSet rsLC=con.createStatement().executeQuery(sql);
        rsLC.next();

        sql="select sum(`suspense_count`) from `click`";
        ResultSet rsSS=con.createStatement().executeQuery(sql);
        rsSS.next();

        sql="select count(`suspense_count`) from `click` where `suspense_count`!= 0;";
        ResultSet rsSC=con.createStatement().executeQuery(sql);
        rsSC.next();


        sql="select sum(`fantasy_count`) from `click`;";
        ResultSet rsFS=con.createStatement().executeQuery(sql);
        rsFS.next();

        sql="select count(`fantasy_count`) from `click` where `fantasy_count`!= 0;";
        ResultSet rsFC=con.createStatement().executeQuery(sql);
        rsFC.next();

    %>
        <tr class="analyze_text">
            <td>恐怖</td>
            <td><%=rsHS.getString(1)%></td>
            <td><%=rsHC.getString(1)%></td>
            <td class="analyze_text2"></td>
            <td class="analyze_text2"></td>
        </tr>
        <tr class="analyze_text">
            <td>愛情</td>
            <td><%=rsLS.getString(1)%></td>
            <td><%=rsLC.getString(1)%></td>
            <td class="analyze_text2"></td>
            <td class="analyze_text2"></td>
        </tr>
        <tr class="analyze_text">
            <td>懸疑</td>
            <td><%=rsSS.getString(1)%></td>
            <td><%=rsSC.getString(1)%></td>
            <td class="analyze_text2"></td>
            <td class="analyze_text2"></td>
        </tr>
        <tr class="analyze_text">
            <td>科幻</td>
            <td><%=rsFS.getString(1)%></td>
            <td><%=rsFC.getString(1)%></td>
            <td class="analyze_text2"></td>
            <td class="analyze_text2"></td>
        </tr>
    </table>
    <%
        con.close();
    %>
</body>
</html>