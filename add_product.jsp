<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="setsql.jsp" %>
<%
    String product_name=request.getParameter("ProductName");
    String product_type=request.getParameter("ProductType");
    String product_author=request.getParameter("ProductAuthor");
    String product_publishinghouse=request.getParameter("ProductPublishingHouse");
    String product_publishingdate=request.getParameter("ProductPublishingDate");
    String product_isbn=request.getParameter("ProductISBN");
    String product_price=request.getParameter("ProductPrice");
    String product_quantity=request.getParameter("ProductQuantity");
    String product_info1=request.getParameter("ProductInfo");
    String product_info=product_info1.replaceAll("\r","<br>");
    String product_photo=request.getParameter("ProductPhoto");

    //判斷類型寫成英文存入，為了寫入圖片路徑
    String category_english="";
    if(product_type.equals("恐怖")){
        category_english="horry";
    }
    else if(product_type.equals("愛情")){
        category_english="love";
    }
    else if(product_type.equals("懸疑")){
        category_english="suspense";
    }
    else if(product_type.equals("科幻")){
        category_english="fantasy";
    }

    //判斷輸入格都必須有東西傳入
    if( product_name.equals("") || product_type.equals("") || product_author.equals("") || product_publishinghouse.equals("") || product_publishingdate.equals("") || 
    product_isbn.equals("") || product_price.equals("") || product_quantity.equals("") || product_info.equals("") || product_photo.equals("")){
        out.print("<script>alert('請完整填完資訊再上架！'); window.location='m_shelves.jsp'</script>");
    }
    else{
        sql="select * from `products` where `ISBN`=?";
        stmt = con.prepareStatement(sql);
        stmt.setString(1,product_isbn);
        rs=stmt.executeQuery();
        if(rs.next())
            out.print("<script>alert('已有此商品，請重新確認！'); window.location='m_shelves.jsp'</script>");
        else{
            sql = "INSERT INTO `products` (`category`, `product_name`, `author`, `publishing_house`, `publishing_date`, `price`, `info`, `img`, `ISBN`, `stock`, `sale`) " +"VALUES (?,?,?,?,?,?,?,?,?,?,?)";
            stmt=con.prepareStatement(sql);
            
            stmt.setString(1,product_type);
            stmt.setString(2,product_name);
            stmt.setString(3,product_author);
            stmt.setString(4,product_publishinghouse);
            stmt.setString(5,product_publishingdate);
            stmt.setString(6,product_price);
            stmt.setString(7,product_info);
            stmt.setString(8,category_english+"/"+product_photo);
            stmt.setString(9,product_isbn);
            stmt.setString(10,product_quantity);
            stmt.setString(11,"0");
            
            stmt.executeUpdate();
   
            out.print("<script>alert('商品上架成功！'); window.location='index.jsp'</script>");
        }
    }    
%>