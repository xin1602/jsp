<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="setsql.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>後台|分析</title>
    <link rel="icon" type="image" href="img/icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+TC&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/manage.css">
    <link rel="stylesheet" href="css/m_analyze.css">
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

     <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        //horry_age_group_chart
        var horry_age_group_data = new google.visualization.DataTable();
        horry_age_group_data.addColumn('string', 'Age Group');
        horry_age_group_data.addColumn('number', 'Numbers of People');
        horry_age_group_data.addRows([
        <%
          sql="CALL click_age_group_nop('horry','0-10');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['0-10',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('horry','11-20');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['11-20',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('horry','21-30');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['21-30',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('horry','31-40');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['31-40',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('horry','41-50');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['41-50',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('horry','51-60');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['51-60',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('horry','61-70');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['61-70',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('horry','over 71');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['over 71',<%=rs.getString(1)%>],
        ]);

        var horry_age_group_options = {
                       'width':400,
                       'height':300};

        var horry_age_group_chart = new google.visualization.ColumnChart(document.getElementById('horry_age_group_chart'));
        horry_age_group_chart.draw(horry_age_group_data, horry_age_group_options);

        //horry_gender_chart
        var horry_gender_data = new google.visualization.DataTable();
        horry_gender_data.addColumn('string', 'Gender');
        horry_gender_data.addColumn('number', 'Numbers of People');
        horry_gender_data.addRows([
        <%
          sql="CALL click_gender_nop('horry','男');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['男',<%=rs.getString(1)%>],
        <%
          sql="CALL click_gender_nop('horry','女');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['女',<%=rs.getString(1)%>],
        ]);

        var horry_gender_options = {
                       'width':400,
                       'height':300};

        var horry_gender_chart = new google.visualization.PieChart(document.getElementById('horry_gender_chart'));
        horry_gender_chart.draw(horry_gender_data, horry_gender_options);

        //love_age_group_chart
        var love_age_group_data = new google.visualization.DataTable();
        love_age_group_data.addColumn('string', 'Age Group');
        love_age_group_data.addColumn('number', 'Numbers of People');
        love_age_group_data.addRows([
        <%
          sql="CALL click_age_group_nop('love','0-10');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['0-10',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('love','11-20');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['11-20',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('love','21-30');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['21-30',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('love','31-40');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['31-40',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('love','41-50');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['41-50',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('love','51-60');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['51-60',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('love','61-70');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['61-70',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('love','over 71');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['over 71',<%=rs.getString(1)%>],
        ]);

        var love_age_group_options = {
                       'width':400,
                       'height':300};

        var love_age_group_chart = new google.visualization.ColumnChart(document.getElementById('love_age_group_chart'));
        love_age_group_chart.draw(love_age_group_data, love_age_group_options);

        //love_gender_chart
        var love_gender_data = new google.visualization.DataTable();
        love_gender_data.addColumn('string', 'Gender');
        love_gender_data.addColumn('number', 'Numbers of People');
        love_gender_data.addRows([
        <%
          sql="CALL click_gender_nop('love','男');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['男',<%=rs.getString(1)%>],
        <%
          sql="CALL click_gender_nop('love','女');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['女',<%=rs.getString(1)%>],
        ]);

        var love_gender_options = {
                       'width':400,
                       'height':300};

        var love_gender_chart = new google.visualization.PieChart(document.getElementById('love_gender_chart'));
        love_gender_chart.draw(love_gender_data, love_gender_options);

        //suspense_age_group_chart
        var suspense_age_group_data = new google.visualization.DataTable();
        suspense_age_group_data.addColumn('string', 'Age Group');
        suspense_age_group_data.addColumn('number', 'Numbers of People');
        suspense_age_group_data.addRows([
        <%
          sql="CALL click_age_group_nop('suspense','0-10');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['0-10',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('suspense','11-20');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['11-20',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('suspense','21-30');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['21-30',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('suspense','31-40');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['31-40',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('suspense','41-50');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['41-50',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('suspense','51-60');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['51-60',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('suspense','61-70');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['61-70',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('suspense','over 71');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['over 71',<%=rs.getString(1)%>],
        ]);

        var suspense_age_group_options = {
                       'width':400,
                       'height':300};

        var suspense_age_group_chart = new google.visualization.ColumnChart(document.getElementById('suspense_age_group_chart'));
        suspense_age_group_chart.draw(suspense_age_group_data, suspense_age_group_options);

        //suspense_gender_chart
        var suspense_gender_data = new google.visualization.DataTable();
        suspense_gender_data.addColumn('string', 'Gender');
        suspense_gender_data.addColumn('number', 'Numbers of People');
        suspense_gender_data.addRows([
        <%
          sql="CALL click_gender_nop('suspense','男');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['男',<%=rs.getString(1)%>],
        <%
          sql="CALL click_gender_nop('suspense','女');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['女',<%=rs.getString(1)%>],
        ]);

        var suspense_gender_options = {
                       'width':400,
                       'height':300};

        var suspense_gender_chart = new google.visualization.PieChart(document.getElementById('suspense_gender_chart'));
        suspense_gender_chart.draw(suspense_gender_data, suspense_gender_options);

        //fantasy_age_group_chart
        var fantasy_age_group_data = new google.visualization.DataTable();
        fantasy_age_group_data.addColumn('string', 'Age Group');
        fantasy_age_group_data.addColumn('number', 'Numbers of People');
        fantasy_age_group_data.addRows([
        <%
          sql="CALL click_age_group_nop('fantasy','0-10');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['0-10',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('fantasy','11-20');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['11-20',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('fantasy','21-30');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['21-30',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('fantasy','31-40');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['31-40',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('fantasy','41-50');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['41-50',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('fantasy','51-60');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['51-60',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('fantasy','61-70');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['61-70',<%=rs.getString(1)%>],
        <%
          sql="CALL click_age_group_nop('fantasy','over 71');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['over 71',<%=rs.getString(1)%>],
        ]);

        var fantasy_age_group_options = {
                       'width':400,
                       'height':300};

        var fantasy_age_group_chart = new google.visualization.ColumnChart(document.getElementById('fantasy_age_group_chart'));
        fantasy_age_group_chart.draw(fantasy_age_group_data, fantasy_age_group_options);

        //fantasy_gender_chart
        var fantasy_gender_data = new google.visualization.DataTable();
        fantasy_gender_data.addColumn('string', 'Gender');
        fantasy_gender_data.addColumn('number', 'Numbers of People');
        fantasy_gender_data.addRows([
        <%
          sql="CALL click_gender_nop('fantasy','男');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['男',<%=rs.getString(1)%>],
        <%
          sql="CALL click_gender_nop('fantasy','女');";
          rs=con.createStatement().executeQuery(sql);
          rs.next();
        %>
          ['女',<%=rs.getString(1)%>],
        ]);

        var fantasy_gender_options = {
                       'width':400,
                       'height':300};

        var fantasy_gender_chart = new google.visualization.PieChart(document.getElementById('fantasy_gender_chart'));
        fantasy_gender_chart.draw(fantasy_gender_data, fantasy_gender_options);
      }
    </script>


