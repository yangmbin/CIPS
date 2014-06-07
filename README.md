CIPS
====

【Community Information Publish System】

这是一个社团信息发布系统的校园应用，该系统提供了注册、登录、发布消息、查看消息、
评论等等功能，为社团提供了一个发布信息的平台，而普通用户则可以以游客身份查看每
天的社团消息，从而不遗漏任何重要的信息！



---项目简介---

1.项目名称：社团信息发布系统（CIPS）

2.技术和工具：java、jsp、mysql server、Navicat for MySql和apache tomcat



---如何运行---

1.下载并安装apache tomcat，也即web应用服务器，我们所使用版本为6.0.29免安装版

2.下载并安装Mysql server数据库服务器，版本为5.0

3.下载并安装Mysql图形化界面（可选），也即Navicat for Mysql

4.利用mysql建立一个数据库，名称为info，并且在上面建立3张表：comment、information和
  user,分别用于保存评论信息、社团发布的信息和用户信息


  comment表建立如下字段：
  id       ——表示评论的编号ID          ——int		——主键
  
  iid      ——表示所评论的社团信息的ID	——int
  
  content  ——表示评论的内容            ——text
  
  username ——表示发表评论用户的名称	——varchar


  information表建立如下字段：
  id       ——表示社团信息编号ID		——int		——主键
  
  title    ——表示社团信息标题		——varchar
  
  content  ——表示社团信息内容		——text
  
  username ——表示发布人		——varchar
  
  date     ——表示发布时间		——varchar


  user表建立如下字段：
  username ——表示用户名		——varchar	——主键
  
  password ——表示密码			——varchar


5.CIPS文件夹为所有的源代码和资源，把里面所有的内容放入tomact中/webapps/test目录下


6.运行mysql数据库并点击tomcat中bin文件夹下的startup.bat文件运行web服务器


7.在浏览器中输入http://localhost:8080/test/login.jsp即可运行，localhost可改为本机IP


注：我们所运行环境为windows7，建议使用chrome、IE、搜狗等浏览器，不建议360



---代码文件说明---

bk1.jpg			——项目中用到的图片
home.jsp		——表示系统首页，游客可以浏览社团发布的信息
login.jsp		——表示登录页面
login_in.jsp		——表示登录成功后到达的页面
register.jsp		——表示注册的界面
register_in.jsp		——表示注册操作的逻辑页，判断合法性的操作
login_judge.jsp		——表示登录操作的逻辑页，用以判断帐号和密码等
publish_info.jsp	——发布信息的页面
publish_process.jsp	——处理发布信息的逻辑页面
user_home.jsp		——显示用户发表过的信息页面
comment.jsp		——对社团信息发表评论的页面
comment_store.jsp	——对发布的评论存入数据库等操作
