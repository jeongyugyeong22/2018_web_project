<%@ page language="java" import="java.sql.*, java.lang.*, java.util.*,java.text.* " contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String keyword = request.getParameter("keyword");
	String searchName = request.getParameter("searchName");
	String datesearchName = request.getParameter("datesearchName");

	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?autoReconnect=true&useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";

	String sql_all = "select * from item";
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
		sql = "select * from order";
	}
	else if(searchName.equals("name")){
		sql = "select * from itemorder where mem_name LIKE '%" + keyword + "%'";
	}
	else if(searchName.equals("id")){
		sql = "select * from itemorder where id LIKE '%" + keyword + "%'";
	}
	
	rs = null;
	
	pstmt = pConn.prepareStatement(sql);
	rs = pstmt.executeQuery();

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댕신사-주문관리</title>
<script type="text/javascript">
	function go_search(){
		var frm = document.frm;
	
		var target = document.getElementById("searchName");
		var searchName = target.options[target.selectedIndex].value;
	
		location.href = "ad_ordersearch.jsp?keyword="+frm.keyword.value+"&searchName="+searchName;
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
				<a href="ad_order.jsp" style="text-decoration:none;">주문관리</a>
			</div> 
			
			<form name="frm" method="post">
				<table class=searchtable style="margin:auto">
  				<tr>
     			<td>
 					<select name="searchName" id = "searchName"> 
 						<option value="name">주문자 이름</option> 
 						<option value="id">아이디</option> 
					</select> 
					<input type="text" name="keyword">
				<input type="button" class="btn_search" value="검색" onClick="javascript:go_search()">
				</td>
  				</tr>
  				<tr>
  				<td>
  					<input type="button" class="searchbtn" value="구입 품목 가격 높은순" onClick="location.href='ad_order_sell.jsp'">
  				  	<input type="button" class="searchbtn" value="구입날짜 일주일내" onClick="location.href='ad_order_week.jsp'">
  				  	<input type="button" class="searchbtn" value="구입날짜 한달내" onClick="location.href='ad_order_month.jsp'">
  				  	<input type="button" class="searchbtn" value="구입날짜 1년내" onClick="location.href='ad_order_year.jsp'">
  				</td>
  				</tr>
				</table>
			</form>
				<table class="membertable" style="margin:auto">         	
           		 <tr>
           	     <th>주문번호</th>
               	 <th>상품명</th>
               	 <th>아이디</th>
              	 <th>가격</th>
                 <th>사이즈</th> 
                 <th>주문자 이름</th> 
				 <th>연락처</th>
				 <th>주소</th>
				 </tr>
			<%try {
				Class.forName("com.mysql.jdbc.Driver"); 
		 		Connection Conn = DriverManager.getConnection(url,user,password); 
		 		PreparedStatement stmt = Conn.prepareStatement(sql);
				 
				rs= stmt.executeQuery();
				
  			 	while(rs.next()){
  			 		
  		 			int order_num = rs.getInt("order_num");
  		 			String item_name = rs.getString("item_name");
  		 			String id = rs.getString("id");
  		 			int cost = rs.getInt("cost");
  		 			String size = rs.getString("size");
  		 			String mem_name = rs.getString("mem_name");
  		 			String phone = rs.getString("phone");
  		 			String addr = rs.getString("addr");
  		 			
  				%>
    				<tr>
  		        	<td><%=order_num %></td>
  		       		<td><%=item_name %></td>
  		        	<td><%=id %></td>
  		        	<td><%=cost %></td>
  		        	<td><%=size %></td>
  		        	<td><%=mem_name %></td>
  		        	<td><%=phone %></td>
  		        	<td><%=addr %>
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