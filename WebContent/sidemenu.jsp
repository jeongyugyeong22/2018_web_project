<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

function closemenu() {
    document.getElementById("Sidemenu").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
    document.body.style.backgroundColor = "white";
}
</script>
</head>
<link href='indexstyle.css' rel='stylesheet' style="text/css"/>
	<div id="Sidemenu" class="sidemenu">				<!-- 카테고리 -->
 		<a href=# class="closebtn" onclick="closemenu()">&times;</a>
 		<%if("admin".equals((String)session.getAttribute("id"))) {%>
 		<a href="ad_member.jsp">회원관리</a>
  		<!-- <a href="ad_additem.jsp">상품등록</a> -->
  		<a href="ad_item.jsp">상품관리</a>
 		<a href="ad_order.jsp">주문관리</a>
 		<a href="ad_delivery.jsp">배송관리</a>
 		<a href="notice.jsp">공지사항 관리</a>
 		<a href="qna.jsp">q&a 관리</a>
 		<%}else{%>
 		<a href="allitem.jsp">ALL ITEM</a>
  		<a href="top.jsp">TOP</a>
  		<a href="dress.jsp">DRESS</a>
  		<a href="outer.jsp">OUTER</a>
 		<a href="allinone.jsp">ALL-IN-ONE</a>
 		<a href="acc.jsp">ACC</a>
 		<hr width="150px">
 		<a href="athome.jsp">AT-HOME</a>
 		<a href="goout.jsp">GO OUT</a>
 		<hr width="150px">
 		<a href="sale.jsp">SALE</a>
 		<a href="notice.jsp">NOTICE</a>
 		<a href="qna.jsp">Q&A</a>
 		<%} %>
	</div>