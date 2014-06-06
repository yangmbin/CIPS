<%@ page language="java" import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>

<html>

<head>
<title>登录验证</title>
</head>

<body bgcolor="gray">

<%
	request.setCharacterEncoding("utf-8");
	String name=request.getParameter("username");
	String pass=request.getParameter("password");
	
	request.getSession().setAttribute("user", name);
	

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
	//插入语句需注意一点：语句必须符合MYSQL语句语法标准，否则会失败
	
	//查看数据库中用户名和密码是否匹配
	String _sql="select * from user where username='"+name+"' and password='"+pass+"'";
	ResultSet rs=stmt.executeQuery(_sql);
	
	if(rs.next()) //登录成功
	{	
		response.sendRedirect("login_in.jsp");
	}
	else
	{	
		out.println("登录失败，请检查用户名和密码是否正确！" + "<form method=\"post\" action=\"login.jsp\"><input type=\"submit\" value=\"确 定\"></form>");
	}

	//释放资源，释放前需先判断statement和connection两个对象是否为空，
	//如果不为空则说明资源没有释放。就需要关闭占有数据库的对象statement和connection
	if(stmt != null)
	stmt.close();
	if(conn != null)
	conn.close();

%>

</body>
</html>