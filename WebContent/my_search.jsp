<%@ page language="java" import="java.sql.*, java.lang.*, java.util.* "  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); 

	int msg;
	int price;
	String keyword = request.getParameter("keyword");
	int i = 0;

	if(request.getParameter("msg") != null)
 	{
    	msg = Integer.parseInt(request.getParameter("msg"));
 	}
 	else
 	{
    	msg = 1;
 	}
 
 	String sql = "select * from item where item_name LIKE '%" + keyword + "%'";
 
	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?autoReconnect=true&useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";
 
 	ResultSet rs = null;

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='indexstyle.css' rel='stylesheet' style="text/css"/>
<link href='goodscss.css' rel='stylesheet' style="text/css"/>

<title>검색</title>
<style>
.title{
	padding-top:5%;
}
.content{
	padding-top:3%;
	text-align : center;
}
</style>
<script type="text/javascript">
function openmenu() {
    document.getElementById("Sidemenu").style.width = "200px";
    document.getElementById("main").style.marginLeft = "200px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}
</script>
</head>
<body>
   <%@ include file="sidemenu.jsp"%>	<!-- 메뉴 -->

	<div id="main">												<!-- 메인 내용 -->
		<div class="container" onClick="javascript:openmenu();">	<!-- 메뉴표시 -->
 	 		<div class="menu">
 	 			menu &#10095
 	 		</div>
		</div>

	<div style="padding:0px 0px 300px;">							<!-- 스크롤 -->
	
		<%@ include file="index_top.jsp"%>	<!-- 상단바 -->

		<div class="title">
		<a href="index.jsp">
		<img src="title.png" style="margin-left: auto; margin-right: auto; display:block;" height=100px>
		</a>
		</div>
    
		<div class="content">
   		<!-- 검색 -->
		<%
		Class.forName("com.mysql.jdbc.Driver"); 
	 	Connection Conn = DriverManager.getConnection(url,user,password); 
	 	PreparedStatement stmt = Conn.prepareStatement(sql);
	 	
		rs = stmt.executeQuery();
		while(rs.next()){
 			String item_name = rs.getString("item_name");
 			String cost=rs.getString("cost");
 			String image = rs.getString("image");
 			int count = rs.getInt("count");
 			if(count!=0){
 			%>
			<div class="goods">
				<a href="product_detail.jsp?item_name=<%=item_name%>" style="text-decoration:none;">
				<img src=<%=image %> width="70%">
				<p><div class="name"><%=item_name %><br>
				<%=cost %>원</div></a>
			</div>
			<%}else{ %>
			<div class="goods">
				<img src=<%=image %> width="70%">
				<p><div class="name"><%=item_name %><br>
				품절</div>
			</div>
			<%} %>
		<%
		}
		rs.close();

		%> 
        </div>
      </div>
     </div>
</body>
</html>