
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
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

</style>
<script type="text/javascript">	
	function openmenu() {
	    document.getElementById("Sidemenu").style.width = "200px";
	    document.getElementById("main").style.marginLeft = "200px";
	    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
	}

	function closemenu() {
	    document.getElementById("Sidemenu").style.width = "0";
	    document.getElementById("main").style.marginLeft= "0";
	    document.body.style.backgroundColor = "white";
	}
	
</script>
</head>
<body>
	<div id="Sidemenu" class="sidemenu">				<!-- 메뉴 -->
 		<a href=# class="closebtn" onclick="javascript:closemenu()">&times;</a>
 		<a href="allitem.jsp">ALL ITEM</a>
  		<a href="top.jsp">TOP</a>
  		<a href="dress.jsp">DRESS</a>
  		<a href="outer.jsp">OUTER</a>
 		<a href="allinone.jsp">ALL-IN-ONE</a>
 		<a href="acc.jsp">ACC</a>
 		<hr width="150px">
 		<a href="athome.jsp">AT HOME</a>
 		<a href="goout.jsp">GO OUT</a>
 		<hr width="150px">
 		<a href="notice.jsp">NOTICE</a>
 		<a href="sale.jsp">SALE</a>
 		<a href="q&a.jsp">Q&A</a>
	</div>
	
	<div id="main">												<!-- 메인 내용 -->
		<div class="container" onClick="javascript:openmenu();">	<!-- 메뉴표시 -->
 	 		<div class="menu">
 	 			menu &#10095
 	 		</div>
		</div>

	<div style="padding:0px 0px 300px;">							<!-- 스크롤 -->
		<nav class="header">										<!-- 메뉴 -->
			<form id="search_form" method="post" action="my_search.jsp">
			<input type="text" placeholder="SEARCH"> <!-- 검색창 -->
			<input type="submit" id="mysearch" value="SEARCH"></form>
			<a href="join.jsp">회원가입|</a>
			<a href="cart.jsp">장바구니</a>
			<a href="order.jsp">주문조회</a>
			<a href="login.jsp">로그인 </a>
		</nav>
		<a href="index.jsp">
			<img src="title.png" style="margin-left: auto; margin-right: auto; display:block;" height=100px>
		</a>
<script type="text/javascript">	
	function openmenu() {
	    document.getElementById("Sidemenu").style.width = "200px";
	    document.getElementById("main").style.marginLeft = "200px";
	    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
	}

	function closemenu() {
	    document.getElementById("Sidemenu").style.width = "0";
	    document.getElementById("main").style.marginLeft= "0";
	    document.body.style.backgroundColor = "white";
	}
	
</script>
</head>
<body> 
<form action="write" method="post"> 
<table border="1" style="width: 80%"> 
 		<tr> 
 			<td>작성자</td> 
 			<td><input type="text" name="name"></td> 
 		</tr> 
 		<tr> 
 			<td>글제목</td> 
 			<td><input type="Text" name="title"></td> 
 		</tr> 
 		<tr> 
 			<td>글내용</td> 
 			<td><textarea rows="5" cols="20" name="cont"></textarea> 
 		</tr> 
 		<tr> 
 			<Td colspan="5" style="text-align: center;"> 
 				<input type="hidden" name="bip" value="<%=request.getRemoteAddr() %>"> 
 				<input type="submit" value="입력 완료" > 
 				<input type="button" value="목  록" onclick="location.href='list?page=1"> 
 			</Td> 
 		</tr> 
</table> 
</form> 
</body> 
</html> 
