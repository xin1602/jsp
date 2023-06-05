<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>後台|上架</title>
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
    <p>產品上架</p>
    <form action="add_product.jsp" method="post" name="add_product">
        <table class="m_shelves">
            <tr>
                <td class="m_text">
                    產品名稱
                </td>
                <td class="m_text">
                    <input type="text" name="ProductName" value="">
                </td>
            </tr>

            <tr>
                <td class="m_text">
                    產品類型
                </td>
                <td class="m_text">
                    <select name="ProductType">
                        <option value="恐怖">&nbsp恐怖&nbsp</option>
                        <option value="愛情">&nbsp愛情&nbsp</option>
                        <option value="懸疑">&nbsp懸疑&nbsp</option>
                        <option value="科幻">&nbsp科幻&nbsp</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td class="m_text">
                    作者
                </td>
                <td class="m_text">
                    <input type="text" name="ProductAuthor" value="">
                </td>
            </tr>

            <tr>
                <td class="m_text">
                    出版社
                </td>
                <td class="m_text">
                    <input type="text" name="ProductPublishingHouse" value="">
                </td>
            </tr>

            <tr>
                <td class="m_text">
                    出版日期
                </td>
                <td class="m_text">
                    <input type="date" name="ProductPublishingDate" value="">
                </td>
            </tr>

            <tr>
                <td class="m_text">
                    ISBN
                </td>
                <td class="m_text">
                    <input type="text" name="ProductISBN" value="">
                </td>
            </tr>

            <tr>
                <td class="m_text">
                    產品價格
                </td>
                <td class="m_text">
                    NT$ : <input class="m_text2" type="text" name="ProductPrice" value="">
                </td>
            </tr>

            <tr>
                <td class="m_text">
                    庫存數量
                </td>
                <td class="m_text">
                    <input class="m_text2" type="text" name="ProductQuantity" value="">本
                </td>
            </tr>

            <tr>
                <td class="m_text">
                    產品介紹
                </td>
                <td class="m_text">
                    <textarea name="ProductInfo" rows="13" cols="50" placeholder="輸入直接換行即可"></textarea>
                </td>
            </tr>

            <tr>
                <td class="m_text">
                    產品圖片
                </td>
                <td class="m_text">
                    <input type="file" name="ProductPhoto" id="pro_photo">
                </td>
            </tr>
            <tr>
                <td class="m_text" colspan="2">
                    <input class="submit_text" type="submit" value="上架商品">
                </td>
            </tr>
        </table>



    </form>
    
</body>
</html>