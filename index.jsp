<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="setsql.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.stream.Collectors" %>
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
        <% 
            boolean loggedIn1 = false;
            if (session != null && session.getAttribute("loggedIn") != null) {
                loggedIn1 = (Boolean) session.getAttribute("loggedIn");
            }

            if(loggedIn1){
                String userId=(String)session.getAttribute("userId");
                sql="SELECT * FROM `click` WHERE `member_id`= '" + userId + "'";
                rs=con.createStatement().executeQuery(sql);
                int horry_count=0;
                int love_count=0;
                int suspense_count=0;
                int fantasy_count=0;
                if(rs.next()){
                    horry_count=Integer.parseInt(rs.getString("horry_count"));
                    love_count=Integer.parseInt(rs.getString("love_count"));
                    suspense_count=Integer.parseInt(rs.getString("suspense_count"));
                    fantasy_count=Integer.parseInt(rs.getString("fantasy_count"));
                }

                List<String> category =new ArrayList<String>();
                if(fantasy_count==0 && love_count==0 && suspense_count==0 && fantasy_count==0){
                    category.add("全");
                }else{
                    if(horry_count>=love_count && horry_count>=suspense_count && horry_count>=fantasy_count){
                        category.add("恐怖");
                    }
                    if(love_count>=horry_count && love_count>=suspense_count && love_count>=fantasy_count){
                        category.add("愛情");
                    }
                    if(suspense_count>=horry_count && suspense_count>=love_count && suspense_count>=fantasy_count){
                        category.add("懸疑");
                    }
                    if(fantasy_count>=horry_count && fantasy_count>=love_count && fantasy_count>=suspense_count){
                        category.add("科幻");
                    }
                }

                Collections.shuffle(category);
                List<String> random_category = category.subList(0, 1);
                String joined_category = String.join("", random_category);
                List<Integer> ad =new ArrayList<Integer>();
                sql = "select * from ads where `category` = '"+joined_category+"'";
                rs=con.createStatement().executeQuery(sql);
                while(rs.next()){
                    ad.add(Integer.parseInt(rs.getString("ad_id")));
                }
                Collections.shuffle(ad);
                List<Integer> random_ad = ad.subList(0, 1);
                List<String> stringAdList = new ArrayList<>();
                for (Integer adId : random_ad) {
                    stringAdList.add(adId.toString());
                }
                String joinedAd = String.join("", stringAdList);

                sql="SELECT * FROM `ads` WHERE `ad_id`= '" + joinedAd + "'";
                rs=con.createStatement().executeQuery(sql);
                while(rs.next()){
                    out.print("var floatAdImg = \""+rs.getString("img")+"\";");
                }

            }
            else{
                List<String> ad =new ArrayList<String>();
                sql = "select * from ads";
                rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
                while(rs.next()){
                   ad.add(rs.getString("img"));
                }
                Collections.shuffle(ad);
                List<String> random_ad = ad.subList(0, 1);
                String joinedAd = String.join("", random_ad);
                out.print("var floatAdImg = \""+joinedAd+"\";");
            }
        %>


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
          <a href="horry.jsp"><img src="img/slideshow/1.png" style="width:100%"></a>
        </div>
        
        <div class="mySlides fade">
          <a href="love.jsp"><img src="img/slideshow/2.png" style="width:100%"></a>
        </div>
        
        <div class="mySlides fade">
          <a href="book.jsp?number=14"><img src="img/slideshow/3.png" style="width:100%"></a>
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
        <section class="sec_timeline" style="height: auto;">
            <div class="timeline" style="height: auto;">
<%
            sql="select * from products order by sale desc limit 4";
            rs=con.createStatement().executeQuery(sql);
            int n=0;
            while(rs.next()){
                n++;
                if(n%2==1){
%>
                    <div class="container left" >
                        <div class="content timecard" style="height: auto;">
                            <h2 class="book"><%=rs.getString(3)%></h2>
                            <p  style="height: auto;"><%=rs.getString(8)%></p>
                            <a href="book.jsp?number=<%=rs.getString(1)%>">Read more~</a>
                            <div class="bookimg"><img class="timepicture" src="img/<%=rs.getString(9)%>"  ></div>
                        </div>
                    </div>
<%

                }
                if(n%2==0){
%>
                    <div class="container right">
                        <div class="content timecard" style="height: auto;">
                            <h2 class="book"><%=rs.getString(3)%></h2>
                            <p style="height: auto;"><%=rs.getString(8)%></p>
                            <a href="book.jsp?number=<%=rs.getString(1)%>">Read more~</a>
                            <div class="bookimg"><img class="timepicture"  src="img/<%=rs.getString(9)%>"></a></div>
                        </div>
                    </div>
<%

                }
            }
%>
               
                
            </div>
        </section>
        <%
            con.close();
        %>
        <!--footer-->
        <%@ include file="footer.jsp"%>

        <script src="js/main.js"></script>

</body>
</html>