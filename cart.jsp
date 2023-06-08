<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="setsql.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>看Bar！ | 購物車</title>
    <link rel="icon" type="image" href="img/icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/cart.css">
</head>
<script src="js/cart.js"></script>
<script>
    // 結帳 提交表單
    function submitCartForm() {
        document.getElementById('cartForm').submit();
    }
</script>

<%@ include file="nav.jsp"%>


<!--onload，在加载时计算好原始金额-->
<body onload="total()">
    <div class="content_cart">
        <p class="cart_p">My Cart</p>
            
        <div class="cartList">
            <ul>
                <li>商品圖</li>
                <li>商品</li>
                <li>單價</li>
                <li>數量</li>
                <li>金額</li>
                <li>刪除</li>
            </ul>
            <%
            String userId=(String)session.getAttribute("userId");
            sql="SELECT * FROM `cart` WHERE `member_id`='"+userId+"' AND order_no is NULL";
            ResultSet cartlist=con.createStatement().executeQuery(sql);
            ResultSet cartP;
            int num=0;
            int sub_total=0;
            int discount=0;
            int total=0;
            String noCart="YES";

            while(cartlist.next()){
                    noCart="NO";
                    sql="SELECT * FROM `products` WHERE `product_id`='"+cartlist.getString("product_id")+ "'";
                    cartP=con.createStatement().executeQuery(sql);
                    cartP.next();

            %>
            <form  id="cartForm" action="check.jsp" method="post">

                <ul style="display: flex;justify-content: space-between;align-items: center; margin: 20px 0;">
                    <li><img class="cart_img" src="img/<%=cartP.getString("img")%>"  alt="" ></li>
                    <li class="book_name"><%=cartP.getString("product_name")%></li>
                    <li class="book_name">NT$:<input readonly type="text" name="price" value="<%=cartP.getString("price")%>"></li>
                    <li><input type="button" name="minus_btn" value="-" onclick="minus(<%=num%>)"><input readonly type="text" name="amount" value="<%=cartlist.getString("quantity")%>" oninput="value=value.replace('-', '')" onchange="checkStock(<%=num%>)"><input type="button" name="plus_btn" value="+" onclick="plus(<%=num%>)" ></li>
                    <li class="book_name" id="price<%=num%>">NT$:<%=cartlist.getString("price")%></li>
                    <li><input type="hidden" name="stock" value="<%=cartP.getString("stock")%>"></li>
                    <li><p><a href="delete_cart.jsp?pid=<%=cartP.getString("product_id")%>"><img class="garbage" src="img/garbage.png" alt="garbage"></a></p></li>
                </ul>

                <%
                    num++;
                    sub_total+=Integer.valueOf(cartlist.getString("price"));
                    discount=(int)Math.floor(sub_total*0.1);
                    total=sub_total-discount;
                }
                if(noCart=="YES"){
            %>
            <br><br><br><br><br>
            <h2 align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;購物車內尚無商品</h2>
            <%
            }
            else{
                %>

                <ul style="display: flex;justify-content: space-between;align-items: center; margin: 20px 0;">
                    <li class="book_name">小計：</li>
                    <li id="sub_total" class="book_name">NT$<%=sub_total%></li>
                </ul>

                <ul style="display: flex;justify-content: space-between;align-items: center; margin: 20px 0;">
                    <li class="book_name">優惠：全館9折！</li>
                    <li  id="discount" class="book_name">-NT$<%=discount%></li>
                </ul>

                <ol>
                    <li id="totalPrice">NT$<%=total%></li>
                    <li><a href="#" onclick="submitCartForm()"><span>結帳</span></a></li>
                </ol>
            </form>
            <%
                session.setAttribute("sub_total",Integer.toString(sub_total));
                session.setAttribute("discount",Integer.toString(discount));
                session.setAttribute("total",Integer.toString(total));
            }
            con.close();
            %>
        </div>
    </div>
    <!--footer-->
    <%@ include file="footer.jsp"%>

    <script src="js/main.js"></script>

    
</body>
</html>