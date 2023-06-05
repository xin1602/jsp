<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="setsql.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>後台|銷貨紀錄</title>
    <link rel="icon" type="image" href="img/icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/manage.css">
    <link rel="stylesheet" href="css/m_sales.css">
    <link rel="stylesheet" href="css/member.css">
</head>

<nav>
    <!--Logo-->
    <div class="logo"><a href="index.jsp"><img src="img/logo.png" alt="logo"></a></div>
 
    <!--會員登入/會員資料-->
    <div class="member"><a href="manage.jsp"><img src="img/member.png" alt="member"></a></div>
</nav>

</head>
<body>
    <p>銷貨紀錄</p>
    <%
        sql="SELECT * FROM `order` ORDER BY `date`";
        ResultSet rsOrder=con.createStatement().executeQuery(sql);

        String noOrder="YES";

        while(rsOrder.next()){
            noOrder="NO";
            sql="SELECT * FROM `cart` WHERE `order_no`='"+rsOrder.getString("order_no")+"'";
            ResultSet detail=con.createStatement().executeQuery(sql);
            ResultSet cartP;
    %>
    <table>
        <tr>
            <td colspan="2" style="text-align: left;">訂單編號：<%=rsOrder.getString("order_no")%></td>
            <td colspan="2">下單時間：<%=rsOrder.getString("date")%></td>
            <td colspan="2"><%=rsOrder.getString("status")%></td>
        </tr>
        <%
            while(detail.next()){
                sql="SELECT * FROM `products` WHERE `product_id`='"+detail.getString("product_id")+ "'";
                cartP=con.createStatement().executeQuery(sql);
                cartP.next();
        %>
        <tr>
            <td><img src="img/<%=cartP.getString("img")%>" alt=""></td>
            <td><%=cartP.getString("product_name")%></td>
            <td>$<%=cartP.getString("price")%></td>
            <td></td>
            <td><%=detail.getString("quantity")%></td>
            <td>$ <%=detail.getString("price")%></td>
        </tr>
        <%
            }
        %>
        <tr>
            <td colspan="2">小計：$ <%=rsOrder.getString("sub_total")%></td>
            <td colspan="2">優惠：$ <%=rsOrder.getString("discount")%></td>
            <td colspan="2">總計：$ <%=rsOrder.getString("total")%></td>
        </tr>
    </table>
    <%
        }
        if(noOrder.equals("YES")){
    %>
        <br>
        <h2 align="center">尚無任何訂單</h2>
        <br>
    <%
        }
     %>
</body>
</html>