<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    
    sql="select count(*) from `board` where `product_id` = ?";
    stmt = con.prepareStatement(sql);
    stmt.setString(1,number);
    rs=stmt.executeQuery();
    String star="★";
    while(rs.next()){
        int comment_number=rs.getInt(1);
        if(comment_number==0){
%>
<!-- 顯示留言區塊 -->
<div class="comment">
    <h1>留言區</h1>
    <hr>
    <div class="QAQ">
        <div class="flex_center">
        </div>
        <div class="comment_text">目前還沒有評論！成為第一個留言的人類吧～</div>
    </div>
    <hr>
    <form action="add_comment_to_board.jsp" method="get" name="add_comment_to_board">
    <div class="sendcmt">
        <div class="stars">
            <input type="radio" name="star_number" id="star1" value="5" hidden />
            <label for="star1"></label>
            <input type="radio" name="star_number" id="star2" value="4" hidden />
            <label for="star2"></label>
            <input type="radio" name="star_number" id="star3" value="3" hidden />
            <label for="star3"></label>
            <input type="radio" name="star_number" id="star4" value="2" hidden />
            <label for="star4"></label>
            <input type="radio" name="star_number" id="star5" value="1" hidden />
            <label for="star5"></label>
        </div>
        <textarea name="comment" id="" cols="30" rows="10" class="write" placeholder="留下評論及評分吧！"></textarea>
        <input type="submit" value="送出" id="send">
    </div>
    </form>
</div>
<%
    }
    else{
        sql="select * from `board` where `product_id`= ? order by `comments_date` desc";
        stmt=con.prepareStatement(sql);
        stmt.setString(1,number);
        rs=stmt.executeQuery();
%>
        <div class="comment">
            <h1>留言區</h1>
            <hr>
<%
        while(rs.next()){
%>
            <div class="QAQ">
                <div class="flex_center">
                    <img src="img/board_people.jpeg" alt="" class="cmt_pro" style="height: 20%;">
                    <div class="overstar"><% for(int i=1 ; i<=rs.getInt(4); i++){ %><%=star%><% } %></div>
                </div>
                <div class="comment_text"><%=rs.getString(5)%></div>
                <div class="comment_text" style="text-align: right;">留言時間：<%=rs.getString(6)%></div>
            </div>
            <hr>
<%
        }
        //輸入留言區塊       
%>
    <form action="add_comment_to_board.jsp" method="get" name="add_comment_to_board">   
        <div class="sendcmt">
            <div class="stars">
            <input type="radio" name="star_number" id="star1" value="5" hidden />
            <label for="star1"></label>
            <input type="radio" name="star_number" id="star2" value="4" hidden />
            <label for="star2"></label>
            <input type="radio" name="star_number" id="star3" value="3" hidden />
            <label for="star3"></label>
            <input type="radio" name="star_number" id="star4" value="2" hidden />
            <label for="star4"></label>
            <input type="radio" name="star_number" id="star5" value="1" hidden />
            <label for="star5"></label>
            </div>
            <textarea name="comment" id="" cols="30" rows="10" class="write" placeholder="留下評論及評分吧！"></textarea>
            <input type="submit" value="送出" id="send">
        </div>
    </form>
</div>
<%
}
}

%>
