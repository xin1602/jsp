<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bar！ | 商品頁</title>
    <link rel="icon" type="image" href="img/icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/book.css">
    <link rel="stylesheet" href="css/main.css">
    <script>
        function minus(num) {
            var number = Number(document.getElementsByClassName("input_num")[num].value);
            if (number > 1) {
                document.getElementsByClassName("input_num")[num].value = number - 1;
            }
        }
        function add(num) {
            var number = Number(document.getElementsByClassName("input_num")[num].value);
            if (number < 100) {
                document.getElementsByClassName("input_num")[num].value = number + 1;
            }
        }
    </script>
</head>

<%@ include file="nav.jsp"%>

<body>
    <div class="array1">
        <div class="array2">
            <div class="img">
                <img src="img/fantasy/fantasy03.jpg" >
            </div>
            <div class="c">
                <div class="area"><h1><b>魔法道具博物館</b></h1></div>
                <div class="introduce">
                    <br>作者： 皮耶爾多梅尼克．巴卡拉里奧, 雅各．奧利維力</br>
                    <br>出版社：楓樹林出版社 </br>
                    <br>出版日期：2022/08/26</br>
                    <br>優惠價：239元</br>
                    <br>庫存：100</br>
                
                    <div class="shopping">
                        <input type="button" value="-" class="btn minus" onclick="minus(0)">
                        <input type="text" value="1" class="input_num" readonly>
                        <input type="button" value="+" class="btn add" onclick="add(0)"></br>
                        <a href="cart.html"><button class="button_shop cart">加入購物車</button></a>
                        <a href="check.html"><button class="button_shop purchase">直接購買</button></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
    <br>
    <hr class="sep">
    <div class="word">
        <br>～歡迎光臨魔法道具博物館～</br>
        <br>根據「魔法名著」史料級的珍貴寶器大公開</br>
        <br>★【哈利波特】分類帽</br>
        <br>★【人魚公主】深海女巫魔藥</br>
        <br>★【雷神索爾】雷神之鎚妙爾尼爾</br>
        <br>★【白雪公主】壞皇后的魔鏡</br>

        <br>詩人保羅．瓦勒里（Paul Valéry）認為人類會藉由外在來認識彼此，</br>
        <br>但是內心不為人知的那一面，其實每個人都大同小異──我可不這麼認為。</br>

        <br>能穿越到納尼亞王國的「魔衣櫥」中，</br>
        <br>掛有一間橫行無阻的「隱形斗篷」；</br>
        <br>梳妝臺前有一面從不說謊而惹來殺生之禍的「魔鏡」;</br>
        <br>廚房餐桌上擺著打敗巨人的「傑克魔豆」和使白雪公主沉睡的「毒蘋果」；</br>
        <br>雜物間擺有雷神索爾那把力大無窮的「妙爾尼爾」法槌。</br>


    </div>

    <div class="comment">
        <h1>留言區</h1>
        <hr>
        <div class="QAQ">
            <div class="flex_center">
                <img src="https://picsum.photos/100" alt="" class="cmt_pro">
                <div class="overstar">★★★☆☆</div>
            </div>
            <div class="comment_text">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Minus officia quaerat amet, eum impedit enim nam praesentium architecto dolore sint! Laborum assumenda reprehenderit, quidem cum nostrum eveniet facere autem velit!</div>
        </div>
        <hr>
        <div class="QAQ">
            <div class="flex_center">
                <img src="https://picsum.photos/100" alt="" class="cmt_pro">
                <div class="overstar">★★★★☆</div>
            </div>
            <div class="comment_text">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Minus officia quaerat amet, eum impedit enim nam praesentium architecto dolore sint! Laborum assumenda reprehenderit, quidem cum nostrum eveniet facere autem velit!</div>
        </div>
        <hr>
        <div class="stars">
            <input type="radio" name="star" id="star1" hidden />
            <label for="star1"></label>
    
            <input type="radio" name="star" id="star2" hidden />
            <label for="star2"></label>
    
            <input type="radio" name="star" id="star3" hidden />
            <label for="star3"></label>
    
            <input type="radio" name="star" id="star4" hidden />
            <label for="star4"></label>
    
            <input type="radio" name="star" id="star5" hidden />
            <label for="star5"></label>
        </div>
        <textarea name="" id="" cols="30" rows="10" class="write" placeholder="留下評論及評分吧！"></textarea>
        <input type="submit" value="確認" id="send">
    </div>
    <div class="book">
        <p>推薦商品</p>
        <div class="image">
            <div class="recom">
                <img src="img/fantasy/fantasy06.jpg">
                <p>這裡可以放八個字</p>
            </div>
            <div class="recom">
                <img src="img/fantasy/fantasy05.jpg">
                <p>書</p>
            </div>
            <div class="recom">
                <img src="img/fantasy/fantasy04.jpg">
                <p>書</p>
            </div>
            <div class="recom">
                <img src="img/fantasy/fantasy07.jpg">
                <p>書</p>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp"%>

</body>
</html>