</head>

<nav>
    <!--Logo-->
    <div class="logo"><a href="index.jsp"><img src="img/logo.png" alt="logo"></a></div>
 
    <!--會員登入/會員資料-->
    <div class="member"><a href="manage.jsp"><img src="img/member.png" alt="member"></a></div>
</nav>
</head>
<body>
    <p>瀏覽者點閱行為分析</p>
    <table class="analyze" border="1">
        <tr>
            <th>類型</th>
            <th>點擊次數</th>
            <th>點擊人數</th>
            <th>年齡分佈</th>
            <th>性別比例</th>
        </tr>
    <%
        sql="select sum(`horry_count`) from `click`";
        ResultSet rsHS=con.createStatement().executeQuery(sql);
        rsHS.next();

        sql="select count(`horry_count`) from `click` where `horry_count`!= 0";
        ResultSet rsHC=con.createStatement().executeQuery(sql);
        rsHC.next();

        sql="select sum(`love_count`) from `click`";
        ResultSet rsLS=con.createStatement().executeQuery(sql);
        rsLS.next();

        sql="select count(`love_count`) from `click` where `love_count`!= 0";
        ResultSet rsLC=con.createStatement().executeQuery(sql);
        rsLC.next();

        sql="select sum(`suspense_count`) from `click`";
        ResultSet rsSS=con.createStatement().executeQuery(sql);
        rsSS.next();

        sql="select count(`suspense_count`) from `click` where `suspense_count`!= 0;";
        ResultSet rsSC=con.createStatement().executeQuery(sql);
        rsSC.next();


        sql="select sum(`fantasy_count`) from `click`;";
        ResultSet rsFS=con.createStatement().executeQuery(sql);
        rsFS.next();

        sql="select count(`fantasy_count`) from `click` where `fantasy_count`!= 0;";
        ResultSet rsFC=con.createStatement().executeQuery(sql);
        rsFC.next();

    %>
        <tr class="analyze_text">
            <td>恐怖</td>
            <td><%=rsHS.getString(1)%></td>
            <td><%=rsHC.getString(1)%></td>
            <td class="analyze_text2"><div id="horry_age_group_chart"></div></td>
            <td class="analyze_text2"><div id="horry_gender_chart"></div></td>
        </tr>
        <tr class="analyze_text">
            <td>愛情</td>
            <td><%=rsLS.getString(1)%></td>
            <td><%=rsLC.getString(1)%></td>
            <td class="analyze_text2"><div id="love_age_group_chart"></div></td>
            <td class="analyze_text2"><div id="love_gender_chart"></div></td>
        </tr>
        <tr class="analyze_text">
            <td>懸疑</td>
            <td><%=rsSS.getString(1)%></td>
            <td><%=rsSC.getString(1)%></td>
            <td class="analyze_text2"><div id="suspense_age_group_chart"></div></td>
            <td class="analyze_text2"><div id="suspense_gender_chart"></div></td>
        </tr>
        <tr class="analyze_text">
            <td>科幻</td>
            <td><%=rsFS.getString(1)%></td>
            <td><%=rsFC.getString(1)%></td>
            <td class="analyze_text2"><div id="fantasy_age_group_chart"></div></td>
            <td class="analyze_text2"><div id="fantasy_gender_chart"></div></td>
        </tr>
    </table>
    <%
        con.close();
    %>
</body>
</html>