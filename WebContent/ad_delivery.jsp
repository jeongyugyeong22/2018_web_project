<%@ page language="java" import="java.sql.*, java.lang.*, java.util.* " contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?autoReconnect=true&useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";

	String sql = "select * from delivery";

	ResultSet rs = null;

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댕신사-배송관리</title>
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
</style>
<script type="text/javascript">
	function go_search(){
		var frm = document.frm;

		var target = document.getElementById("searchName");
		var searchName = target.options[target.selectedIndex].value;

		location.href = "ad_deliverysearch.jsp?keyword="+frm.keyword.value+"&searchName="+searchName;
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
				<a href="ad_delivery.jsp" style="text-decoration:none;">배송관리</a>
			</div> 
			
			<form name="frm" method="post">
				<input type="hidden" name="seq">
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
				</table>
				
				<table class="itemtable" style="margin:auto">         	
           		 <tr>
           	     <th>배송번호</th>
               	 <th>상품번호</th>
               	 <th>아이디</th>
              	 <th>핸드폰번호</th>
                 <th>주소</th> 
                 <th>배송비</th> 
				 </tr>
			<%try {
				Class.forName("com.mysql.jdbc.Driver"); 
		 		Connection Conn = DriverManager.getConnection(url,user,password); 
		 		PreparedStatement stmt = Conn.prepareStatement(sql);
				 
				rs= stmt.executeQuery();
				
  			 	while(rs.next()){
  			 		
  		 			int delivery_num = rs.getInt("delivery_num");
  		 			int order_num = rs.getInt("order_num");
  		 			String id = rs.getString("id");
  		 			String phone = rs.getString("phone");
  		 			String address = rs.getString("addr");
  		 			String delivery_cost = rs.getString("delivery_cost");
  		 			
  				%>
  				<tr>
  		        	<td><%=delivery_num %></td>
  		       		<td><%=order_num %></td>
  		        	<td><%=id %></td>
  		        	<td><%=phone %></td>
  		        	<td><%=address %></td>
  		        	<td><%=delivery_cost %>
				
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
  			 </table>	   	
  			 </form>
		</div>
	</div>
	</div>

</body>
</html>