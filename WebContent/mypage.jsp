<%@ page language = "java" import="java.sql.*, java.lang.*, java.util.* " contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = (String)session.getAttribute("id");

	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";
 
 	String sql = "Select mem_name,point from member where id = '" +id+ "'";
 
 	ResultSet rs = null;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댕신사</title>
<link href='indexstyle.css' rel='stylesheet' style="text/css"/>
<style>
@font-face { font-family: 'NanumSquareRound'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff'); 
font-weight: normal; font-style: normal; }
.title{
	padding-top:5%;
}
.content{
	padding-top:50px;
	text-align: center;
}

h2{
	font-family:NanumSquareRound;
	text-align : center;
	
}
.buttons{
	padding-top:50px;
}
.member{
	width:150px;
	height:20px;
	border-bottom : 1px solid #E6E6E6;
    color: black;
    text-align: center;
    font-family:NanumSquareRound;
    font-size: 15px;
    margin:auto;
    display:inline-block;
}
.btn{
	width:150px;
	height:30px;
	border : 1px solid #E6E6E6;
    background-color: #E6E6E6;
    color: black;
    text-align: center;
    font-family:NanumSquareRound;
    font-size: 13px;
    margin :  auto;
    cursor: pointer;
}
</style>
<script>
function openmenu() {
    document.getElementById("Sidemenu").style.width = "200px";
    document.getElementById("main").style.marginLeft = "200px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
}

</script>
</head>
<body>
	<jsp:include page="sidemenu.jsp"/>	<!-- 상단바 -->

	<div id="main">												<!-- 메인 내용 -->
		<div class="container" onClick="javascript:openmenu();">	<!-- 메뉴표시 -->
 	 		<div class="menu">
 	 			menu &#10095 
 	 		</div>
		</div>		
		
		<jsp:include page="index_top.jsp"/>	<!-- 상단바 -->
		
		<div class="title">
		<a href="index.jsp">
		<img src="title.png" style="margin-left: auto; margin-right: auto; display:block;" height=100px>
		</a>
		</div>
	<%
 	try
 	{
 		Class.forName("com.mysql.jdbc.Driver"); 
 		Connection Conn = DriverManager.getConnection(url,user,password); 
 		PreparedStatement stmt = Conn.prepareStatement(sql);
 		rs= stmt.executeQuery();
 			
 		if(rs.next())
 		{
 			String mem_name = rs.getString("mem_name");
 			int point = rs.getInt("point");
 			
 			 rs.close();
 			 stmt.close();
 			 Conn.close();
 			   
 		 %>
		<div class="content">							<!-- 내용부분 -->
		<h2>마이페이지</h2>
		<div class="member">
		<%=id%>		
		</div>
		<div class="member">
		<%=mem_name %> 님
		</div>
		<div class="member">
		<%= point %> point
		</div>
		<div class="buttons">
		<input type="button" class="btn" value="회원정보변경" onClick="location.href='changeinfo.jsp'">
		<input type="button" class="btn" value="주문조회" onClick="location.href='order.jsp'">
		<input type="button" class="btn" value="배송조회" onClick="location.href='delivery.jsp'">
		<input type="button" class="btn" value="장바구니" onClick="location.href='cart.jsp'">
		</div>
		</div>
	<%
 	 		}
 		}catch(SQLException e)
 	 {
 	    out.println(e);
 	 }
 	 catch(Exception el)
 	 {
 	    out.println(el);
 	 }
%>
		</div>
		
</body>
</html>