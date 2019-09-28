<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<link href='indexstyle.css' rel='stylesheet' style="text/css"/>

		<div class="header">										<!-- 메뉴 -->
			<form id="search_form" method="post" action="my_search.jsp">
			<input type="text" name="keyword" placeholder="SEARCH"> <!-- 검색창 -->
			<input type="submit" class="mysearchbtn" value="SEARCH">
			</form>

			<%
			if(session.getAttribute("id")==null){%>
				<a href="join.jsp">회원가입 </a>
				<a href="login.jsp">로그인 </a>
			<%}else{%>
				<a href="order.jsp">주문조회</a>
				<a href="cart.jsp">장바구니</a>
				<a href="mypage.jsp">마이페이지</a>
				<a href="logout.jsp"><%=(String)session.getAttribute("id")%>님! 로그아웃 </a>
			<%}
			%>
	</div>