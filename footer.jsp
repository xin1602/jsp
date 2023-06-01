<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<footer>
	<%
	  int counter;
	  String strNo = (String)application.getAttribute("counter");//讀application變數
	  counter = Integer.parseInt(strNo); //轉成整數
	  if(session.isNew()) {
		  counter++;    //計數器加1
	  }
	  strNo = String.valueOf(counter);    //轉成字串
	  application.setAttribute("counter", strNo);//寫application變數
	%>
    Copyright © 2023 all rights reserved<br>
    瀏覽人數：<%= counter %>
</footer>