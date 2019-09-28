
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
.title{
	padding-top:5%;
}
.content{
	padding-top:40px;
	text-align : center;
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
table.writetable {
    border-top: 1px solid #c4c4c4;
    border-bottom: 1px solid #c4c4c4;
}

table.writetable th{
    width: 150px;
    text-align: left;
    padding: 10px;
    border: 1px solid #f2f2f2;
    background: #f2f2f2;
    font-weight:lighter;
    font-family:NanumSquareRound;
    font-size:15px;
}
table.writetable td{
	text-align: left;
	padding-left:10px;
	border-bottom: 1px solid #f2f2f2;
}
.contents{
	width:100%;
	height:50%;
	resize: none;
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
			<a href="q&a.jsp" style="text-decoration:none;">Q&A</a>
		</div> 
		<form name="write" method="post" action="qnawritePro.jsp"> 
		<table class="writetable" style="margin:auto;"> 
			<tr>
			<th scope="row">작성자</th>
			<td> <input type="text" name="name" size="80%"></td>
			</tr>
			<tr>
			<th scope="row">글 제목</th>
			<td> <input type="text" name="title" size="80%"></td>
			</tr>
			<tr>
			<th scope="row">글 내용</th>
			<td><textarea name="content" class="contents" rows="15"></textarea></td>
			</tr>
			<tr>
			<th scope="row">비밀번호</th>
			<td><input type="password" name="pw" size="40%"></td>
			</tr>
 		</table>
 			<br>
 			<input type="submit" class="btn" value="입력 완료"> 
 			<input type="button" class="btn" value="목  록" onclick="location.href='qna.jsp'"> 
		</form>
		</div>
	</div>
	</div>
</body> 
</html> 
