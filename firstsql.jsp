<%@ page language="java" import="java.util.*" %>
<%@page import="java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>JSP读取数据库</title>
</head>

<body>
<table border="1" align="center">
<tr>
<th>书号</th>
<th>书名</th>
<th>作者</th>
<th>出版社</th>
</tr>
<%
String driverClass="com.mysql.jdbc.Driver";
   String url="jdbc:mysql://localhost:3306/simple";//
String user="root";//
String password="yangmbin";//
Connection conn;
 try {
 Class.forName(driverClass).newInstance();
 conn=DriverManager.getConnection(url,user,password);
 Statement stmt=conn.createStatement();
 String sql="SELECT * FROM book";//
 ResultSet rs=stmt.executeQuery(sql);
 while(rs.next()){
	
%>
<tr>
 <td><%=rs.getString("bookid")%></td>
 <td><%=rs.getString("bookname")%></td>
 <td><%=rs.getString("writer")%></td>
 <td><%=rs.getString("publish")%></td>
</tr>
<%
 }
 }catch(Exception ex){
 ex.printStackTrace();
 }
%>
</body>
</html>