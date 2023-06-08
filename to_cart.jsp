<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ include file="setsql.jsp"%>
<%
  boolean loggedIn = false;
  if (session != null && session.getAttribute("loggedIn") != null) {
    loggedIn = (Boolean) session.getAttribute("loggedIn");
  }
%>
<%
	//使用者id
	String userId=(String)session.getAttribute("userId");
    //書的編號
	String product_id=(String)session.getAttribute("number");
    //加入購物車的商品數量
	String num=request.getParameter("num");
	//模式( mode = 1 加入購物車 / mode = 2 直接購買 )
	String mode=request.getParameter("mode");
	if (num==null){
		num="1";
	}

    String query = "SELECT * FROM `cart` WHERE `member_id`= ? AND `product_id`= ? ";
    stmt = con.prepareStatement(query);
    stmt.setString(1, userId);
    stmt.setString(2, product_id);
    rs = stmt.executeQuery();


	query = "SELECT * FROM `products` WHERE `product_id`= ? ";
    stmt = con.prepareStatement(query);
    stmt.setString(1, product_id);
    ResultSet rsP = stmt.executeQuery();
	rsP.next();
	int price=Integer.valueOf(rsP.getString("price"));

	if(!loggedIn){
		out.print("<script>alert('請先登入！');window.location='login.jsp' </script>");
	}
	else if(loggedIn){
		if(rs.next()){
			if(rs.getString("order_no")==null){
				int total_quantity=Integer.valueOf(rs.getString("quantity"));
				//如果庫存數量夠，才加上去
				if( (Integer.valueOf(rs.getString("quantity"))+Integer.valueOf(num)) <= Integer.valueOf(rsP.getString("stock")) ){
					total_quantity=Integer.valueOf(rs.getString("quantity"))+Integer.valueOf(num);
				}

				int total_price= price*total_quantity;
				sql = "SELECT * FROM `cart` WHERE `member_id`= '" + userId+ "' AND `product_id`= '"+product_id+"'" ;
				rs=con.createStatement().executeQuery(sql);
				int cart_id=0;
				while(rs.next()){
					cart_id=Integer.valueOf(rs.getString("cart_id"));
				}


				sql = "UPDATE cart SET quantity='"+total_quantity+"' ,price='"+total_price+"' WHERE `member_id`='" + userId+ "' AND `product_id`='"+product_id+ "' AND `cart_id`='"+cart_id+"'" ;
				con.createStatement().execute(sql);
			}
			else{
				int total_price= price*Integer.valueOf(num);
				sql = "INSERT INTO cart (member_id, product_id, quantity, price) VALUES ('"+userId+"', '"+product_id+"', '"+num+"','"+total_price+"')" ;
				con.createStatement().execute(sql);
			}
		}
		else{
			int total_price= price*Integer.valueOf(num);

			sql = "INSERT INTO cart (member_id, product_id, quantity, price) VALUES ('"+userId+"', '"+product_id+"', '"+num+"','"+total_price+"')" ;
			con.createStatement().execute(sql);
		}

		if (mode.equals("1")){
			out.print("<script>alert('已成功加入購物車！'); window.location='book.jsp?number="+product_id+"' </script>");
		}
		else if(mode.equals("2")){
			response.sendRedirect("cart.jsp");
		}
	}
	con.close();
%>