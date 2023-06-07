<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<div class="book">
    <p>推薦商品</p>
    <div class="image">

<%
    //讀取總共有幾本書
    sql="select count(*) from `products`";
    rs=con.createStatement().executeQuery(sql);
    int n=0;
    Random rand=new Random();
    while(rs.next()){
        n=rs.getInt(1);
    }

    //如果使用者有登入
    if(loggedIn){

        //讀取click資料
        sql = "select * from `click` where `member_id`='" + session.getAttribute("userId") + "'";
        rs=con.createStatement().executeQuery(sql);
        while(rs.next()){
            int horry_click=Integer.parseInt(rs.getString(2));
            int love_click=Integer.parseInt(rs.getString(3));
            int suspense_click=Integer.parseInt(rs.getString(4));
            int fantasy_click=Integer.parseInt(rs.getString(5));

            //存入ArrayList判斷為哪種類型最高(BubbleSort)
            ArrayList<Integer> click = new ArrayList<Integer>();
            click.add(horry_click);
            click.add(love_click);
            click.add(suspense_click);
            click.add(fantasy_click);
            for (int i = 0; i < click.size(); i++) {
                for (int j = 0; j < click.size() - i - 1; j++) {
                    if (click.get(j) > click.get(j + 1)) {
                        int a = click.get(j);
                        click.set(j, click.get(j + 1));
                        click.set(j + 1, a);
                    }
                }
            }

            //設定最高點閱率類別
            int[] category_click={horry_click,love_click,suspense_click,fantasy_click};
            for(int i=0; i< category_click.length ; i++){
                    if(click.get(3)==category_click[i]){
                        if(i==0){
                            session.setAttribute("category","恐怖");
                        }
                        else if(i==1){
                            session.setAttribute("category","愛情");
                        }
                        else if(i==2){
                            session.setAttribute("category","懸疑");
                        }
                        else{
                            session.setAttribute("category","科幻");
                        }
                    }
            }
                        int bookNumber=0;
                        while(bookNumber < 4){
                        String category = (String) session.getAttribute("category");
                        sql = "select * from `products` where `category` = '" + category + "' && `product_id` = '" + (rand.nextInt(n) + 1) + "'";
                        rs=con.createStatement().executeQuery(sql);
                        while(rs.next()){
                            bookNumber++;

%>
                                <div class="recom">
                                    <a href="book.jsp?number=<%=rs.getString(1)%>">
                                        <img src="img/<%=rs.getString(9)%>">
                                    </a>
                                    <p><%=rs.getString(3)%></p>
                                </div>
<%
                        }
                    
            }
        }   
    } 
    //如果沒有使用者登入
    else{
        //抓取總點閱存入ArrayList判斷為哪種類型最高(BubbleSort)
        sql="select sum(`horry_count`) from `click`";
        ResultSet rsHS=con.createStatement().executeQuery(sql);
        rsHS.next();
        session.setAttribute("sum_horry_count", rsHS.getString(1));

        sql="select sum(`love_count`) from `click`";
        ResultSet rsLS=con.createStatement().executeQuery(sql);
        rsLS.next();
        session.setAttribute("sum_love_count",rsLS.getString(1));

        sql="select sum(`suspense_count`) from `click`";
        ResultSet rsSS=con.createStatement().executeQuery(sql);
        rsSS.next();
        session.setAttribute("sum_suspense_count",rsSS.getString(1));

        sql="select sum(`fantasy_count`) from `click`;";
        ResultSet rsFS=con.createStatement().executeQuery(sql);
        rsFS.next();
        session.setAttribute("sum_fantasy_count",rsFS.getString(1));
        
            int horry_click=Integer.parseInt((String)session.getAttribute("sum_horry_count"));
            int love_click=Integer.parseInt((String)session.getAttribute("sum_love_count"));
            int suspense_click=Integer.parseInt((String)session.getAttribute("sum_suspense_count"));
            int fantasy_click=Integer.parseInt((String)session.getAttribute("sum_fantasy_count")); 
            out.print(horry_click+love_click+suspense_click+fantasy_click);
            ArrayList<Integer> click = new ArrayList<Integer>();
            click.add(horry_click);
            click.add(love_click);
            click.add(suspense_click);
            click.add(fantasy_click);
            for (int i = 0; i < click.size(); i++) {
                for (int j = 0; j < click.size() - i - 1; j++) {
                    if (click.get(j) > click.get(j + 1)) {
                        int a = click.get(j);
                        click.set(j, click.get(j + 1));
                        click.set(j + 1, a);
                    }
                }
            }
            //設定最高點閱率類別
            int[] category_click={horry_click,love_click,suspense_click,fantasy_click};
            for(int i=0; i< category_click.length ; i++){
                    if(click.get(3)==category_click[i]){
                        if(i==0){
                            session.setAttribute("category","恐怖");
                        }
                        else if(i==1){
                            session.setAttribute("category","愛情");
                        }
                        else if(i==2){
                            session.setAttribute("category","懸疑");
                        }
                        else{
                            session.setAttribute("category","科幻");
                        }
                    }
            }
            int bookNumber=0;
            while(bookNumber < 4){
                String category = (String) session.getAttribute("category");
                sql = "select * from `products` where `category` = '" + category + "' && `product_id` = '" + (rand.nextInt(n) + 1) + "'";
                rs=con.createStatement().executeQuery(sql);
                while(rs.next()){
                    bookNumber++;
%>
                    <div class="recom">
                        <a href="book.jsp?number=<%=rs.getString(1)%>">
                            <img src="img/<%=rs.getString(9)%>">
                        </a>
                        <p><%=rs.getString(3)%></p>
                    </div>  
<%
    } }  }
%>
    </div>
</div>



