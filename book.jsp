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
    </script>
</head>

<%@ include file="nav.jsp"%>

<body>
    <%@ include file="setsql.jsp"%>
    <!-- 讀取products.jsp超連結的parameter以方便設定product_id -->
    <%
        String number=request.getParameter("number");
        session.setAttribute("number",number);
        sql="select * from `products` where `product_id`= +'number'";
        ResultSet rs=con.createStatement().executeQuery(sql);
        rs.next();
    %>
    <div class="array1">
        <div class="array2">
            <div class="img">
                <img src="img/<%=rs.getString(9)" >
            </div>
            <div class="c">
                <div class="area"><h1><b><%= rs.getString(3) %></b></h1></div>
                <div class="introduce">
                    <br>作者：<%= rs.getString(4) %></br>
                    <br>出版社：<%= rs.getString(5) %> </br>
                    <br>出版日期：<%= rs.getString(6) %></br>
                    <br>優惠價：<%= rs.getString(7) %></br>
                    <br>庫存：<%= rs.getString(11) %></br>
                
                    <div class="shopping">
                        <input type="button" value="-" class="btn minus" onclick="minus(0)">
                        <input type="text" value="1" class="input_num" readonly>
                        <input type="button" value="+" class="btn add" onclick="add(0)"></br>
                        <a href="cart.html"><button class="button_shop cart">加入購物車</button></a>
                        <a href="check.html"><button class="button_shop purchase">直接購買</button></a>
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

    <div class="comment">
        <h1>留言區</h1>
        <hr>
        <div class="QAQ">
            <div class="flex_center">
                <img src="https://picsum.photos/100" alt="" class="cmt_pro">
                <div class="overstar">★★★☆☆</div>
            </div>
            <div class="comment_text">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Minus officia quaerat amet, eum impedit enim nam praesentium architecto dolore sint! Laborum assumenda reprehenderit, quidem cum nostrum eveniet facere autem velit!</div>
        </div>
        <hr>
        <div class="QAQ">
            <div class="flex_center">
                <img src="https://picsum.photos/100" alt="" class="cmt_pro">
                <div class="overstar">★★★★☆</div>
            </div>
            <div class="comment_text">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Minus officia quaerat amet, eum impedit enim nam praesentium architecto dolore sint! Laborum assumenda reprehenderit, quidem cum nostrum eveniet facere autem velit!</div>
        </div>
        <hr>
        <div class="sendcmt">
            <div class="stars">
                <input type="radio" name="star" id="star1" hidden />
                <label for="star1"></label>
                <input type="radio" name="star" id="star2" hidden />
                <label for="star2"></label>
                <input type="radio" name="star" id="star3" hidden />
                <label for="star3"></label>
                <input type="radio" name="star" id="star4" hidden />
                <label for="star4"></label>
                <input type="radio" name="star" id="star5" hidden />
                <label for="star5"></label>
            </div>
            <textarea name="" id="" cols="30" rows="10" class="write" placeholder="留下評論及評分吧！"></textarea>
            <input type="submit" value="確認" id="send">
        </div>
    </div>
    <div class="book">
        <p>推薦商品</p>
        <div class="image">
            <div class="recom">
                <img src="img/fantasy/fantasy06.jpg">
                <p>這裡可以放八個字</p>
            </div>
            <div class="recom">
                <img src="img/fantasy/fantasy05.jpg">
                <p>書</p>
            </div>
            <div class="recom">
                <img src="img/fantasy/fantasy04.jpg">
                <p>書</p>
            </div>
            <div class="recom">
                <img src="img/fantasy/fantasy07.jpg">
                <p>書</p>
            </div>
        </div>
    </div>
    <%@ include file="footer.jsp"%>
</body>
</html>