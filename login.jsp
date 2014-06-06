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
<li><a href="home.jsp">社团信息首页</a></li>
<li><a href="register.jsp">用户注册</a></li>
<li><a href="login.jsp">用户登录</a></li>
</ul>

<hr />
<hr />
<br />

<div align="center">
<form action="login_judge.jsp" method="post">
  <p>帐  号: <input type="text" name="username" /></p>
  <p>密  码: <input type="password" name="password" /></p>
  <input style="margin-left:150px;" type="submit" value="登 录" />
</form>
</div>

</div>
</body>

</html>