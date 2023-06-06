<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>後台|查詢&更改</title>
    <link rel="icon" type="image" href="img/icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/manage.css">
    <link rel="stylesheet" href="css/m_shelves.css">
</head>

<nav>
    <!--Logo-->
    <div class="logo"><a href="index.jsp"><img src="img/logo.png" alt="logo"></a></div>
 
    <!--會員登入/會員資料-->
    <div class="member"><a href="manage.jsp"><img src="img/member.png" alt="member"></a></div>
</nav>

<body>
    <%@ include file="setsql.jsp" %>
    <p>產品查詢&更改</p>
    <div class="m_text3" style="width: 300px; display: flex;">
        <form action="" method="get">
            <input class="search" type="search" id="search" name="searchproduct" placeholder="輸入產品ID/產品名/ISBN" style="width: 200px;" >
            <input class="search_img" type="image" name="submit_Btn" id="submit_Btn" img src="img/search.png" onClick="" >
        </form>
    </div>
    <%
            //讀取搜尋條件並設為session
            String search=request.getParameter("searchproduct");
            session.setAttribute("search",search);
            sql="select count(*) from `products` where `product_id` like '%"+search+"%' or `product_name` like '%"+search+"%' or `ISBN` like '%"+search+"%'";
            rs=con.createStatement().executeQuery(sql);

            //先判斷是否有商品符合條件
            while(rs.next()){
                int search_result=rs.getInt(1);
                if(search_result==0){
                    out.print("<p style='color: red; font-weight:bolder; font-size:20px' >查無此商品！</p>");
                }
                else{
                        sql="select * from `products` where `product_id` like '%"+search+"%' or `product_name` like '%"+search+"%' or `ISBN` like '%"+search+"%'";
                        rs=con.createStatement().executeQuery(sql);
                        while(rs.next()){
    %>
    <form action="edit_product.jsp" method="post">
        <table class="m_shelves">
            <tr>
                <td class="m_text">
                    產品編號
                </td>
                <td class="m_text">
                    <input type="text" name="ProductID" value="<%=rs.getString(1)%>" readonly>
                    <div style="font-size: 14px;">※不可更改</div> 
                </td>
            </tr>

            <tr>
                <td class="m_text">
                    產品名稱
                </td>
                <td class="m_text">
                    <input type="text" name="ProductName" value="<%=rs.getString(3)%>">
                </td>
            </tr>

            <tr>
                <td class="m_text">
                    產品類型
                </td>
                <td class="m_text">
                    <select name="ProductType">
                        <%
                            ArrayList<String> category = new ArrayList<String>();
                            category.add("恐怖");
                            category.add("愛情");
                            category.add("懸疑");
                            category.add("科幻");
                    
                            for (int i = 0; i < category.size(); i++) {
                                if (rs.getString(2).equals(category.get(i))) {
                                    out.print("<option value='" + category.get(i) + "' selected>&nbsp;" + category.get(i) + "&nbsp;</option>");
                                } else {
                                    out.print("<option value='" + category.get(i) + "'>&nbsp;" + category.get(i) + "&nbsp;</option>");
                                }
                            }
                        %>
                    </select>
                </td>
            </tr>

            <tr>
                <td class="m_text">
                    作者
                </td>
                <td class="m_text">
                    <input type="text" name="ProductAuthor" value="<%=rs.getString(4)%>">
                </td>
            </tr>

            <tr>
                <td class="m_text">
                    出版社
                </td>
                <td class="m_text">
                    <input type="text" name="ProductPublishingHouse" value="<%=rs.getString(5)%>">
                </td>
            </tr>

            <tr>
                <td class="m_text">
                    出版日期
                </td>
                <td class="m_text">
                    <input type="date" name="ProductPublishingDate" value="<%=rs.getString(6)%>">
                </td>
            </tr>

            <tr>
                <td class="m_text">
                    ISBN
                </td>
                <td class="m_text">
                    <input type="text" name="ProductISBN" value="<%=rs.getString(10)%>">
                </td>
            </tr>

            <tr>
                <td class="m_text">
                    產品價格
                </td>
                <td class="m_text">
                    NT$ : <input class="m_text2" type="text" name="ProductPrice" value="<%=rs.getString(7)%>">
                </td>
            </tr>

            <tr>
                <td class="m_text">
                    庫存數量
                </td>
                <td class="m_text">
                    <input class="m_text2" type="text" name="ProductQuantity" value="<%=rs.getString(11)%>">本
                </td>
            </tr>

            <tr>
                <td class="m_text">
                    產品介紹
                </td>
                <td class="m_text">
                    <textarea name="ProductInfo" rows="13" cols="50" placeholder="輸入直接換行即可"><%=rs.getString(8)%></textarea>
                </td>
            </tr>

            <tr>
                <td class="m_text">
                    產品圖片
                </td>
                <td class="m_text">
                    <input type="file" name="ProductPhoto" id="pro_photo">
                    <div style="text-align: left; font-size: 14px;">原路徑：<%=rs.getString(9)%></div> 
                </td>
            </tr>
            <tr>
                <td class="m_text" colspan="2">
                    <input class="submit_text" type="submit" class="submit" name="editOrDelete" value="刪除">
                    <input class="submit_text" type="submit" class="submit" name="editOrDelete" value="確定修改">
                </td>
            </tr>
        </table>
    </form>
    <% } } } %>
</body>
</html>