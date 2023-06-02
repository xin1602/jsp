<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <tr>
                <td><img src="https://picsum.photos/400" class="tdimg"></td>
                <td>這裡可以放八個字</td>
                <td>NT$290</td>
                <td>1</td>
                <td>NT$290</td>
            </tr>
            <tr>
                <td><img src="https://picsum.photos/400" class="tdimg"></td>
                <td>《昆虫记》</td>
                <td>NT$240</td>
                <td>1</td>
                <td>NT$240</td>
            </tr>
            <tr>
                <td><img src="https://picsum.photos/400" class="tdimg"></td>
                <td>一本書</td>
                <td>NT$300</td>
                <td>1</td>
                <td>NT$300</td>
            </tr>
            <tr>
                <td>總計：</td>
                <td></td>
                <td></td>
                <td></td>
                <td>NT$830</td>
            </tr>
        </table>
    </div>
    <div class="info">
        <h1>購買表單</h1>
        <hr>
        <div class="purchase">
            <form action="#" method="post">
                <label for="name">姓　　名：</label>
                <input type="text" id="name"><br>
                <label for="phone">連絡電話：</label>
                <input type="text" id="phone"><br>
                <label for="email">電子信箱：</label>
                <input type="email" id="email"><br>
                <label for="payment">付款方式：</label>
                <select name="payment" id="payment">
                    <option selected="selected">貨到付款</option>
                </select><br>
                <label for="address">收件地址：</label>
                <input type="text" id="address"><br>
                <button type="submit" id="enter" onclick="location.href='index.html'">確認送出</button>
            </form>
        </div>
    </div>

    <!--footer-->
    <%@ include file="footer.jsp"%>

</body>
</html>