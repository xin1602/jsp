<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bar！ | 商品頁</title>
    <link rel="icon" type="image" href="img/icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/book.css">
    <link rel="stylesheet" href="css/main.css">
    <script>
        function minus(num) {
            var number = Number(document.getElementsByClassName("input_num")[num].value);
            if (number > 1) {
                document.getElementsByClassName("input_num")[num].value = number - 1;
            }
        }
        function add(num) {
            var number = Number(document.getElementsByClassName("input_num")[num].value);
            if (number < 100) {
                document.getElementsByClassName("input_num")[num].value = number + 1;
            }
        }
        function f1() {
            document.f.action="to_cart.jsp?mode=1";
            document.f.submit();
        }
        function f2() {
            document.f.action="to_cart.jsp?mode=2";
            document.f.submit();
        }        
    </script>
</head>

<%@ include file="nav.jsp"%>

<body>
    <%@ include file="setsql.jsp"%>
    <!-- 讀取products.jsp超連結的parameter以方便設定product_id -->
    <%
        String number=request.getParameter("number");
        session.setAttribute("number",number);
        sql="select * from `products` where `product_id`='"+number+"'";
        rs=con.createStatement().executeQuery(sql);
        rs.next();
    %>
    <div class="array1">
        <div class="array2">
            <div class="img">
                <img src='img/<%=rs.getString(9)%>'>
            </div>
            <div class="c">
                <div class="area"><h1><b><%= rs.getString(3) %></b></h1></div>
                <div class="introduce">
                    <br>作者：<%= rs.getString(4) %></br>
                    <br>出版社：<%= rs.getString(5) %> </br>
                    <br>出版日期：<%= rs.getString(6) %></br>
                    <br>ISBN：<%= rs.getString(10) %></br>
                    <br>優惠價：<%= rs.getString(7) %></br>
                    <br>庫存：<%= rs.getString(11) %></br>
                
                    <div class="shopping">
                        <form name="f" action="" method="post">
                            <input type="button" value="-" class="btn minus" onclick="minus(0)"/>
                            <input type="text" name="num" value="1" class="input_num" readonly/>
                            <input type="button" value="+" class="btn add" onclick="add(0)"/></br>
                            <button class="button_shop cart" name="add1" onclick="f1()" >加入購物車</button>
                            <button class="button_shop purchase" onclick="f2()">直接購買</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <br>
    <hr class="sep">
    <div class="word">
        <%=rs.getString(8)%>
    </div>

    <!-- 商品留言區與評論區 -->
    <%@ include file="board.jsp"%>

    <!-- footer -->
    <%@ include file="footer.jsp"%>
</body>
</html>