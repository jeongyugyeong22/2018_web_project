<%@ page language="java" import="java.sql.*, java.lang.*, java.util.* " contentType= "text/html;charset = UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
	int i = 0;

	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?autoReconnect=true&useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";

	String sql = "select * from qna order by qna_num DESC";
	ResultSet rs = null;
    int count = 0;
    int number = 0;
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
h5{
    font-family:NanumSquareRound;
    font-weight:lighter;

}
.title{
	padding-top:5%;
}
.content{
	padding-top:40px;
	text-align : center;
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
	
	function go_search(){
		var frm = document.qnasearch;
	
		var target = document.getElementById("searchName");
		var searchName = target.options[target.selectedIndex].value;
	
		location.href = "qnasearch.jsp?keyword="+frm.keyword.value+"&searchName="+searchName;
	}
</script>
</head>
<body>
	<jsp:include page="sidemenu.jsp"/>	<!-- 메뉴 -->

	<div id="main">												<!-- 메인 내용 -->
		<div class="container" onClick="javascript:openmenu();">	<!-- 메뉴표시 -->
 	 		<div class="menu">
 	 			menu &#10095
 	 		</div>
		</div>

	<div style="padding:0px 0px 300px;">							<!-- 스크롤 -->
	
		<jsp:include page="index_top.jsp"/>	<!-- 메뉴 -->
		
		<div class="title">
		<a href="index.jsp">
		<img src="title.png" style="margin-left: auto; margin-right: auto; display:block;" height=100px>
		</a>
		</div>
		
		<div class="content">							<!-- 내용부분 -->
			<div class=menuname>
				<a href="qna.jsp" style="text-decoration:none;">Q&A</a>
			</div> 
			<h5>게시판 목록</h5>
 			<table class="boardtable" style="margin:auto">         	
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>         
           <%
			try{
				Class.forName("com.mysql.jdbc.Driver"); 
	 			Connection Conn = DriverManager.getConnection(url,user,password); 
	 			PreparedStatement stmt = Conn.prepareStatement(sql);

				rs = stmt.executeQuery();
				while(rs.next()){
					int qna_num = rs.getInt("qna_num");
		 			String qna_pw=rs.getString("qna_pw");
		 			String title = rs.getString("title");
		 			String id = rs.getString("id");
		 			String mem_name=rs.getString("mem_name");
		 			String date=rs.getString("qna_date");

		 	%>
            	<tr>
                	<td><%=qna_num %></td>
                	<td width="80px"><a href="content.jsp?qna_num=<%=qna_num%>" style="text-decoration:none;"><%=title %></a></td>
                	<td><%= mem_name%></td>
                	<td><%=date%></td>
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
		    </tr>
		    <!--  검색 --> 
 				<tr style="text-align: center;"> 
 					<td colspan="5"> 
 						<form name ="qnasearch" method="post"> 
 						<select name="searchName" id = "searchName"> 
 						<option value="name">이름</option> 
 						<option value="title">제목</option> 
						</select> 
						<input type="text" name="keyword">
						<input type="button" class="searchbtn" value="검색" onClick="javascript:go_search()">
 						</form> 
 					</td> 
 				</tr>
   			</table>
  		<br><input type="button" class="writebtn" value="글쓰기" onClick="location.href='qnawrite.jsp'">
		</div>
	</div>
	</div>
</body>
</html>