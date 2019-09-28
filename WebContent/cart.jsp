<%@ page language="java" import="java.sql.*, java.lang.*, java.util.* " contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
	String msg = request.getParameter("msg");
	String id=(String)session.getAttribute("id");

	int i;
	
	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?autoReconnect=true&useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";
	
	int total = 0;
	int delivery_cost = 2500;
	int ordertotal = 0;
	
	String sql = "select * from cart where id= '"+id+"'";
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
h2{
	font-family:NanumSquareRound;
}
.content img{
	height:100px;
}
.title{
	padding-top:5%;
}
.content{
	padding-top:3%;
	text-align : center;
}

table.carttable {
	padding-top:5%;
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
.del_btn{
	width:80px;
	height:30px;
	border : 1px solid black;
    background-color: white;
    text-decoration:none;
    text-align: center;
    font-family:NanumSquareRound;
    font-size: 13px;
    margin :  auto;
    cursor: pointer;
    padding:3px;
    vertical-align:middle;
}
.cost{
	padding-top:3%;
    font-family:NanumSquareRound;
    font-size: 15px;
}
.change_btn{
	width:40px;
	height:30px;
	border : 1px solid black;
    background-color: white;
    text-decoration:none;
    text-align: center;
    font-family:NanumSquareRound;
    font-size: 13px;
    margin :  auto;
    cursor: pointer;
    padding:3px;
    vertical-align:middle;
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
			alert("상품이 삭제되었습니다.");
		}
		else if(msg == 2){
			alert("오류가 발생했습니다.");
		}
		else if(msg == 3){
			alert("수정되었습니다.");
		}
		else if(msg == 4){
			alert("오류가 발생했습니다.");
		}
	}
	
	function go_change(){
		var frm = document.updateForm;

		if(frm.change_count.value == ""){
			alert("수량을 입력해 주세요!");
		}
		else if((frm.change_count.value < "0"||frm.change_count.value > "9")&&(frm.change_count.value < "A"|| frm.change_count.value > "Z")&&(frm.change_count.value < "a"||frm.change_count.value > "z")){
			alert("한글 및 특수문자는 사용하실 수 없습니다.");
		}
		else{
				frm.action = "updatecart.jsp";
				frm.submit();
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

	<div style="padding:0px 0px 300px;">							<!-- 스크롤 -->
	
		<%@ include file="index_top.jsp"%>	<!-- 상단바 -->

		<div class="title">
		<a href="index.jsp">
		<img src="title.png" style="margin-left: auto; margin-right: auto; display:block;" height=100px>
		</a>
		</div>
    
   		<div class="content">
 			<div class=menuname>
			<a href="cart.jsp" style="text-decoration:none;">CART</a></div>
			<form name="cartform" method="post">
			<table class="carttable" style="margin:auto">
            <tr>
               <th>이미지</th>
               <th>상품명</th>
               <th>수량</th>
               <th>금액</th>
               <th>삭제</th>
            </tr>

			<%
			try{
				Class.forName("com.mysql.jdbc.Driver"); 
	 			Connection Conn = DriverManager.getConnection(url,user,password); 
	 			PreparedStatement stmt = Conn.prepareStatement(sql);

				//상품쿼리실행
				rs = stmt.executeQuery();
				while(rs.next()){
					int item_num = rs.getInt("item_num");
		 			String item_name=rs.getString("item_name");
		 			int cost=rs.getInt("cost");
		 			String image=rs.getString("image");
		 			String size=rs.getString("size");
		 			String st_count=rs.getString("count");
		 			int count= Integer.parseInt(st_count);
		 			total +=  count * cost;
		 			ordertotal = total + delivery_cost;
		 	%>
            	<tr>
                	<td><img src="<%=image %>"></td>
                	<td><%=item_name %><br>
                	[사이즈 : <%= size %>]</td>
                	<td><%=count %></td>
                	<td><%=cost * count %></td>
                	<td><input type="button" class="del_btn" value="삭제"onclick="location.href='cartlistdel.jsp?item_num=<%=item_num %>&id=<%=id %>'"></td>
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
  			<div class = "cost">
  			<hr width="60%">
  				상품구매금액 <%=total %> + 배송비 <%=delivery_cost %> = 합계 : <%=ordertotal %>
  			<hr width="60%">
  			</div>
  			<br>
  			<input type="button" class="btn" value="메인화면 가기" onclick="location.href='index.jsp'">
  			<input type="button" class="btn" value="구매하기" onclick="location.href='buyform.jsp?msg=1'">
		</div>
	</div>
	</div>
</body>
</html>