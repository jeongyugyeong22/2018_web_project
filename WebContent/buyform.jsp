<%@ page language="java" import="java.sql.*, java.lang.*, java.util.* " contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");

	String id=(String)session.getAttribute("id");
	String item_name=request.getParameter("item_name");
	
	String mem_name="";
	String phone="";
	String addr="";
	int point=0;
	int msg = 0;
	int new_point=0;
	
	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?autoReconnect=true&useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";
	
	int total = 0;
	int delivery_cost = 2500;
	int ordertotal = 0;
	int count = 0;
	List<String> p_name = new ArrayList<String>();
	List<String> p_size = new ArrayList<String>();
	
	String sql_cart = "select * from cart where id= '"+id+"'";
	String sql_member = "select * from member where id = '"+id+"'";
	String sql_detail = "select * from item where item_name='"+item_name+"'";
	
	 if(request.getParameter("msg") != null)
		 msg = Integer.parseInt(request.getParameter("msg"));
	 
	ResultSet rs = null;
	ResultSet rs2 = null;

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
h2{
	font-family:NanumSquareRound;
}
.title{
	padding-top:5%;
}
.content{
	padding-top:5%;
	text-align : center;
}

table.carttable {
	padding-top:7%;
	width:70%;
	border:0;
	align:center;
	border:1px solid #f2f2f2;
	border-right:1px solid #f2f2f2;
	border-collapse:collapse;
}
table.carttable th{
	border:1px solid #f2f2f2;
	padding:6px;
	text-align:center;
	background-color:#f2f2f2;
	font-family:NanumSquareRound;
}
table.carttable td{
	text-align: center;
	padding-left:10px;
	border-bottom: 1px solid #f2f2f2;
	font-family:NanumSquareRound;
}
caption{
	font-family:NanumSquareRound;
	padding-bottom:2%;
	text-align:left;
	font-weight:bold;
}
table.ordertable {
	width:70%;
	border:0;
	border:1px solid #f2f2f2;
	border-right:1px solid #f2f2f2;
	border-collapse:collapse;
}
table.ordertable th{
	border:1px solid #f2f2f2;
	padding:6px;
	text-align:left;
	font-weight:lighter;
	background-color:#f2f2f2;
	font-family:NanumSquareRound;
	height:50px;
}
table.ordertable td{
	text-align: left;
	padding-left:10px;
	border-bottom: 1px solid #f2f2f2;
	font-family:NanumSquareRound;
	height:50px;
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
.cost{
	padding-top:3%;
    font-family:NanumSquareRound;
    font-size: 15px;
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
			<a href="cart.jsp" style="text-decoration:none;">주문서</a></div>
			
  			<form name="buyinput" method="post" action="buyPro.jsp" onsubmit="return buysave()">
			<table class="carttable" style="margin:auto">
            <tr>
               <th>이미지</th>
               <th>상품명</th>
               <th>수량</th>
               <th>금액</th>
            </tr>
			
			<%
			if(msg==1){
			try{
				Class.forName("com.mysql.jdbc.Driver"); 
	 			Connection Conn = DriverManager.getConnection(url,user,password); 
	 			PreparedStatement stmt = Conn.prepareStatement(sql_cart);

				//상품쿼리실행
				rs = stmt.executeQuery();
				
				while(rs.next()){
		 			String itemname=rs.getString("item_name");
		 			int cost=rs.getInt("cost");
		 			String image=rs.getString("image");
		 			String size=rs.getString("size");
		 			String st_count=rs.getString("count");
		 			point = rs.getInt("point");
		 			count= Integer.parseInt(st_count);
		 			total +=  count * cost;
		 			ordertotal = total + delivery_cost;
					new_point += point;
					
					p_name.add(itemname);
					p_size.add(size);
		 		%>
            	<tr>
                	<td><img src="<%=image %>" height="40%"></td>
                	<td><%=itemname %><br>
                	[사이즈 : <%= size %>]</td>
                	<td><%=count %></td>
                	<td><%=cost %></td>
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
			}
			else{
			if(session.getAttribute("id")==null){
					response.sendRedirect("login.jsp");
			}
			else{	
			try{
				Class.forName("com.mysql.jdbc.Driver"); 
	 			Connection Conn = DriverManager.getConnection(url,user,password); 
	 			PreparedStatement stmt = Conn.prepareStatement(sql_detail);

				//상품쿼리실행
				rs = stmt.executeQuery();
				
				while(rs.next()){
					String st_cost=request.getParameter("cost");
					int cost = Integer.parseInt(st_cost);
					String image=request.getParameter("image");
					String size=request.getParameter("detailSize");
					String st_count=request.getParameter("buy_count");
					count = Integer.parseInt(st_count);
					new_point = (int)(cost * 0.01);
					
		 			total +=  count * cost;
		 			ordertotal = total + delivery_cost;
		 			
					p_name.add(item_name);
					p_size.add(size);
		 		%>
            	<tr>
                	<td><img src="<%=image %>" height="40%"></td>
                	<td><%=item_name %><br>
                	[사이즈 : <%= size %>]</td>
                	<td><%=count %></td>
                	<td><%=cost %></td>
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
			}
		}
		%>
		</tr>
   		</table>
  			<div class = "cost">
  			<hr width="60%">
  				상품구매금액 <%=total %> + 배송비 <%=delivery_cost %> = 합계 : <%=ordertotal %>
  			<hr width="60%">
  			</div>
  			<br>
  		<%
  		try{
			Class.forName("com.mysql.jdbc.Driver"); 
 			Connection Conn = DriverManager.getConnection(url,user,password); 
 			PreparedStatement stmt = Conn.prepareStatement(sql_member);

			//상품쿼리실행
			rs2 = stmt.executeQuery();
			
			while(rs2.next()){
				mem_name = rs2.getString("mem_name");
				phone = rs2.getString("phone");
				addr = rs2.getString("addr");
				point = rs2.getInt("point");
				
	 		%>
  		
			<table class="ordertable" style="margin:auto">
			<caption>주문자 정보</caption>
			<tr>
			<th scope="row">성명</th>							<!-- 비밀번호 -->
			<td> <input type="text" name="name" value="<%=mem_name %>" size="25" maxlength="20"></td>
			</tr>
			<tr>
			<th scope="row">핸드폰 번호</th>						<!-- 핸드폰 번호 -->
			<td><input type="text" name="phone" value="<%=phone %>" size="25" maxlength="12"> ('-'없이 입력하세요.)</td>
			</tr>
			<tr>
			<th scope="row">주소</th>							<!-- 주소 -->
			<td><input type="text" name="address" value="<%=addr %>" size="50"></td>
			</tr>
			</table>
			<br>
			<table class="ordertable" style="margin:auto">
			<caption>배송지 정보</caption>
			<tr>
			<th scope="row">성명</th>							<!-- 비밀번호 -->
			<td> <input type="text" name="de_name" value="<%=mem_name %>" size="25" maxlength="20"></td>
			</tr>
			<tr>
			<th scope="row">핸드폰 번호</th>						<!-- 핸드폰 번호 -->
			<td><input type="text" name="de_phone" value="<%=phone %>" size="25" maxlength="12"> ('-'없이 입력하세요.)</td>
			</tr>
			<tr>
			<th scope="row">주소</th>							<!-- 주소 -->
			<td><input type="text" name="de_address" value="<%=addr %>" size="50"></td>
			</tr>
			</table>
			<br>
			<table class="ordertable" style="margin:auto">
			<caption>결제 정보</caption>
			<tr>
			<th scope="row">포인트 사용</th>							<!-- 포인트 사용 -->
			<td> <input type="text" name="use_point" value="0" size="25" maxlength="20"> (총 사용가능 포인트 : <%=point %>)</td>
			</tr>
			<tr>
			<th scope="row">결제 방식</th>							<!-- 결제 방식 -->
			<td>무통장 입금</td>
			</tr>
			</table>
			<br>
			<input type = "hidden" name ="point" value="<%=point %>">
			<input type = "hidden" name ="pointsum" value="<%= new_point %>">
			<input type = "hidden" name ="ordertotal" value = "<%=ordertotal%>">
			<input type = "hidden" name ="count" value = "<%=count%>">
			<input type = "hidden" name ="p_name" value ="<%=p_name %>">
			<input type = "hidden" name ="p_size" value ="<%=p_size %>">
  			<input type="submit" class="btn" value="구매하기">
  			<input type="button" class="btn" value="취소" onclick="location.href='index.jsp'">
			</form>
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
  			<br>
  		<script>
  		function buysave(){	
  			var buy = document.buyinput;
  			 if(buy.name.value == ""){
  			 	alert("이름을 입력해 주세요.");
  			 	buy.name.focus();
  			}
  			else if(buy.phone.value == ""){
  			 	alert("연락처를 입력해 주세요.");
  			 	buy.phone.focus();
  			}		
  		 	else if((buy.phone.value < "0"||buy.phone.value > "9")&&(buy.phone.value < "A"|| buy.phone.value > "Z")&&(buy.phone.value < "a"||buy.phone.value > "z")){
  				alert("핸드폰 번호에 한글 및 특수문자는 사용하실 수 없습니다.");
  				buy.phone.focus();	
  			}
  		 	else if(buy.address.value == ""){
  			 	alert("주소를 입력해 주세요.");
  			 	buy.address.focus();
  			 }
  		 	else if(buy.use_point.value > <%=point%>)
  			 {
  			 	alert("포인트 사용 숫자가 초과되었습니다.");
  			 	buy.use_point.focus();
  			 }
  		}  
  		</script>
		</div>
	</div>
	</div>
</body>
</html>