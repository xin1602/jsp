<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<footer>
	Copyright © 2023 all rights reserved<br>
	<%
	  int counter;
	  String strNo = (String)application.getAttribute("counter"); // 讀取 application 變數
	
	  if (strNo == null || strNo.equals("")) {
	    application.setAttribute("counter", "1000");
	  } 
		  
	  strNo = (String)application.getAttribute("counter");
	  counter = Integer.parseInt(strNo); // 轉成整數
	
	  if (session.isNew()) {
	    counter++; // 計數器加1
	  }
	
	  strNo = String.valueOf(counter); // 轉成字串
	  application.setAttribute("counter", strNo); // 寫入 application 變數
	  out.print("瀏覽人數：" + counter);
	%>
	
	    
</footer>