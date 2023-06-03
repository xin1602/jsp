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
            <form action="check.jsp" method="post">

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

                <ul style="display: flex;justify-content: space-between;align-items: center; margin: 20px 0;">
                    <li><img class="cart_img" src="img/<%=cartP.getString("img")%>"  alt="" ></li>
                    <li class="book_name"><%=cartP.getString("product_name")%></li>
                    <li class="book_name">NT$:<%=cartP.getString("price")%></li>
                    <li><input type="button" name="minus" value="-" onclick="minus(<%=num%>)"><input readonly type="text" name="amount" value="1" oninput="value=value.replace('-', '')"><input type="button" name="plus" value="+" onclick="plus(<%=num%>)" ></li>
                    <li class="book_name" id="price<%=num%>">NT$:<%=cartlist.getString("price")%></li>
                    <li><form action='delete_cart.jsp' method="post"><input class="garbage" type="imgge" src="img/garbage.png" width="50" height="50" / ></form></li>
                </ul>

                <%
                    num++;
                    sub_total+=Integer.valueOf(cartlist.getString("price"));
                    discount=(int)Math.floor(sub_total*0.1);
                    total=sub_total-discount;
                }
                if(noCart=="YES"){
                %>
                        <br>
                        <h3 align="center">購物車內尚無商品</h3>
                        <br>
                <%
                }
                else{
                %>

                <%-- <ul style="display: flex;justify-content: space-between;align-items: center" id="first">
                    <li><img class="cart_img" src="https://picsum.photos/200"  alt="" ></li>
                    <li class="book_name">這裡可以放八個字</li>
                    <li class="book_name">NT$:<input readonly type="text" name="price" value="290"></li>
                    <li><input type="button" name="minus" value="-" onclick="minus(0)"><input readonly type="text" name="amount" value="1" oninput="value=value.replace('-', '')"><input type="button" name="plus" value="+" onclick="plus(0)" ></li>
                    <li class="book_name" id="price0">NT$:290</li>
                    <li><p onclick="delete1()"><img class="garbage" src="img/garbage.png" alt="garbage"></p></li>
                </ul>
                <ul style="display: flex;justify-content: space-between;align-items: center; margin: 20px 0;">
                    <li><img class="cart_img" src="https://picsum.photos/300"  alt="" ></li>
                    <li class="book_name">《昆虫记》</li>
                    <li class="book_name">NT$:<input readonly type="text" name="price" value="240"></li>
                    <li><input type="button" name="minus" value="-" onclick="minus(1)"><input readonly type="text" name="amount" value="1" oninput="value=value.replace('-', '')"><input type="button" name="plus" value="+" onclick="plus(1)"></li>
                    <li class="book_name" id="price1">NT$:240</li>
                    <li><p onclick="delete1()"><img class="garbage" src="img/garbage.png" alt="garbage"></p></li>
                </ul>
                <ul style="display: flex;justify-content: space-between;align-items: center; margin: 20px 0;">
                    <li><img class="cart_img" src="https://picsum.photos/400"  alt="" ></li>
                    <li class="book_name">一本書</li>
                    <li class="book_name">NT$:<input readonly type="text" name="price" value="300"></li>
                    <li><input type="button" name="minus" value="-" onclick="minus(2)"><input readonly type="text" name="amount" value="1" oninput="value=value.replace('-', '')"><input type="button" name="plus" value="+" onclick="plus(2)"></li>
                    <li class="book_name" id="price2">NT$:300</li>
                    <li><p onclick="delete1()"><img class="garbage" src="img/garbage.png" alt="garbage"></p></li>
                </ul> --%>

                <ul style="display: flex;justify-content: space-between;align-items: center; margin: 20px 0;">
                    <li class="book_name">小計：</li>
                    <li class="book_name">NT$<%=sub_total%></li>
                </ul>


                <ul style="display: flex;justify-content: space-between;align-items: center; margin: 20px 0;">
                    <li class="book_name">優惠：全館9折！</li>
                    <li class="book_name">-NT$<%=discount%></li>
                </ul>

                <ol>
                    <li id="totalPrice">NT$<%=total%></li>
                    <li><input type="submit" value="結帳"></li>
                </ol>
            </form>
            <%
                session.setAttribute("sub_total",Integer.toString(sub_total));
                session.setAttribute("discount",Integer.toString(discount));
                session.setAttribute("total",Integer.toString(total));
                }
            %>
        </div>
    </div>
    <!--footer-->
    <%@ include file="footer.jsp"%>

    <script src="js/main.js"></script>

    
</body>
</html>