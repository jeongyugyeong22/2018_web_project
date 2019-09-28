<%@ page language="java" import="java.sql.*, java.lang.*, java.util.* " contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?autoReconnect=true&useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";

	String sql = "select * from item";

	ResultSet rs = null;

	Class.forName("com.mysql.jdbc.Driver"); 
	Connection pConn = DriverManager.getConnection(url,user,password); 
	PreparedStatement pstmt = null;
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댕신사-상품관리</title>
<link href='indexstyle.css' rel='stylesheet' style="text/css"/>
<style>
.title{
	padding-top:5%;
}
.content{				/* 내용 */
	padding-top:3%;
	text-align : center;
}
table.itemtable{
	width:80%;
    border-bottom: 1px solid #c4c4c4;
    padding-top:5%;
}
table.itemtable th{
    width: 100px;
    text-align: center;
    padding: 10px;
    border: 1px solid #f2f2f2;
    background: #f2f2f2;
    font-weight:lighter;
    font-family:NanumSquareRound;
    font-size:15px;
}
table.itemtable td{
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
.btn{
	width:80px;
	height:30px;
	border : 1px solid black;
	background-color : white;
	text-align:center;
	font-family:NanumSquareRound;
	font-size: 13px;
	cursor: pointer;
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
<script type="text/javascript">
	function go_search(){
		var frm = document.frm;
		
		var target = document.getElementById("searchName");
		var searchName = target.options[target.selectedIndex].value;
		
		location.href = "ad_itemsearch.jsp?keyword="+frm.keyword.value+"&searchName="+searchName;
	}
 	function openmenu() {
	    document.getElementById("Sidemenu").style.width = "200px";
	    document.getElementById("main").style.marginLeft = "200px";
	    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
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
	
	<jsp:include page="index_top.jsp"/>	<!-- 상단바 -->
	
		
		<div class="title">
		<a href="index.jsp">
		<img src="title.png" style="margin-left: auto; margin-right: auto; display:block;" height=100px>
		</a>
		</div>
		
		<div class="content">							<!-- 내용부분 -->
			<div class=menuname>
				<a href="ad_item.jsp" style="text-decoration:none;">상품관리</a>
			</div> 
			
				<form name="frm" method="post">
				<table class=searchtable style="margin:auto">
  				<tr>
     			<td>
 					<select name="searchName" id = "searchName"> 
 						<option value="name">이름</option> 
 						<option value="category">카테고리</option> 
 						<option value="color">색상</option> 
					</select> 
					<input type="text" name="keyword">
				<input type="button" class="btn_search" value="검색" onClick="javascript:go_search()">
				</td>
  				</tr>
  				<tr>
  				<td>
					<input type="button" class="searchbtn" value="재고 많은 순" onClick="location.href='ad_item_count.jsp'">
  				  	<input type="button" class="searchbtn" value="판매 많은 순" onClick="location.href='ad_item_sell.jsp'">
  				 </td>
  				</tr>
				</table>
			</form>
			
				<table class="itemtable" style="margin:auto">         	
           		 <tr>
           	     <th>상품번호</th>
               	 <th>상품명</th>
               	 <th>가격</th>
              	 <th>사이즈</th>
                 <th>색상</th> 
                 <th>카테고리</th> 
				 <th>재고</th>
				 <th>이미지</th>
				 </tr>
			<%try {
				Class.forName("com.mysql.jdbc.Driver"); 
				Connection Conn = DriverManager.getConnection(url,user,password); 
				PreparedStatement stmt = Conn.prepareStatement(sql);
				 
				rs= stmt.executeQuery();
				
  			 	while(rs.next()){
  			 		
  		 			String item_num = rs.getString("item_num");
  		 			String item_name = rs.getString("item_name");
  		 			int cost = rs.getInt("cost");
  		 			String size = rs.getString("size");
  		 			String color = rs.getString("color");
  		 			String category = rs.getString("category");
  		 			int count = rs.getInt("count");
  		 			String img = rs.getString("image");
  		 			
  				%>
  				<tr>
  		        	<td><%=item_num %></td>
  		       		<td><%=item_name %></td>
  		        	<td><%=cost %></td>
  		        	<td><%=size %></td>
  		        	<td><%=color %></td>
  		        	<td><%=category %></td>
  		        	<td><%=count %></td>
  		        	<td><%=img %>
				
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