<%@ page language = "java" import="java.sql.*, java.lang.*, java.util.* " contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8"%>
<%
	String id = (String)session.getAttribute("id");
	String pw = (String)session.getAttribute("pw");
	
	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";
	
	int rs = 0;
	
	String sql_delete = "delete from member where id = '" + id + "'";
	
%>
<!DOCTYPE html>
<html>
<meta charset = "UTF-8">
<head>
<link href='indexstyle.css' rel='stylesheet' style="text/css/">
<title>댕신사</title>
<style>
.title{
	padding-top:5%;
}
.content{
	padding-top:100px;
	text-align : center;
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
.findbtn{
	width:100px;
	height:30px;
	border : 1px solid white;
    background-color: white;
    color: black;
    text-align: center;
    font-family:NanumSquareRound;
    font-size: 11px;
    margin :  auto;
    cursor: pointer;
}

h2{
	font-family:NanumSquareRound;
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
	<div class="content">
<%
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection Conn = DriverManager.getConnection(url,user,password); 
	PreparedStatement stmt = Conn.prepareStatement(sql_delete);

	rs = stmt.executeUpdate();

	if(rs > 0)
	{
		stmt.close();
		Conn.close();
		
		session.removeAttribute("id");
		session.removeAttribute("pw");
		
		%>
		<h2> 회원 탈퇴가 정상적으로 실행되었습니다. 
		<br> 그동안 감사했습니다!</h2>
		
		<br>
		<br>
		<input type = "button" class="btn"  value = "확인" onClick ="location.href='index.jsp'">
		<%
	}
	else
	{
		stmt.close();
		Conn.close();
		
		%>
		<h2>오류가 발생했습니다. </h2>
		<br>
		<br>
		<input  type = "button" class="btn" value = "확인" onClick = "location.href='index.jsp'">
		<%
	}
	
%>
</div>
</body>
</html>