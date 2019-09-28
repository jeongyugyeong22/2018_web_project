<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*,java.text.* " contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String keyword = request.getParameter("keyword");
	String searchName = request.getParameter("searchName");
	String datesearchName = request.getParameter("datesearchName");
	
	Calendar cal = Calendar.getInstance();
	
	int year = cal.get ( cal.YEAR );
	int month = cal.get ( cal.MONTH ) + 1 ;
	int date = cal.get ( cal.DATE ) ;


	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?autoReconnect=true&useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";

	String sql_all = "select * from member";
	String sql="";
	
	ResultSet rs = null;

	Class.forName("com.mysql.jdbc.Driver"); 
	Connection pConn = DriverManager.getConnection(url,user,password); 
	PreparedStatement pstmt = null;
	
		
	if(request.getParameter("searchName") == null)
	{
		searchName = "name";
	}
	
	if(keyword.equals("")){
		sql = "select * from member";
	}
	else if(searchName.equals("name")){
		sql = "select * from member where mem_name LIKE '%" + keyword + "%'";
	}
	else if(searchName.equals("address")){
		sql = "select * from member where addr LIKE '%" + keyword + "%'";
	}
	else if(searchName.equals("id")){
		sql = "select * from member where id LIKE '%" + keyword + "%'";
	}
	
	rs = null;
	
	pstmt = pConn.prepareStatement(sql);
	rs = pstmt.executeQuery();

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댕신사-회원관리</title>
<script type="text/javascript">
	function go_search(){
		var frm = document.frm;
	
		var target = document.getElementById("searchName");
		var searchName = target.options[target.selectedIndex].value;
	
		location.href = "ad_membersearch.jsp?keyword="+frm.keyword.value+"&searchName="+searchName;
	}

 	function openmenu() {
	    document.getElementById("Sidemenu").style.width = "200px";
	    document.getElementById("main").style.marginLeft = "200px";
	    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
	}
</script>
<link href='indexstyle.css' rel='stylesheet' style="text/css"/>
<style>
.title{
	padding-top:5%;
}
.content{				/* 내용 */
	padding-top:3%;
	text-align : center;
}
table.membertable{
	width:80%;
    border-bottom: 1px solid #c4c4c4;
    padding-top:5%;
}
table.membertable th{
    width: 100px;
    text-align: center;
    padding: 10px;
    border: 1px solid #f2f2f2;
    background: #f2f2f2;
    font-weight:lighter;
    font-family:NanumSquareRound;
    font-size:15px;
}
table.membertable td{
	text-align: center;
	padding-left:10px;
	border-bottom: 1px solid #f2f2f2;
	font-family:NanumSquareRound;
}
table.searchtable{
    padding-top:3%;
	width:50%;
}
table.searchtable td{
	text-align: center;
	font-family:NanumSquareRound;
}
.btn_search{
	width:100px;
	height:18px;
	border : 1px solid black;
	background-color : white;
	text-align:center;
	font-family:NanumSquareRound;
	font-size: 13px;
	cursor: pointer;
}
.searchbtn{
	width:100px;
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
	
	<jsp:include page="index_top.jsp"/>	<!-- 상단바 -->
	
		
		<div class="title">
		<a href="index.jsp">
		<img src="title.png" style="margin-left: auto; margin-right: auto; display:block;" height=100px>
		</a>
		</div>
		
		<div class="content">							<!-- 내용부분 -->
			<div class=menuname>
				<a href="ad_member.jsp" style="text-decoration:none;">회원관리</a>
			</div> 
			
			<form name="frm" method="post">
				<table class=searchtable style="margin:auto">
  				<tr>
     			<td>
 					<select name="searchName" id = "searchName"> 
 						<option value="name">이름</option> 
 						<option value="address">주소</option> 
 						<option value="id">아이디</option> 
					</select> 
					<input type="text" name="keyword">
				<input type="button" class="btn_search" value="검색" onClick="javascript:go_search()">
				</td>
  				</tr>
  				<tr>
  				<td>
  					<input type="button" class="searchbtn" value="높은 포인트 순" onClick="location.href='ad_point.jsp'">
  				  	<input type="button" class="searchbtn" value="가입일자 일주일" onClick="location.href='ad_week.jsp'">
  				  	<input type="button" class="searchbtn" value="가입일자 한달내" onClick="location.href='ad_month.jsp'">
  				  	<input type="button" class="searchbtn" value="가입일자 1년내" onClick="location.href='ad_year.jsp'">
  				</td>
  				</tr>
				</table>
			</form>
				<table class="membertable" style="margin:auto">         	
           		 <tr>
           	     <th>아이디</th>
               	 <th>비밀번호</th>
               	 <th>이름</th>
              	 <th>연락처</th>
                 <th>주소</th> 
                 <th>가입날짜</th> 
				 <th>포인트</th>
				 </tr>
			<%try {
				Class.forName("com.mysql.jdbc.Driver"); 
		 		Connection Conn = DriverManager.getConnection(url,user,password); 
		 		PreparedStatement stmt = Conn.prepareStatement(sql);
				 
				rs= stmt.executeQuery();
				
  			 	while(rs.next()){
  			 		
  		 			String id = rs.getString("id");
  		 			String pw = rs.getString("pw");
  		 			String mem_name = rs.getString("mem_name");
  		 			String phone = rs.getString("phone");
  		 			String addr = rs.getString("addr");
  		 			String joindate = rs.getString("joindate");
  		 			int point = rs.getInt("point");
  		 			
  				%>
  				<tr>
  		        	<td><%=id %></td>
  		       		<td><%=pw %></td>
  		        	<td><%=mem_name %></td>
  		        	<td><%=phone %></td>
  		        	<td><%=addr %></td>
  		        	<td><%=joindate %></td>
  		        	<td><%=point %>
				
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
  			 </td>
  			 </tr>
  			 </table>	   	

		</div>
	</div>
	</div>
</body>
</html>