<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC"; 
String sql="";
Connection con=DriverManager.getConnection(url,"jsp","opo77990");   					
sql="use `bookstore`";
con.createStatement().execute(sql);
%>