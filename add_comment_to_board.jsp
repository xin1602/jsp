<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import = "java.sql.*, java.util.*, java.lang.*,javax.servlet.*,java.text.*"%>
<%@ include file="setsql.jsp" %>
<%  
    if(session.getAttribute("username")==null){
        out.print("<script>alert('請登入再使用留言功能！');window.location='login.jsp'</script>");
    }
    else{  
    
        //讀取表單傳送資料
        request.setCharacterEncoding("UTF-8");
        String product_id=(String)session.getAttribute("number"); 
        String member_name=(String)session.getAttribute("username");
        String star_number=request.getParameter("star_number");

        String comment=request.getParameter("comment");
        comment=comment.replaceAll("\r","<br>");  //留言輸入時如果換行增加換行標籤

        java.util.Date time=new java.util.Date();
        SimpleDateFormat  correct_time= new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
        
        //如果留言或星等為空報錯，否則將資料出入資料庫並重新導向商品頁
        if(comment.equals("") || star_number==null){
		    out.print("<script>alert('留言與星等不可為空！'); window.location='book.jsp?number="+product_id+"'</script>");
	    }
        else{
            sql = "INSERT INTO `board` (`product_id`, `member_name`, `star`, `comments`,`comments_date`) VALUES (?,?,?,?,?)";
            stmt=con.prepareStatement(sql);
            
            stmt.setString(1,product_id);
            stmt.setString(2,member_name);
            stmt.setString(3,star_number);
            stmt.setString(4,comment);
            stmt.setString(5,correct_time.format(time));
            
            stmt.executeUpdate();
            con.close();
            out.print("<script>alert('留言成功！'); window.location='book.jsp?number="+product_id+"'</script>");
        }
    }
%>


