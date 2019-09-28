<%@ page language="java" import="java.sql.*, java.lang.*, java.util.* " contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
	String id=(String)session.getAttribute("id");
	int i;
	
	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?autoReconnect=true&useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";
	
	String sql = "select * from itemorder where id= '"+id+"'";
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
	padding-top:40px;
	text-align : center;
}

table.ordertable {
	width:70%;
	border:0;
	align:center;
	border:1px solid #f2f2f2;
	border-right:1px solid #f2f2f2;
	border-collapse:collapse;
}
table.ordertable th{
	border:1px solid #f2f2f2;
	padding:6px;
	text-align:center;
	background-color:#f2f2f2;
	font-family:NanumSquareRound;
}
table.ordertable td{
	text-align: center;
	padding-left:10px;
	border-bottom: 1px solid #f2f2f2;
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
.reviewbtn{
	width:80px;
	height:30px;
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
 			<div class=menuname>
			<a href="order.jsp" style="text-decoration:none;">ORDER</a></div>
			<table class="ordertable" style="margin:auto">
            <tr>
               <th>주문 번호</th>
               <th>상품정보</th>
               <th>구매 금액</th>
               <th>주문 일자</th>
               <th>후기</th>
            </tr>
			<%
			try{
				Class.forName("com.mysql.jdbc.Driver"); 
	 			Connection Conn = DriverManager.getConnection(url,user,password); 
	 			PreparedStatement stmt = Conn.prepareStatement(sql);

				//상품쿼리실행
				rs = stmt.executeQuery();
				while(rs.next()){
					int order_num = rs.getInt("order_num");
				    String item_name = rs.getString("item_name");
				    String[] p_name = item_name.split(",");
				    int cost=rs.getInt("cost");
				    String size = rs.getString("size");
				    String order_date = rs.getString("order_date");
				    String product_name ="";
				    for (i = 0; i < p_name.length; i++){
				    	
				    }
		 	%>
            	<tr>
                	<td><%=order_num %></td>
                	<td><%  for (i = 0; i < p_name.length; i++) {
                			out.println(p_name[i]+ "<br/>");}%><br>
                	[사이즈 : <%= size %>]</td>
                	<td><%=cost %></td>
                	<td><%=order_date %></td>
                	<td><input type="button" class="reviewbtn" value="후기" onClick="location.href='review.jsp?order_num=<%=order_num%>&item_name=<%=item_name%>'"></td>
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
   			<br>
  			<input type="button" class="btn" value="메인화면 가기" onclick="location.href='index.jsp'">
		</div>
	</div>
	</div>
</body>
</html>