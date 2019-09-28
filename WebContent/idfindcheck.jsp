<%@ page language = "java" import="java.sql.*, java.lang.*, java.util.* " contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String mem_name = request.getParameter("mem_name");
	String phone = request.getParameter("phone");

	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";

 	String sql_find = "";
	ResultSet rs =null;

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
	padding-top:40px;
	text-align : center;
}

h2{
	font-family:NanumSquareRound;
}
table.findtable {
    border-top: 1px solid #c4c4c4;
    border-bottom: 1px solid #c4c4c4;
}

table.findtable th{
    width: 150px;
    text-align: left;
    padding: 10px;
    border: 1px solid #f2f2f2;
    background: #f2f2f2;
    font-weight:lighter;
    font-family:NanumSquareRound;
    font-size:15px;
}
table.findtable td{
	text-align: left;
	padding-left:10px;
	border-bottom: 1px solid #f2f2f2;
}
.label{
	text-align:center;
	font-family:NanumSquareRound;
    font-size:15px;
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
	function closemenu() {
		document.getElementById("Sidemenu").style.width = "0";
		document.getElementById("main").style.marginLeft= "0";
		document.body.style.backgroundColor = "white";
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
 		sql_find = "select id from member where mem_name = '" +mem_name+ "' AND phone = '" + phone+ "'";
 		Class.forName("com.mysql.jdbc.Driver"); 
 		Connection Conn = DriverManager.getConnection(url,user,password); 
 		PreparedStatement stmt = Conn.prepareStatement(sql_find);
			
 		rs= stmt.executeQuery();
 			
 		if(rs.next())
 		{
 			String find_id = rs.getString("id");
 			   
 			 rs.close();
 			 stmt.close();
 			 Conn.close();
 			   
 		 %>
 		<div class="content">							<!-- 내용부분 --> 
 		<h2>아이디 찾기 결과</h2>
		<form name="findform" method="post">
		<table class="findtable" style="margin:auto">
		<tr>
		<th scope="row">아이디</th>							<!-- 아이디 -->
		<td><%=find_id%></td>
		</tr>
		<tr>
		<th scope="row">이름</th>							<!-- 이름 -->
		<td><%=mem_name%></td>
		</tr>
		<tr>
		<th scope="row">핸드폰 번호</th>							<!-- 핸드폰 번호 -->
		<td><%=phone%></td>
		</tr>
		</table>
		<br>
		<input type="button" class="btn" value="돌아가기" onClick="location.href='login.jsp'"> <!-- 취소버튼 -->
		</form>
		</div>
 	  	<%
 	 	}else{
 	  		rs.close();
 	  		stmt.close();
 	   		Conn.close();
 	  	%>
 		<div class="content">							<!-- 내용부분 --> 
		<h2>아이디 찾기 결과</h2>
		<form name="findform" method="post">
			<label class="label">검색 결과가 없습니다.<br></label>
			<br><input type="button" class="btn" value="돌아가기" onClick="location.href='idfind.jsp'"> <!-- 취소버튼 -->
		</form>
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