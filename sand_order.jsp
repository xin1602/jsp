<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="setsql.jsp"%>
<%@ page import="java.time.LocalDateTime,java.time.format.DateTimeFormatter" %>

<%
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
    String email= request.getParameter("email");
	String address = request.getParameter("address");
	String payment= request.getParameter("payment");
	Timestamp time=new Timestamp(System.currentTimeMillis());

	if(name==null || phone==null || email==null ||address==null){
		out.print("<script>alert('請確實填寫送貨及付款資料！'); window.location='check.jsp'</script>");
	}
	else{
		String userId=(String)session.getAttribute("userId");
		String sub_total=(String)session.getAttribute("sub_total");
        String discount=(String)session.getAttribute("discount");
        String total=(String)session.getAttribute("total");
		String O_No1="";
		String O_No="";
		sql = "SELECT * FROM `cart` WHERE `member_id`='"+userId+"' AND order_no is NULL"  ;       //列出該會員的購物車清單
		rs =con.createStatement().executeQuery(sql);

		DateTimeFormatter Dformat = DateTimeFormatter.ofPattern("yyyyMMdd");
		String today=Dformat.format(LocalDateTime.now());

		sql ="SELECT * FROM `order` order by `date` desc ,`order_no`  desc limit 1";      //找出上一筆訂單，找單號
		ResultSet lastNo=con.createStatement().executeQuery(sql);
        if(lastNo.next()){
            O_No1=lastNo.getString("order_no");
        }
        else{
             O_No1="N"+today+"000";
        }
		if (O_No1.substring(1,9).equals(today)){
			long newNo= Long.parseLong(O_No1.substring(1,12))+1;
			O_No+="N"+Long.toString(newNo);
		}
		else{
			O_No+="N"+today+"001";
		}
		while(rs.next()){
			sql = "UPDATE cart SET order_no='"+O_No+"' WHERE `member_id`='"+userId+"' AND order_no is null ";
			con.createStatement().executeUpdate(sql);

			sql = "SELECT * FROM `products` WHERE `product_id`='" + rs.getString("product_id")+ "'"  ;
			ResultSet rsP =con.createStatement().executeQuery(sql);
			rsP.next();

			int sale=Integer.parseInt(rsP.getString("sale"))+Integer.parseInt(rs.getString("quantity"));
			int stock=Integer.parseInt(rsP.getString("stock"))-Integer.parseInt(rs.getString("quantity"));

			sql ="UPDATE products SET  sale='"+sale+"', stock='"+stock+"' WHERE `product_id`='" + rs.getString("product_id")+ "'";
			con.createStatement().executeUpdate(sql);

		}

		String query = "INSERT INTO `order` (order_no, member_id, date,status,recipient_name,recipient_phome_number,recipient_address, payment, sub_total, discount,total) VALUES (?, ?, ?,'待出貨',?,?,?,?,?,?,?)";
		stmt = con.prepareStatement(query);
		stmt.setString(1, O_No);
		stmt.setString(2, userId);
		stmt.setString(3, time.toString());
		stmt.setString(4, name);
		stmt.setString(5, phone);
		stmt.setString(6, address);
		stmt.setString(7, payment);
		stmt.setString(8, sub_total);
		stmt.setString(9, discount);
		stmt.setString(10, total);
		stmt.execute();

		con.close();

		out.print("<script>alert('訂購成功！回首頁！');window.location='index.jsp';</script>");
	}
%>
