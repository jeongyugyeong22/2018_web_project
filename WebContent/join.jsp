<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE HTML>
<html>
<head>
<title>댕신사 - 회원가입</title>
<link href='indexstyle.css' rel='stylesheet' style="text/css/">
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

h2{
	font-family:NanumSquareRound;
}
table.jointable {
    border-top: 1px solid #c4c4c4;
    border-bottom: 1px solid #c4c4c4;
}

table.jointable th{
    width: 150px;
    text-align: left;
    padding: 10px;
    border: 1px solid #f2f2f2;
    background: #f2f2f2;
    font-weight:lighter;
    font-family:NanumSquareRound;
    font-size:15px;
}
table.jointable td{
	text-align: left;
	padding-left:10px;
	border-bottom: 1px solid #f2f2f2;
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
.checkbtn{
	width:100px;
	height:18px;
	border : 1px solid black;
	background-color : white;
	text-align:center;
	font-family:NanumSquareRound;
	font-size: 13px;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	function join_save(){
		var join = document.joinform;
		if(join.id.value == ""){
			alert("아이디를 입력하세요.");
			join.id.focus();
		}
		else if((join.id.value < "0"||join.id.value > "9")&&(join.id.value < "A"|| join.id.value > "Z")&&(join.id.value < "a"||join.id.value > "z")){
			alert("아이디에 한글 및 특수문자는 사용하실 수 없습니다.");
		}
		else if(join.pw.value==""){
			alert("비밀번호를 입력하세요.");
			join.pw.focus();
		}
		else if(join.confirmpw.value==""){
			alert("확인을 입력하세요.");
		}
		else if(join.pw.value!=join.confirmpw.value){
			alert("비밀번호와 비밀번호 확인이 다릅니다.");
		}
		else if(join.name.value==""){
			alert("이름을 입력하세요.");
		}
		else if(join.phone.value==""){
			alert("핸드폰번호를 입력하세요.");
		}
		else if((join.phone.value < "0"||join.phone.value > "9")&&(join.phone.value < "A"|| join.phone.value > "Z")&&(join.phone.value < "a"||join.phone.value > "z")){
			alert("핸드폰 번호에 한글 및 특수문자는 사용하실 수 없습니다.");
		}
		else if(join.address.value==""){
			alert("주소를 입력하세요.");
		}
		else{
				join.action="./save.jsp";
				join.submit();
			}
		}
	
	  function id_check() {
	        var url="./check.jsp?id="+document.joinform.id.value;
	        window.open(url, '_blank1', 'menubar=no,resizable=no,toolbar=no,scrollbars=yes,status=yes,width=400,height=350');
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
		<h2>회원가입</h2>
		<form name="joinform" method="post">
		<table class="jointable" style="margin:auto">
		<tr>
		<th scope="row">아이디</th>							<!-- id -->
		<td> <input type="text" name="id" size="25" maxlength="20" >
		<input type="button" class="checkbtn" value="중복확인" onClick="javascript:id_check();">
		</td>
		</tr>
		<tr>
		<th scope="row">비밀번호</th>							<!-- 비밀번호 -->
		<td> <input type="password" name="pw" size="25" maxlength="20"></td>
		</tr>
		<tr>
		<th scope="row">비밀번호 확인</th>						<!-- 비밀번호 확인 -->
		<td><input type="password" name="confirmpw" size="25" maxlength="20"></td>
		</tr>
		<tr>
		<th scope="row">이름</th>							<!-- 이름 -->
		<td> <input type="text" name="name" size="25"></td>
		</tr>
		<tr>
		<th scope="row">핸드폰 번호</th>						<!-- 핸드폰 번호 -->
		<td><input type="text" name="phone" size="25" maxlength="12"> ('-'없이 입력하세요.)</td>
		</tr>
		<tr>
		<th scope="row">주소</th>							<!-- 주소 -->
		<td><input type="text" name="address" size="50"></td>
		</tr>
		</table>
		<br>
		<input type="button" class="btn" value="회원가입" onClick="javascript:join_save();"> <!-- 확인 버튼 -->
		<input type="button" class="btn" value="취소" onClick="location.href='index.jsp'"> <!-- 취소버튼 -->
		</form>
		</div>
	</div>
	
</body>
</html>