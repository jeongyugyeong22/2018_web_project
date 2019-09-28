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

h2{
	font-family:NanumSquareRound;
}
table.findtable {
    border-top: 1px solid #c4c4c4;
    border-bottom: 1px solid #c4c4c4;
}

table.findtable th{
    width: 150px;
    text-align: left;
    padding: 10px;
    border: 1px solid #f2f2f2;
    background: #f2f2f2;
    font-weight:lighter;
    font-family:NanumSquareRound;
    font-size:15px;
}
table.findtable td{
	text-align: left;
	padding-left:10px;
	border-bottom: 1px solid #f2f2f2;
}
</style>
<script language ="javascript">
function id_find(){
	var find = document.findform;
	if(find.mem_name.value == ""){
		alert("이름 입력하세요.");
		find.mem_name.focus();
	}
	else if(find.phone.value==""){
		alert("핸드폰번호를 입력하세요.");
		find.phone.focus();
	}
	else if((find.phone.value < "0"||find.phone.value > "9")&&(find.phone.value < "A"|| find.phone.value > "Z")&&(find.phone.value < "a"||find.phone.value > "z")){
		alert("핸드폰 번호에 한글 및 특수문자는 사용하실 수 없습니다.");
	}
	else{
			find.action="./idfindcheck.jsp";
			find.submit();
		}
	}

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
		<h2>아이디 찾기</h2>
		<form name="findform" method="post">
		<table class="findtable" style="margin:auto">
		<tr>
		<th scope="row">이름</th>							<!-- 이름 -->
		<td> <input type="text" name="mem_name" size="25" maxlength="20" ></td>
		</tr>
		<tr>
		<th scope="row">핸드폰 번호</th>							<!-- 핸드폰 번호 -->
		<td> <input type="text" name="phone" size="25" maxlength="20">('-'없이 입력하세요.)</td>
		</tr>
		</table>
		<br>
		<input type="button" class="btn" value="찾기" onClick="javascript:id_find();"> <!-- 찾기 버튼 -->
		<input type="button" class="btn" value="취소" onClick="location.href='login.jsp'"> <!-- 취소버튼 -->
		</form>
		</div>
		</div>
</body>
</html>