<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bar！ | 產品總覽</title>
    <link rel="icon" type="image" href="img/icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/product.css">
</head>

<nav>
    <!--Logo-->
    <div class="logo"><a href="index.html"><img src="img/logo.png" alt="logo"></a></div>
    <!--產品分類-->
    <!--參考資料：https://www.astralweb.com.tw/pure-css-drop-down-menu/-->
    <ul class="product">產品分類&equiv;
        <ul class="dropdown-menu">
            <li><a href="product.html">恐怖</a></li>
            <li><a href="product.html">愛情</a></li>
            <li><a href="product.html">懸疑</a></li>
            <li><a href="product.html">科幻</a></li>
        </ul>
    </ul>
    <!--關於我們-->
    <div class="aboutus"><a href="about_team.html">關於我們</a></div>
    <!--會員中心-->
    <div class="mem-center"><a href="member.html">會員中心</a></div>
    <div class="nav_img">
        <!--會員登入/會員資料-->
        <a href="login.html"><img src="img/member.png" alt="member"></a>
        <!--購物車-->
        <a href="cart.html"><img src="img/cart.png" alt="cart"></a>
        
    </div>
    <input type="search" id="search" placeholder="Search for something...">
    <!--搜尋-->
    <input type="image" name="submit_Btn" id="submit_Btn" img src="img/search.png" onClick="" >
</nav>

<body>
    <h1><u>科幻</u></h1>
    <table>
    <%@ include file="setsql.jsp"%>
    <% 
            sql="select count(*) from `products` where `category` = '科幻'";
            ResultSet rs=con.createStatement().executeQuery(sql);
            int n=rs.nextInt(1);
            sql="select count(*) from `products` where `category` = '科幻'";
            ResultSet rs=con.createStatement().executeQuery(sql);
            while(rs.next()){
                for(int i=0;i<=n;i++){
                    if(i%4==1){
                        out.print("<tr>");
                        out.print("<td><a href="book.html?number=<%=rs.getString(1)%>"><img src="img/<%=rs.getString(9)%>" alt="<%=rs.getString(3)%>"></a></td>");
                    }
                    elif(i%4==2 || i%4==3){
                        out.print("<td><a href="book.html?number=<%=rs.getString(1)%>"><img src="img/<%=rs.getString(9)%>" alt="<%=rs.getString(3)%>"></a></td>");
                    }
                    else{
                        out.print("<td><a href="book.html?number=<%=rs.getString(1)%>"><img src="img/<%=rs.getString(9)%>" alt="<%=rs.getString(3)%>"></a></td>");
                        out.print("</tr>");
                    }
                }
            }
    %>      
    
        <tr>
            
            <td><a href="book.html"><img src="img/fantasy/fantasy02.jpg" alt=""></a></td>
            <td><a href="book.html"><img src="img/fantasy/fantasy03.jpg" alt=""></a></td>
            <td><a href="book.html"><img src="img/fantasy/fantasy04.jpg" alt=""></a></td>
        </tr>
        <tr>
            <td><a href="book.html">樓下的房客</a></td>
            <td><a href="book.html">樓下的房客</a></td>
            <td><a href="book.html">樓下的房客</a></td>
            <td><a href="book.html">樓下的房客</a></td>
        </tr>
        <tr>
            <td><a href="book.html"><img src="img/fantasy/fantasy05.jpg" alt=""></a></td>
            <td><a href="book.html"><img src="img/fantasy/fantasy06.jpg" alt=""></a></td>
            <td><a href="book.html"><img src="img/fantasy/fantasy07.jpg" alt=""></a></td>
            <td></td>
        </tr>
        <tr>
            <td><a href="book.html">樓下的房客</a></td>
            <td><a href="book.html">樓下的房客</a></td>
            <td><a href="book.html">樓下的房客</a></td>
            <td></td>
        </tr>
    </table>
    <footer>
        Copyright © 2023 all rights reserved<br>
        瀏覽人數：
    </footer>
</body>
</html>

