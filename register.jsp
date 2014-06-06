<html>

<head>
<script type="text/javascript">
function validation()
{
  var name=document.form.username.value;
  var pass=document.form.password.value;
  if(name == "" || pass == "") 
  {
	alert("用户名或密码不能为空!");
  }
  else if(-1 != name.indexOf(' ') || -1 != pass.indexOf(' '))
  {
    alert("用户名或密码不能包含空格!");
  }
}
</script>

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

<center>
<form name="form" action="register_in.jsp" method="post">
  <p>帐  号: <input type="text" name="username" /></p>
  <p>密  码: <input type="password" name="password" /></p>
  <input style="margin-left:150px;" type="submit" value="注 册"/>
</form>
</center>


</div>
</body>

</html>