<%@ page language="java" import="java.sql.*, java.lang.*, java.util.* "  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); 

	int msg;
	String keyword = request.getParameter("searchValue");
	String selected=request.getParameter("searchName");
	
	int i = 0;

	if(request.getParameter("msg") != null)
 	{
    	msg = Integer.parseInt(request.getParameter("msg"));
 	}
 	else
 	{
    	msg = 1;
 	}
 
 	String sql_title = "select * from notice where title LIKE '%" + keyword + "%'";

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
}h5{
    font-family:NanumSquareRound;
    font-weight:lighter;

}

.writebtn{
	width:50px;
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
table.boardtable{
	width:80%;
    border-top: 1px solid #c4c4c4;
    border-bottom: 1px solid #c4c4c4;
}
table.boardtable th{
    width: 100px;
    text-align: center;
    padding: 10px;
    border: 1px solid #f2f2f2;
    background: #f2f2f2;
    font-weight:lighter;
    font-family:NanumSquareRound;
    font-size:15px;
}
table.boardtable td{
	text-align: center;
	padding-left:10px;
	border-bottom: 1px solid #f2f2f2;
	font-family:NanumSquareRound;
}
.searchbtn{
	width:100px;
	height:18px;
	border : 1px solid black;
	background-color : white;
	text-align:center;
	font-family:NanumSquareRound;
	font-size: 13px;
	cursor: pointer;
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
   		<h5>게시판 목록</h5>
 		<table class="boardtable" style="margin:auto">         	
           <tr>
               <th>번호</th>
               <th>제목</th>
               <th>작성자</th>
               <th>작성일</th>
           </tr> 
		<%
		if(selected.equals("title")){
			Class.forName("com.mysql.jdbc.Driver"); 
		 	Connection Conn = DriverManager.getConnection(url,user,password); 
		 	PreparedStatement stmt = Conn.prepareStatement(sql_title);
		 	
			rs = stmt.executeQuery();
			
			while(rs.next()){
				int notice_num = rs.getInt("notice_num");
	 			String notice_pw=rs.getString("notice_pw");
	 			String title = rs.getString("title");
	 			String id = rs.getString("id");
	 			String mem_name=rs.getString("mem_name");
	 			String date=rs.getString("notice_date");

	 	%>
        	<tr>
            	<td><%=notice_num %></td>
            	<td width="80px"><a href="noticecontent.jsp?notice_num=<%=notice_num%>" style="text-decoration:none;"><%=title %></a></td>
            	<td><%= mem_name%></td>
            	<td><%=date%></td>
			<%
			}rs.close();
			}%> 
			</tr>
       		<!--  검색 --> 
 				<tr style="text-align: center;"> 
 					<td colspan="5"> 
 						<form action="noticesearch.jsp" method="post"> 
 							<select name="searchName"> 
 								<option value="title">글제목</option> 
							</select> 
							<input type="text" name="searchValue"> 
 							<input type="submit" class="searchbtn" value="검색"> 
 						</form> 
 					</td> 
 				</tr>
   			</table>
		<%if("admin".equals((String)session.getAttribute("id"))) {%>
  		<br><input type="button" class="writebtn" value="글쓰기" onClick="location.href='noticewrite.jsp'">
  		<%}%>		</div>
	</div>
	</div>
</body>
</html>