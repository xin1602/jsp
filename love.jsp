<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import = "java.sql.*,java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bar！ | 產品總覽</title>
    <link rel="icon" type="image" href="img/icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/product.css">
</head>

<%@ include file="nav.jsp"%>

<body>
    <h1><u>愛情</u></h1>
    <table>
    <%@ include file="setsql.jsp"%>
    <% 
            sql="select count(*) from `products` where `category` = '愛情'";
            rs=con.createStatement().executeQuery(sql);
            int n;
            
            //先讀取總共有幾本，在讀取每一筆書的紀錄
            while(rs.next()){
                n=rs.getInt(1);
                int i=0;
                sql="select * from `products` where `category` = '愛情'";
                rs=con.createStatement().executeQuery(sql);
                while(rs.next()){
                    i++;
                    if(i<=n){
                        if(i%4==1){   %>
                            <tr>
                            <td><a href='book.jsp?number=<%=rs.getString(1)%>'><img src='img/<%=rs.getString(9)%>' alt='<%=rs.getString(3)%>'><br><%=rs.getString(3)%></a></td>
                <%      }
                        else if(i%4==2 || i%4==3){   %>
                            <td><a href='book.jsp?number=<%=rs.getString(1)%>'><img src='img/<%=rs.getString(9)%>' alt='<%=rs.getString(3)%>'><br><%=rs.getString(3)%></a></td>
                <%      }
                        else if(i%4==0){    %>
                            <td><a href='book.jsp?number=<%=rs.getString(1)%>'><img src='img/<%=rs.getString(9)%>' alt='<%=rs.getString(3)%>'><br><%=rs.getString(3)%></a></td>
                            </tr>
                <%      }
                }
            }
        }
        if(loggedIn){
            String userId=(String)session.getAttribute("userId");
            int love_count=(int)session.getAttribute("love_count");
            sql="select * from `click` where `member_id` = '"+userId+"'";
            rs=con.createStatement().executeQuery(sql);
            if(rs.next()){
                sql="select `love_count` from `click` where `member_id` = '"+userId+"'";
                ResultSet rsC=con.createStatement().executeQuery(sql);
                if (rsC.next()) {
                    love_count=Integer.valueOf(rsC.getString("love_count"))+1;
                    sql="update `click` set `love_count` = '"+love_count+"' where `member_id` = '"+userId+"'";
                    int rsU=con.createStatement().executeUpdate(sql);
                }
            }
            else{
                love_count=1;
                sql="insert `click`(`member_id`,`love_count`) values('"+userId+"','"+love_count+"')";
                 boolean rsU=con.createStatement().execute(sql);
            }
        }
            con.close();
    %>      
    </table>
    <%@ include file="footer.jsp"%>
</body>
</html>

