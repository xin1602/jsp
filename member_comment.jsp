<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h1>評論紀錄</h1>
        <hr>
        <table>
            <tr>
                <td>產品圖片</td>
                <td>時間</td>
                <td>產品名稱</td>
                <td>評論內容</td>
            </tr>
<%
    //呼叫Stored Procedure輸入評論紀錄
    String star="★";
    sql="CALL member_comment('"+(String)session.getAttribute("username")+"')";
    rs=con.createStatement().executeQuery(sql);
    if(!rs.next()){
        out.print("<tr><td colspan='4' ><h2 align='center'>尚無任何評論紀錄</h2></td></tr></table>");
    }
    else{
        sql="CALL member_comment('"+(String)session.getAttribute("username")+"')";
        rs=con.createStatement().executeQuery(sql);
        while(rs.next()){
%>
        
            <tr>
                <td><img src="img/<%= rs.getString(1) %>" alt=""></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(3) %></td>
                <td>
                    <% for(int i=1 ; i<=rs.getInt(4); i++){ %><%=star%><% } %><br>
                    <%= rs.getString(5) %>
                </td>
            </tr>
<% } %>
        </table>
<% } %>