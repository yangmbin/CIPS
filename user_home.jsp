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

	
	
	//连接本地数据库
	String driverClass="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/info";
	String user="root";
	String password="yangmbin";

	Connection conn;

	//把Mysql的JDBC驱动类加载到内存中
	Class.forName(driverClass).newInstance();
	//通过驱动管理器取得一个与Mysql数据库连接的对象
	conn=DriverManager.getConnection(url,user,password);
	//使用数据库连接对象conn来创建一个statement对象，可以执行SQL语句
	Statement stmt=conn.createStatement();
	
    ResultSet rs=stmt.executeQuery("SELECT* FROM information where username='"+name+"'");//执行SQL语句并返回结果.
	
	if(!rs.next())
	{
		rs.close();
		stmt.close();
		conn.close();
	}
	else{
		rs=stmt.executeQuery("SELECT* FROM information where username='"+name+"'");//执行SQL语句并返回结果.

		int pageSize;//一页显示的记录数
		int totalItem;//记录总数
		int totalPage;//总页数
		int curPage;//待显示页码
		String strPage;
		int i;
		pageSize=5;//设置一页显示的记录数
		strPage=request.getParameter("page");//获得待显示页码
		if(strPage==null)
		{
			curPage=1;
		}
		else
		{
			curPage=java.lang.Integer.parseInt(strPage);//将字符串转换成整形
		}
		if(curPage<1)
		{
			curPage=1;
		}
		rs.last();//获取记录总数
		totalItem=rs.getRow();
		
		totalPage=(totalItem+pageSize-1)/pageSize;
		if(curPage>totalPage) curPage=totalPage;//调整待显示的页码
		if(totalPage>0)
		{//将记录指针到待显示页的第一条记录上
			rs.absolute((curPage-1)*pageSize+1);
		}
		i=0;
%>
		
		

		<%//显示数据
		while(i<pageSize && !rs.isAfterLast())
		{
		%>	
		<fieldset>
			<p>【<%=rs.getString("title")%>】</p>
			<p><%=rs.getString("content")%></p>
			<div style="text-align:right">发表于：<%=rs.getString("date")%> | 作者：<%=rs.getString("username")%></div>
		</fieldset>
		<br />
		<%
		rs.next();
		i++;
		}
		
		rs.close();
		stmt.close();
		conn.close();
		%>
		

		
		<p align="center">

		共<%=totalItem%>个记录,分<%=totalPage%>页显示,当前页是:第<%=curPage%>页<br />

		<%if(curPage>1){%><a href="user_home.jsp?page=1">首页</a><%}%>&nbsp;&nbsp;

		<%if(curPage>1){%><a href="user_home.jsp?page=<%=curPage-1%>">上一页</a><%}%>&nbsp;&nbsp;

		<%
		for(int j=1;j<=totalPage;j++)
		{
			out.print("&nbsp;&nbsp;<a href='user_home.jsp?page="+j+"'>"+j+"</a>");
		}
		%>

		&nbsp;&nbsp;
		<%if(curPage<totalPage){%><a href="user_home.jsp?page=<%=curPage+1%>">下一页
		</a><%}%>&nbsp;&nbsp;

		<%if(totalPage>1){%><a href="user_home.jsp?page=<%=totalPage%>">末页</a><%}%>
	<%
	}
	%>
	
</div>
</body>

</html>