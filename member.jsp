<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bar！ | 會員中心</title>
    <link rel="icon" type="image" href="img/icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/member.css">
</head>

<%@ include file="nav.jsp"%>

<body>
    <div class="sec">
        <h1>會員資料</h1>
        <hr>
        <div class="revise">
            <form action="#" method="post">
                <label for="name">姓　名：</label>
                <input type="text" name="member-name" id="name" placeholder="User123"><br>
                <label for="bday">生　日：</label>
                <input type="text" name="birth" id="bday" placeholder="2002-11-01"><br>
                <label for="gender">性　別：</label>
                <input type="text" name="gender" id="gender" value="男" readonly><br>
                <label for="tel">電　話：</label>
                <input type="text" name="tel" id="tel" placeholder="0912345678"><br>
                <label for="city">縣　市：</label>
                <input type="text" name="city" id="city" placeholder="桃園市"><br>
                <label for="city">鄉鎮區：</label>
                <input type="text" name="district" id="district" placeholder="中壢區"><br>
                <label for="addr">地　址：</label>
                <input type="text" name="addr" id="addr" placeholder="320桃園市中壢區中北路200號"><br>
                <label for="email">郵　箱：</label>
                <input type="text" name="member-email" id="email" value="user123@gmail.com" readonly><br>
                <label for="password">密　碼：</label>
                <input type="password" name="member-password" id="psw" value="abc123" readonly><br>
                <input type="button" value="修改" id="revise_btn" onclick="location.href='#revisee'">
            </form>
        </div>
    </div>

    <div class="sec">
        <h1>訂單記錄</h1>
        <hr>
        <table>
            <tr>
                <td>產品圖片</td>
                <td>產品名稱</td>
                <td>單價</td>
                <td>數量</td>
                <td>小計</td>
            </tr>
            <tr>
                <td><img src="img/horry/horry01.jpg" alt=""></td>
                <td>樓下的房客</td>
                <td>$260</td>
                <td>2</td>
                <td>$520</td>
            </tr>
            <tr>
                <td><img src="img/love/love01.jpg" alt=""></td>
                <td>喜歡你的日子像海</td>
                <td>$252</td>
                <td>1</td>
                <td>$252</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td>總計：</td>
                <td>$772</td>
            </tr>
        </table>
    </div>

    <div class="sec">
        <h1>評論紀錄</h1>
        <hr>
        <table>
            <tr>
                <td>產品圖片</td>
                <td>時間</td>
                <td>產品名稱</td>
                <td>評論內容</td>
            </tr>
            <tr>
                <td><img src="img/fantasy/fantasy02.jpg" alt=""></td>
                <td>2023/5/30 10:48</td>
                <td>華龍之宮</td>
                <td>
                    ⭐⭐⭐⭐⭐<br>
                    這本書超級好看的喔~~
                </td>
            </tr>
            <tr>
                <td><img src="img/suspense/suspense03.jpg" alt=""></td>
                <td>2023/5/20 21:17</td>
                <td>一個都不留</td>
                <td>
                    ⭐⭐⭐⭐⭐<br>
                    喜歡!
                </td>
            </tr>
            <tr>
                <td><img src="img/fantasy/fantasy05.jpg" alt=""></td>
                <td>2023/4/1 17:28</td>
                <td>靈魂穿越手稿</td>
                <td>
                    ⭐⭐⭐⭐<br>
                    好看~但是不是我的菜!
                </td>
            </tr>
        </table>
    </div>
    
    <%@ include file="footer.jsp"%>
</body>
</html>