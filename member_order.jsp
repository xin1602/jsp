<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <h1>訂單記錄</h1>
    <hr>
    <%
    String userId=(String)session.getAttribute("userId");
    sql="SELECT * FROM `order` WHERE `member_id`='"+userId+"' ORDER BY `order_no` desc";
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
