<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Barï¼ | æå¡ä¸­å¿</title>
    <link rel="icon" type="image" href="img/icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/member.css">
</head>

<nav>
    <!--Logo-->
    <div class="logo"><a href="index.html"><img src="img/logo.png" alt="logo"></a></div>
    <!--ç¢ååé¡-->
    <!--åèè³æï¼https://www.astralweb.com.tw/pure-css-drop-down-menu/-->
    <ul class="product">ç¢ååé¡&equiv;
        <ul class="dropdown-menu">
            <li><a href="product.html">ææ</a></li>
            <li><a href="product.html">ææ</a></li>
            <li><a href="product.html">æ¸ç</a></li>
            <li><a href="product.html">ç§å¹»</a></li>
        </ul>
    </ul>
    <!--éæ¼æå-->
    <div class="aboutus"><a href="about_team.html">éæ¼æå</a></div>
    <!--æå¡ä¸­å¿-->
    <div class="mem-center"><a href="member.html">æå¡ä¸­å¿</a></div>
    <div class="nav_img">
        <!--æå¡ç»å¥/æå¡è³æ-->
        <a href="login.html"><img src="img/member.png" alt="member"></a>
        <!--è³¼ç©è»-->
        <a href="cart.html"><img src="img/cart.png" alt="cart"></a>
        
    </div>
    <input type="search" id="search" placeholder="Search for something...">
    <!--æå°-->
    <input type="image" name="submit_Btn" id="submit_Btn" img src="img/search.png" onClick="" >
</nav>

<body>
    <div class="sec">
        <h1>æå¡è³æ</h1>
        <hr>
        <div class="revise">
            <form action="#">
                <label for="name">å§å</label>
                <input type="text" name="member-name" id="name" placeholder="User123"><br>
                <label for="bday">çæ¥</label>
                <input type="text" name="birth" id="bday" placeholder="2002-11-01"><br>
                <label for="gender">æ§å¥</label>
                <input type="text" name="gender" id="gender" value="ç·" readonly><br>
                <label for="tel">é»è©±</label>
                <input type="text" name="tel" id="tel" placeholder="0912345678"><br>
                <label for="city">ç¸£å¸</label>
                <input type="text" name="city" id="city" placeholder="æ¡åå¸"><br>
                <label for="city">éé®å</label>
                <input type="text" name="district" id="district" placeholder="ä¸­å£¢å"><br>
                <label for="addr">å°å</label>
                <input type="text" name="addr" id="addr" placeholder="320æ¡åå¸ä¸­å£¢åä¸­åè·¯200è"><br>
                <label for="email">éµç®±</label>
                <input type="text" name="member-email" id="email" value="user123@gmail.com" readonly><br>
                <label for="password">å¯ç¢¼</label>
                <input type="password" name="member-password" id="psw" value="abc123" readonly><br>
                <input type="button" value="ä¿®æ¹" id="revise_btn" onclick="location.href='#revisee'">
            </form>
        </div>
    </div>

    <div class="sec">
        <h1>è¨å®è¨é</h1>
        <hr>
        <table>
            <tr>
                <td>ç¢ååç</td>
                <td>ç¢ååç¨±</td>
                <td>å®å¹</td>
                <td>æ¸é</td>
                <td>å°è¨</td>
            </tr>
            <tr>
                <td><img src="img/horry/horry01.jpg" alt=""></td>
                <td>æ¨ä¸çæ¿å®¢</td>
                <td>$260</td>
                <td>2</td>
                <td>$520</td>
            </tr>
            <tr>
                <td><img src="img/love/love01.jpg" alt=""></td>
                <td>åæ­¡ä½ çæ¥å­åæµ·</td>
                <td>$252</td>
                <td>1</td>
                <td>$252</td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td>ç¸½è¨ï¼</td>
                <td>$772</td>
            </tr>
        </table>
    </div>

    <div class="sec">
        <table>
            <tr>
                <td>ç¢ååç</td>
                <td>æé</td>
                <td>ç¢ååç¨±</td>
                <td>è©è«å§å®¹</td>
            </tr>
            <tr>
                <td><img src="img/fantasy/fantasy02.jpg" alt=""></td>
                <td>2023/5/30 10:48</td>
                <td>è¯é¾ä¹å®®</td>
                <td>
                    â­â­â­â­â­<br>
                    éæ¬æ¸è¶ç´å¥½ççå~~
                </td>
            </tr>
            <tr>
                <td><img src="img/suspense/suspense03.jpg" alt=""></td>
                <td>2023/5/20 21:17</td>
                <td>ä¸åé½ä¸ç</td>
                <td>
                    â­â­â­â­â­<br>
                    åæ­¡!
                </td>
            </tr>
            <tr>
                <td><img src="img/fantasy/fantasy05.jpg" alt=""></td>
                <td>2023/4/1 17:28</td>
                <td>éé­ç©¿è¶æç¨¿</td>
                <td>
                    â­â­â­â­<br>
                    å¥½ç~ä½æ¯ä¸æ¯æçè!
                </td>
            </tr>
        </table>
    </div>
    
    <footer>
        Copyright Â© 2023 all rights reserved<br>
        çè¦½äººæ¸ï¼
    </footer>
</body>
</html>