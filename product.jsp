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
    <h1><u>奇幻</u></h1>
    <table>
    <%  	
    try {
//Step 1: 載入資料庫驅動程式 
        	Class.forName("com.mysql.jdbc.Driver");	  
        try {
//Step 2: 建立連線 
        	String url="jdbc:mysql://localhost/?serverTimezone=UTC"; 
            String sql="";
            Connection con=DriverManager.getConnection(url,"jsp","opo77990");   		
//Step 5: 顯示結果 				
		   if(con.isClosed())
              out.println("連線建立失敗");
           else
             sql="use `bookstore`";
             con.createStatement().execute(sql);
             sql="select `product_name` from `products` where `category` = '恐怖'";
//Step 6: 關閉連線
              con.close();
        }            
        catch (SQLException sExec) {
           out.println("SQL錯誤!" + sExec.toString());
        }
    }       
    catch (ClassNotFoundException err) {
          out.println("class錯誤" + err.toString());
    }    
%>      
    
        <tr>
            <td><a href="book.html"><img src="img/fantasy/fantasy01.jpg" alt=""></a></td>
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

