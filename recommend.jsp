<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>

<div class="book">
    <p>推薦商品</p>
    <div class="image">

<%
    if(loggedIn){

        //讀取總共有幾本書
        sql="select count(*) from `products`";
        rs=con.createStatement().executeQuery(sql);
        int n=0;
        Random rand=new Random();
        while(rs.next()){
            n=rs.getInt(1);
        }

        //讀取click資料
        sql = "select * from `click` where `member_id`='" + session.getAttribute("userId") + "'";
        rs=con.createStatement().executeQuery(sql);
        while(rs.next()){
            int horry_click=Integer.parseInt(rs.getString(2));
            int love_click=rs.getInt(3);
            int suspense_click=rs.getInt(4);
            int fantasy_click=rs.getInt(5);

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
%>
    </div>
</div>



