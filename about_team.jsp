<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>看Bar！關於我們</title>
    <link rel="icon" type="image" href="img/icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/about_team.css">
</head>

<%@ include file = "nav.jsp"%>
<%@ include file = "setsql.jsp" %>
<%
  sql = "select * from `about`";
  rs = con.createStatement().executeQuery(sql);
%>
<body>
    <h1>團隊成員</h1>
    <!--翻書-->
    <div class="container_team">
    <%  while( rs.next() ) { %>
        <div class="card">
          <div class="imgBox">
            <img src="img/profilepic/<%= rs.getInt(1) %>.jpg" width="300" height="400" />
          </div>
          <div class="contents">
            <h2><%= rs.getString(2) %></h2>
            <p><%= rs.getString(3) %></p>
          </div>
        </div>
  <% } %>


      <main>
        <article>
          <!--品牌介紹-->
          <section class="brand_introduction">
            <div class="brand_text">品牌介紹</div>
            <hr>

            <div class="brand_text2">
              你是否有在書海中遨遊過？你知道捧著一本書找到一個角落靜下心來閱讀會是什麼樣的感受嗎？不妨在我們這裡逛逛看看！<br>
              我們希望大家在看書的同時，能像身處在Bar一樣放鬆和快樂，我們整體的配色會是想在Bar裡，走一個暗黑系的色調，讓人有種在高級環境看書的感覺，讓看書成為一種看書是一種高級的享受。<br>
              不只酒精飲料可以醉人心，閱讀更是令人沉醉！
            </div>

          </section>

          <!--地圖-->
          <div class="brand_text">中原大學</div>
          <section class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3617.256606068759!2d121.23601279678955!3d24.957382700000014!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3468221447a0f021%3A0x2b86d2650bb8bcff!2z5Lit5Y6f5aSn5a24!5e0!3m2!1szh-TW!2stw!4v1684578114618!5m2!1szh-TW!2stw" width="1000px" height="500" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
          </section>
          <div class="brand_text">電話：03-265-9999</div>


        </article>
      </main>

      <!--footer-->
      <%@ include file="footer.jsp"%>

      <script src="js/main.js"></script>

    
</body>
</html>