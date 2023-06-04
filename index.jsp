<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>看Bar！</title>
    <link rel="icon" type="image" href="img/icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <script>
        // JavaScript Document
        //浮動廣告圖片
        var floatAdImg = "img/ads/1.png";

        //浮動廣告
        document.writeln("<div id=\"floatAd\" style=\" position:fixed !important; position:absolute; _top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight)); z-index: 2147483647; left: 50%; margin-left: -400px !important; top: 50%; margin-top: -240px !important; background:url("+floatAdImg+") no-repeat; width:800px; height:500px; cursor:pointer; display:none; \">");
        document.writeln("<div onclick=\"closeFAd();\" style=\" width:60px; height:60px; float:right;\"></div>");
        document.writeln("<div style=\"width:800px; height:500px; float:right;\" onclick=\"open_online();\"></div>");
        document.writeln("</div>");

        //關閉浮動廣告
        function closeFAd()
        {
        document.getElementById('floatAd').style.display = 'none';
        }
        //開啟浮動廣告
        function showFAd()
        {
        document.getElementById('floatAd').style.display = 'block';
        }

        //開啟視窗  秒僅執行一次
        setTimeout(showFAd,100);
    </script>    
</head>

<%@ include file="nav.jsp"%>

<body>
    <!--動態廣告-->
    <!--參考資料：https://www.w3schools.com/howto/howto_js_slideshow.asp-->
    <div class="slideshow-container">

        <div class="mySlides fade">
          <img src="img/slideshow/1.png" style="width:100%">
        </div>
        
        <div class="mySlides fade">
          <img src="img/slideshow/2.png" style="width:100%">
        </div>
        
        <div class="mySlides fade">
          <img src="img/slideshow/3.png" style="width:100%">
        </div>
        
        <a class="prev" onclick="plusSlides(-1)">❮</a>
        <a class="next" onclick="plusSlides(1)">❯</a>
        
        </div>
        <br>
        
        <div style="text-align:center">
          <span class="dot" onclick="currentSlide(1)"></span> 
          <span class="dot" onclick="currentSlide(2)"></span> 
          <span class="dot" onclick="currentSlide(3)"></span> 
        </div>

        <!--類別推薦-->
        <!--參考資料：https://xuan891102.github.io/resume/-->
        <h1>熱門商品</h1>
        <section class="sec_timeline">
            <div class="timeline">
                <div class="container left">
                    <div class="content timecard ">
                        <h2 class="book">書名</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Corporis provident ducimus nulla officiis, delectus ea repellat! Alias, asperiores eligendi. Error saepe quam blanditiis numquam, eos veritatis sed maxime corrupti. Aut!
                        Explicabo, labore expedita architecto eum odit animi. Voluptas culpa vel impedit unde, inventore a tenetur necessitatibus accusamus fugiat ea ex nisi. Harum, rem? Blanditiis sequi exercitationem officia, dolorum tempora iure?
                        Velit aperiam cum aliquid facere adipisci iste dolor quasi eius quas, inventore ea eveniet magni perferendis consequuntur accusamus modi eligendi fuga unde voluptate. Sed, voluptates accusamus! Dolores reiciendis consequuntur autem.
                        Repudiandae, laboriosam culpa deleniti delectus reiciendis porro adipisci? Inventore harum facere dicta voluptatibus reprehenderit atque nostrum quos consequatur pariatur laudantium. Ea iusto officiis illo voluptate quo exercitationem ad, quos saepe.
                        Placeat, ipsam dolorum odit id nostrum dolore doloribus ad, hic nihil minima eaque facilis repudiandae optio fuga, sapiente delectus vero temporibus unde quis numquam iure quibusdam. Sit iste magni sint.</p>
                        <a href="book.html">Read more~</a>
                        <div class="bookimg"><img class="timepicture" src="img/horry/horry01.jpg"  ></div>
                    </div>
                </div>
                <div class="container right">
                    <div class="content timecard">
                        <h2 class="book">書名</h2>
                        <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Aliquid voluptatum quis autem obcaecati libero asperiores qui ad quibusdam laborum? Cupiditate facilis cum impedit vel laboriosam repellat possimus eveniet odit id?</p>
                        <a href="book.html">Read more~</a>
                        <div class="bookimg"><img  class="timepicture" src="img/love/love01.jpg"></a></div>
                    </div>
                </div>
                <div class="container left">
                    <div class="content timecard ">
                        <h2 class="book">書名</h2>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ab dolorem perspiciatis aut doloribus, sequi voluptatibus. At iusto modi sit reprehenderit quibusdam officia non, vero quos eaque temporibus! Libero, officia dolore.</p>
                        <a href="book.html">Read more~</a>
                        <div class="bookimg"><img class="timepicture" src="img/suspense/suspense01.jpg"></div>
                    </div>
                </div>
                <div class="container right">
                    <div class="content timecard ">
                        <h2 class="book">書名</h2>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur vero exercitationem ad ipsum totam quasi mollitia hic culpa qui! Veniam delectus ab deleniti, explicabo minima sint iusto asperiores similique fugit.</p>
                        <a href="book.html">Read more~</a>
                        <div class="bookimg"><img class="timepicture"  src="img/fantasy/fantasy01.jpg"></a></div>
                    </div>
                </div>
            </div>
        </section>

        <!--footer-->
        <%@ include file="footer.jsp"%>

        <script src="js/main.js"></script>

</body>
</html>