<%@ page language="java" import="java.sql.*, java.lang.*, java.util.* " contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String category = request.getParameter("category");

	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";

	String sql = "select * from item where category= 'toy'";

	ResultSet rs = null;

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댕신사</title>
<link href='indexstyle.css' rel='stylesheet' style="text/css"/>
<link href='goodscss.css' rel='stylesheet' style="text/css"/>
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

		<%@ include file="index_top.jsp"%>	<!-- 상단바 -->
				
		<div class="title">
		<a href="index.jsp">
		<img src="title.png" style="margin-left: auto; margin-right: auto; display:block;" height=100px>
		</a>
		</div>
		
		<div class="content">							<!-- 내용부분 -->
			<div class=menuname>
			<a href="athome.jsp" style="text-decoration:none;">AT HOME</a></div>
			<div class="detail" style="color:#1C1C1C;">
			<a href="cushion.jsp">CUSHION</a>
			<a href="house.jsp">HOUSE</a>
			<a href="toy.jsp">TOY</a>
			</div>
			<%
			Class.forName("com.mysql.jdbc.Driver"); 
	 		Connection Conn = DriverManager.getConnection(url,user,password); 
	 		PreparedStatement stmt = Conn.prepareStatement(sql);
	 		
			//상품쿼리실행
			rs = stmt.executeQuery();
			while(rs.next()){
				
 			String item_name = rs.getString("item_name");
 			String price=rs.getString("cost");
 			String image = rs.getString("image");
 			int count = rs.getInt("count");
 			if(count!=0){
 			%>
			<div class="goods">
				<a href="product_detail.jsp?item_name=<%=item_name%>" style="text-decoration:none;">
				<img src=<%=image %> width="70%">
				<p><div class="name"><%=item_name %><br>
				<%=price %>원</div></a>
			</div>
			<%}else{ %>
			<div class="goods">
				<img src=<%=image %> width="70%">
				<p><div class="name"><%=item_name %><br>
				품절</div>
			</div>
			<%} %>
		<%
		}
		rs.close();

		%> 
		</div>
		</div>

</body>
</html>