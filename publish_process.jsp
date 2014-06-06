<%@ page language="java" import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@ page import="com.mysql.jdbc.Driver" %>
<%@ page import="java.text.SimpleDateFormat"%>

<html>

<body bgcolor="gray">

<%
	request.setCharacterEncoding("utf-8");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	int empty = 0; //不为空标志
	if(title.trim().isEmpty() || content.trim().isEmpty())
		empty = 1;
	if(empty == 1)
	{
		out.println("发布失败！");
		out.println("<p>" + "1.标题或内容不能为空" + 
			"</p>" + "<form method=\"post\" action=\"publish_info.jsp\"><input type=\"submit\" value=\"确 定\"></form>");
	}
	else 
	{
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
		ResultSet rs=stmt.executeQuery("SELECT* FROM information");//执行SQL语句并返回结果.
		
		rs.last();//获取记录总数
		int totalItem=rs.getRow();
		totalItem += 1;
		totalItem *= -1;
		
		String name = (String)session.getAttribute("user"); //获取用户名
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		java.util.Date date=new java.util.Date();  
		String str=sdf.format(date); 
		
		String sql="INSERT INTO information(id, title, content, username, date) VALUES('"+totalItem+"', '"+title+"', '"+content+"', '"+name+"', '"+str+"')";
			
		stmt.executeUpdate(sql);
		
		//释放资源，释放前需先判断statement和connection两个对象是否为空，
		//如果不为空则说明资源没有释放。就需要关闭占有数据库的对象statement和connection
		if(stmt != null)
			stmt.close();
		if(conn != null)
			conn.close();
			
		response.sendRedirect("login_in.jsp");
	}
			
%>

</body>

</html>