<%@ page language="java" import="java.sql.*, java.lang.*, java.util.* " contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
	
	String id=(String)session.getAttribute("id");
	int order_num = Integer.parseInt(request.getParameter("order_num"));

	int message = 0;

	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";

	String sql="select * from review where order_num ='"+order_num+"'";
	ResultSet rs = null;
%>
<html>
<head>
<title>게시판</title>
</head>
<link href='indexstyle.css' rel='stylesheet' style="text/css"/>

<style>
h2{
	font-family:NanumSquareRound;
}

.title{
	padding-top:5%;
}
.content{
	padding-top:3%;
	text-align : center;
}

table.contenttable {
	padding-top:5%;
	width:70%;
	height: 80%;
	border:0;
	align:center;
	border:1px solid #f2f2f2;
	border-right:1px solid #f2f2f2;
	border-collapse:collapse;
}

table.contenttable td{
	text-align: center;
	padding-left:10px;
	border-bottom: 1px solid #D8D8D8;
	border-left:1px solid #D8D8D8;
	font-family:NanumSquareRound;
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
.contents{
	text-align:left;
}
</style>
<script type="text/javascript">	
	function openmenu() {
	    document.getElementById("Sidemenu").style.width = "200px";
	    document.getElementById("main").style.marginLeft = "200px";
	    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
	}

</script>
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
		<div class=menuname>
			<a href="review.jsp" style="text-decoration:none;">REVIEW</a>
		</div> 
		<form>
		<table class="contenttable" style="margin:auto">  
 			<%
			try{
				Class.forName("com.mysql.jdbc.Driver"); 
	 			Connection Conn = DriverManager.getConnection(url,user,password);
				
				PreparedStatement stmt = Conn.prepareStatement(sql);
				rs = stmt.executeQuery();
		        
				while(rs.next()){
					int review_num = rs.getInt("review_num");
		 			String review_pw=rs.getString("review_pw");
		 			String mem_name=rs.getString("mem_name");
		 			String review_date=rs.getString("review_date");
		 			String title=rs.getString("item_name");
		 			String content=rs.getString("content");
		 	%>
		 	<tr>
     		<td align="center" width="125" height="30px" style="background: #f2f2f2;">글번호</td>
    		<td align="center" width="125" align="center">
	     	<%=review_num%></td>
 			</tr>
  			<tr height="30">
    		<td align="center" width="125" style="background: #f2f2f2;">작성자</td>
    		<td align="center" width="125" align="center">
	     	<%=mem_name%></td>
   			<td align="center" width="125" style="background: #f2f2f2;">작성일</td>
   			<td align="center" width="125" align="center">
	    	<%=review_date%></td>
  			</tr>
  			<tr height="30">
   			<td align="center" width="125" style="background: #f2f2f2;">글제목</td>
    		<td align="left" width="375" align="left" colspan="3" style="text-align:left; ">
	     	<%=title%></td>
  			</tr>
  			<tr>
    		<td align="center" width="125" style="background: #f2f2f2;">글내용</td>
    		<td align="left" width="375" colspan="3" style="text-align:left; ">
           	<pre><%=content%></pre></td>
  			</tr>
			<%}
			rs.close();
			stmt.close();
			Conn.close();
			}catch(SQLException e)
			{
		 	    out.println(e);
		 	}
		 	catch(Exception el)
		 	{
		 	    out.println(el);
		 	}
			%>
		</table> 
		<br>
	  		<input type="button" class="btn" value="글삭제" onclick="location.href='reviewdeleteform.jsp?order_num=<%=order_num%>'">
       		<input type="button" class="btn" value="글목록" onclick="location.href='review.jsp?order_num=<%=order_num%>'">
	</form>
	</div> 
	</div>
	</div>
</body>
</html>