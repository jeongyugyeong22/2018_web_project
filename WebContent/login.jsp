<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
   request.setCharacterEncoding("UTF-8");
   String msg = request.getParameter("msg");
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
	padding-top:100px;
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
.findbtn{
	width:100px;
	height:30px;
	border : 1px solid white;
    background-color: white;
    color: black;
    text-align: center;
    font-family:NanumSquareRound;
    font-size: 11px;
    margin :  auto;
    cursor: pointer;
}

h2{
	font-family:NanumSquareRound;
}
table.logintable {
    border-top: 1px solid #c4c4c4;
    border-bottom: 1px solid #c4c4c4;
}

table.logintable th{
    width: 150px;
    text-align: left;
    padding: 10px;
    border: 1px solid #f2f2f2;
    background: #f2f2f2;
    font-weight:lighter;
    font-family:NanumSquareRound;
    font-size:15px;
}
table.logintable td{
	text-align: left;
	padding-left:10px;
	border-bottom: 1px solid #f2f2f2;
}
</style>
<script language ="javascript">
function login_check(){
	var login = document.loginform;
	if(login.id.value == ""){
		alert("아이디를 입력하세요.");
		login.id.focus();
	}
	else if(login.pw.value==""){
		alert("비밀번호를 입력하세요.");
		login.pw.focus();
	}
	else{
			login.action="./logincheck.jsp";
			login.submit();
		}
	}
function show_msg(msg){
	if(msg == 1){
		alert("가입되었습니다.");
	}
	else if(msg == 2){
		alert("오류가 발생되었습니다.");
	}
}
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
<body onLoad="show_msg('<%=msg%>');">

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
		<h2>로그인</h2>
		<form name="loginform" method="post">
		<table class="logintable" style="margin:auto">
		<tr>
		<th scope="row">아이디</th>							<!-- id -->
		<td> <input type="text" name="id" size="25" maxlength="20" ></td>
		</tr>
		<tr>
		<th scope="row">비밀번호</th>							<!-- 비밀번호 -->
		<td> <input type="password" name="pw" size="25" maxlength="20"></td>
		</tr>
		</table>
		<br>
		<input type="button" class="btn" value="로그인" onClick="javascript:login_check();"> <!-- 로그인 버튼 -->
		<input type="button" class="btn" value="취소" onClick="location.href='index.jsp'"> <!-- 취소버튼 -->
		<br><input type="button" class="findbtn" value="아이디 찾기" onClick="location.href='idfind.jsp'">
		<input type="button" class="findbtn" value="비밀번호 찾기" onClick="location.href='pwfind.jsp'">
		</form>
		</div>
		</div>
</body>
</html>