<%@ page language="java" import="java.sql.*, java.lang.*, java.util.* " contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String item_name = request.getParameter("item_name");
	String msg = request.getParameter("msg");

	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";

	String sql = "select * from item where item_name='"+item_name+"'";
	
	int i = 0;
	int point = 0;

	String[] size = new String[10];
	 
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
hr{
	color:#f2f2f2;
}
.title{
	padding-top:5%;
}
.content{
	max-width:1100px;
	margin:auto;
	padding-top:3%;
	
}
.detail:after{
	max-width:1100px;
	text-align: center;
	margin-top:100px;
	display:table;
	clear:both;
}
.detail img{
	float: left;
	margin: 30px 60px 40px 50px;
}
h3{
    font-family:NanumSquareRound;
    text-align:center;
}
table.detailtable{
	width:50%;
    border-bottom: 1px solid #c4c4c4;
    padding-top:3%;
    position: relative;
	float: left;
	text-align: left;
}
table.detailtable th{
    width: 50px;
    text-align: left;
    padding: 10px;
    border-bottom: 1px solid #f2f2f2;
    font-weight:bold;
    font-family:NanumSquareRound;
    font-size:15px;
}
table.detailtable td{
	width:300px;
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
    display:inline-block;
}
</style>
<script type="text/javascript">	
	function openmenu() {
	    document.getElementById("Sidemenu").style.width = "200px";
	    document.getElementById("main").style.marginLeft = "200px";
	    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
	}
	
	function show_msg(msg){
		if(msg == 1){
			if(confirm("장바구니에 정상적으로 등록되었습니다. 장바구니로 이동하시겠습니까?"))
				location.href = "cart.jsp";
		}
		else if(msg == 2){
			alert("오류가 발생되었습니다.");
		}
	}
	
	function go_checkout()
	{		
		var frm = document.frm;
		
		if(frm.detailSize.value == "none"){
				alert("사이즈를 선택해 주세요!");
			}
		else if(frm.buy_count.value == ""){
			alert("수량을 입력해 주세요!");
		}
		else{
				frm.action = "buyform.jsp?msg=2";
				frm.submit();
		}	
	}
	
	function go_cart()
	{
		var frm = document.frm;

		if(frm.detailSize.value == "none"){
				alert("사이즈를 선택해 주세요!");
		}
		else if(frm.buy_count.value == ""){
			alert("수량을 입력해 주세요!");
		}
		else{
				frm.action = "cart_add.jsp";
				frm.submit()
		}
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
		
		<div style="padding:0px 0px 300px;">							<!-- 스크롤 -->
			
		<div class="title">
		<a href="index.jsp">
		<img src="title.png" style="margin-left: auto; margin-right: auto; display:block;" height=100px>
		</a>
		</div>
		
		<div class="content">							<!-- 내용부분 -->
		<%
			 Class.forName("com.mysql.jdbc.Driver"); 
			 Connection pConn = DriverManager.getConnection(url,user,password); 
			 PreparedStatement pstmt = pConn.prepareStatement(sql);

			 rs = pstmt.executeQuery();
		 
			 if(rs.next())
			 {
				 int item_num=rs.getInt("item_num");
		 		 int cost=rs.getInt("cost");
				 point = (int)(cost * 0.01);
		 		 String image = rs.getString("image");
				 size = (rs.getString("size")).split(",");
				 int count = rs.getInt("count");
				
				 %>
				<h3><%=item_name %></h3>
				<hr width="60%">
				<div class="detail">
				<img src="<%=image %>">
				<table class="detailtable">
					<tr>
					<th>상품 번호</th>
					<td><%=item_num %></td>
					</tr>
					<tr>
					<th>상품 이름</th>
					<td> <%=item_name %> </td>
					</tr>
					<tr>
						<th>판매가</th>
						<td><%=cost%> 원</td>
					</tr>
				<tr>
					<th>포인트</th>
					<td><%=point%> point</td>
				</tr>
				<tr>
					<th>배송비</th>
					<td>2,500원</td>
				</tr>
				<form name = "frm" method = "post">
					<tr>
					<th>사이즈</th>
					<td>
					<select name="detailSize" id="detailSize">
						<option selected value = "none"></option>
						<%
						for(i=0; i<size.length;i++)
						{%>
							<option value = "<%=size[i]%>"><%=size[i]%></option>
						<%}%>
					</select>
					</td>
					</tr>
					<tr>
					<th>수량</th>
					<td><input type="number" min="1" max="10" name="buy_count" value="1"> 개
					</td>
					</tr>
					<input type ="hidden" name ="image" value = "<%=image%>">
					<input type ="hidden" name ="item_num" value = "<%=item_num%>">
					<input type="hidden" name="item_name" value="<%=item_name %>">
  			   	 	<input type="hidden" name="cost" value="<%=cost%>">
  			   		<input type="hidden" name="point" value="<%=point%>">
				</form>
				</table>
				<p style="text-align:center;">
				<br><input type = "button" class="btn" value = "구 매" onClick = "javascript:go_checkout();">
				<input type = "button" class="btn" value = "장바구니" onClick = "javascript:go_cart();"></p>
				</div>
			</div>

		<% }%>		
	</div>
</div>
</body>
</html>