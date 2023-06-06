<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<div class="book">
    <p>推薦商品</p>
    <div class="image">
<%
    sql="select count(*) from `products`";
    rs=con.createStatement().executeQuery(sql);
    int n=0;
    Random rand=new Random();
    while(rs.next()){
        n=rs.getInt(1);
        for(int i=1;i<=4;i++){
            sql="select * from `products` where `product_id` = '"+(rand.nextInt(n)+1)+"'";
            rs=con.createStatement().executeQuery(sql);
            while(rs.next()){
%>

        <div class="recom">
            <a href="book.jsp?number=<%=rs.getString(1)%>">
                <img src="img/<%=rs.getString(9)%>">
            </a>
            <p><%=rs.getString(3)%></p>
        </div>

<%            
        }
    }
%>
    </div>
</div>
<%
}
%>