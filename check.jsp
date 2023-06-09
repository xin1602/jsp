<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="setsql.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>看Bar！ | 結帳</title>
    <link rel="icon" type="image" href="img/icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/check.css">
</head>

<%@ include file="nav.jsp"%>

<body>
    <div class="checkList">
        <h1>結帳商品</h1>
        <hr>
        <table>
            <tr>
                <td>商品圖</td>
                <td>商品</td>
                <td>單價</td>
                <td>數量</td>
                <td>金額</td>
            </tr>
             <%
				String userId=(String)session.getAttribute("userId");
				sql="SELECT * FROM `cart` WHERE `member_id`='"+userId+"' AND order_no is NULL";
				ResultSet cartlist=con.createStatement().executeQuery(sql);
				ResultSet cartP;
                int num=0;
				int sub_total=0;
                int discount=0;
                int total=0;

                String amount[] = request.getParameterValues("amount");

				while(cartlist.next()){
					sql="SELECT * FROM `products` WHERE `product_id`='"+cartlist.getString("product_id")+ "'";
					cartP=con.createStatement().executeQuery(sql);
					cartP.next();

			%>
            <tr>
                <td><img src="img/<%=cartP.getString("img")%>" class="tdimg"></td>
                <td><%=cartP.getString("product_name")%></td>
                <td>NT$<%=cartP.getString("price")%></td>
                <td><%=amount[num]%></td>
                <td>NT$<%=Integer.parseInt(amount[num]) * Integer.parseInt(cartP.getString("price"))%></td>
            </tr>

            <%
                sub_total+=Integer.parseInt(amount[num]) * Integer.parseInt(cartP.getString("price"));
                discount=(int)Math.floor(sub_total*0.1);
                total=sub_total-discount;
                sql = "UPDATE cart SET quantity='"+amount[num]+"' ,price='"+(Integer.parseInt(amount[num]) * Integer.parseInt(cartP.getString("price")))+"' WHERE `member_id`='" + userId+ "' AND `product_id`='"+cartlist.getString("product_id")+ "' AND `order_no` IS NULL" ;
			    con.createStatement().executeUpdate(sql);
                session.setAttribute("sub_total",Integer.toString(sub_total));
                session.setAttribute("discount",Integer.toString(discount));
                session.setAttribute("total",Integer.toString(total));
                num++;
                }
             %>

            <tr>
                <td>小計：</td>
                <td></td>
                <td></td>
                <td></td>
                <td>NT$<%=sub_total%></td>
            </tr>
            <tr>
                <td>優惠：</td>
                <td></td>
                <td></td>
                <td></td>
                <td>-NT$<%=discount%></td>
            </tr>
            <tr>
                <td>總計：</td>
                <td></td>
                <td></td>
                <td></td>
                <td>NT$<%=total%></td>
            </tr>
        </table>
    </div>
    <div class="info">
        <h1>購買表單</h1>
        <hr>
        <%
            sql = "SELECT * FROM `members` WHERE `member_id`='" + userId+ "' "  ;
            rs =con.createStatement().executeQuery(sql);
            rs.next();
        %>
        <div class="purchase">
            <form action="sand_order.jsp" method="post">
                <label for="name">姓　　名：</label>
                <input type="text" id="name" name="name" value="<%=rs.getString("member_name")%>" required><br>
                <label for="phone">連絡電話：</label>
                <input type="text" id="phone" name="phone" value="<%=rs.getString("phone_number")%>" required><br>
                <label for="email">電子信箱：</label>
                <input type="email" id="email" name="email" value="<%=rs.getString("email")%>" required><br>
                <label for="payment">付款方式：</label>
                <select name="payment" id="payment"  name="payment">
                    <option selected="selected">貨到付款</option>
                    <option>LINE PAY</option>
                    <option>信用卡</option>
                </select><br>
                <label for="address">收件地址：</label>
                <input type="text" id="address" name="address" value="<%=rs.getString("city")+rs.getString("district")+rs.getString("address")%>" required><br>
                <button type="submit" id="enter">確認送出</button>
            </form>
        </div>
        <%
            con.close();
        %>
    </div>

    <!--footer-->
    <%@ include file="footer.jsp"%>

</body>
</html>