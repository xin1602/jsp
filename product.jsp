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
    <h1><u>科幻</u></h1>
    <table>
    <%@ include file="setsql.jsp"%>
    <% 
            sql="select count(*) from `products` where `category` = '科幻'";
            rs=con.createStatement().executeQuery(sql);
            int n;
            
            while(rs.next()){
                n=rs.getInt(1);
                sql="select * from `products` where `category` = '科幻'";
                rs=con.createStatement().executeQuery(sql);
                while(rs.next()){
                        if(n%4==1){   %>
                            <tr>
                            <td><a href='book.jsp?number=<%=rs.getString(1)%>'><img src='img/<%=rs.getString(9)%>' alt='<%=rs.getString(3)%>'><%=rs.getString(3)%></a></td>
                <%      }
                        else if(n%4==2 || n%4==3){   %>
                            <td><a href='book.jsp?number=<%=rs.getString(1)%>'><img src='img/<%=rs.getString(9)%>' alt='<%=rs.getString(3)%>'><%=rs.getString(3)%></a></td>
                <%      }
                        else{    %>
                            <td><a href='book.jsp?number=<%=rs.getString(1)%>'><img src='img/<%=rs.getString(9)%>' alt='<%=rs.getString(3)%>'><%=rs.getString(3)%></a></td>
                            </tr>
                <%      }
            }
        }
            con.close();
    %>      
    </table>
    <%@ include file="footer.jsp"%>
</body>
</html>

<!-- while(rs.next()){
    for(int i=0;i<=n;i++){
        if(i%4==1){   %>
            out.print("<tr>");
            out.print("<td><a href='book.jsp?number=<%=rs.getString(1)%>'><img src='img/<%=rs.getString(9)%>' alt='<%=rs.getString(3)%>'><%=rs.getString(3)%></a></td>");
        }
        elif(i%4==2 || i%4==3){
            out.print("<td><a href='book.jsp?number=<%=rs.getString(1)%>'><img src='img/<%=rs.getString(9)%>' alt='<%=rs.getString(3)%>'><%=rs.getString(3)%></a></td>");
        }
        else{
            out.print("<td><a href='book.jsp?number=<%=rs.getString(1)%>'><img src='img/<%=rs.getString(9)%>' alt='<%=rs.getString(3)%>'><%=rs.getString(3)%></a></td>");
            out.print("</tr>");
        }
    }
} -->