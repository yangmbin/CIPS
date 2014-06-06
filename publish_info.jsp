<%@ page language="java" import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>

<html>


<head>
<style>
.container
{
	width: 80%;
	margin: 0 auto;
}
body
{
	font-family:微软雅黑;
}
ul
{
	list-style-type:none;
	margin:0;
	padding:0;
	overflow:hidden;
	
	position:absolute;
	right:10%;
}
li
{
	float:left;
}
a:link,a:visited
{
	display:block;
	width:120px;
	font-weight:bold;
	color:#FFFFFF;
	background-color:#bebebe;
	text-align:center;
	padding:4px;
	text-decoration:none;
	text-transform:uppercase;
}
a:hover,a:active
{
	background-color:#cc0000;
}

</style>
</head>



<body bgcolor="gray">
<div class="container">

<img src="bg1.jpg" width="100%" height="180" />

<ul>
<li><a href="login_in.jsp">社团信息首页</a></li>
<li><a href="user_home.jsp">用户首页</a></li>
<li><a href="publish_info.jsp">发布信息</a></li>
<li><a href="home.jsp">退出</a></li>
</ul>

<hr />
<hr />
<br />


<%
	String name = (String)session.getAttribute("user");
	if(name == null)
	{
		response.sendRedirect("login.jsp");
	}
	out.println("<p>" + "欢迎您：" + name + "</p><hr />");
%>



<form action="publish_process.jsp" method='post'> 
<p>标题：</p>
<textarea name="title" rows="1" cols="70"></textarea>
<p>内容：</p>
<p><textarea name="content" rows="10" cols="70"></textarea></p>
<input type="submit" value="发 表" />
</form>


</div>
</body>

</html>