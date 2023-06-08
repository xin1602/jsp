<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="setsql.jsp"%>
<%
String product_id=request.getParameter("ProductID");
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


//Step1. 判斷是不是要刪除商品 
if(request.getParameter("editOrDelete").equals("刪除")){
    sql="delete from `products` where `product_id`='"+product_id+"'";
    con.createStatement().execute(sql);
    out.print("<script>alert('商品刪除成功！'); window.location='m_search.jsp'</script>");
}
else{
    //Step2. 判斷輸入格都必須有東西傳入 除了照片路徑
    //若沒有填寫完成跳回搜尋頁面(已鍵入搜尋條件)
    if( product_name.equals("") || product_type.equals("") || product_author.equals("") || product_publishinghouse.equals("") || product_publishingdate.equals("") || product_isbn.equals("") || product_price.equals("") || product_quantity.equals("") || product_info.equals("")){
        out.print("<script>alert('請完整填完資訊再更改！'); window.location='m_edit.jsp?searchproduct=" + (String)session.getAttribute("search")+"'</script>");
    }
    else{
        //Step2. 判斷照片路徑是否更改
        if(product_photo.equals("")){
            sql = "update `products` set `category`='"+product_type+"', `product_name`='"+product_name+"', `author`='"+product_author+"', "+"`publishing_house`='"+product_publishinghouse+"', `publishing_date`='"+product_publishingdate+"', `price`='"+product_price+"', "+"`info`='"+product_info+"', `ISBN`='"+product_isbn+"', `stock`='"+product_quantity+"' where `product_id`='"+product_id+"'";
            con.createStatement().execute(sql);
            out.print("<script>alert('商品更新成功！'); window.location='index.jsp'</script>");
        }
        else{
            sql = "update `products` set `category`='"+product_type+"', `product_name`='"+product_name+"', `author`='"+product_author+"', "+"`publishing_house`='"+product_publishinghouse+"', `publishing_date`='"+product_publishingdate+"', `price`='"+product_price+"', "+"`info`='"+product_info+"', `img`='"+category_english + "/" + product_photo +"', `ISBN`='"+product_isbn+"', `stock`='"+product_quantity+"' where `product_id`='"+product_id+"'";   
            con.createStatement().execute(sql);
            out.print("<script>alert('商品更新成功！'); window.location='index.jsp'</script>");
        }
    }    
}
%>