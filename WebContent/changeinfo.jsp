<%@ page language="java" import="java.sql.*, java.lang.*, java.util.* " contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 request.setCharacterEncoding("UTF-8");
 String msg=request.getParameter("msg");

 String id = (String)session.getAttribute("id");
 String pw = (String)session.getAttribute("pw"); // 비밀번호 초기화
 String mem_name="";
 String phone = "";
 String address = "";

 String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?useUnicode=true&characterEncoding=utf-8";
 String user = "d_20151621";
 String password = "1621";

 String sql = "Select * from member where id = '" +id+ "'";
 
 ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='indexstyle.css' rel='stylesheet' style="text/css/">
<title>마이페이지</title>
<style>
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
table.changetable {
    border-top: 1px solid #c4c4c4;
    border-bottom: 1px solid #c4c4c4;
}

table.changetable th{
    width: 150px;
    text-align: left;
    padding: 10px;
    border: 1px solid #f2f2f2;
    background: #f2f2f2;
    font-weight:lighter;
    font-family:NanumSquareRound;
    font-size:15px;
}
table.changetable td{
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
.scbtn{
	width:150px;
	height:20px;
	border : 1px solid white;
    background-color: white;
    color: black;
    float:right;
    font-family:NanumSquareRound;
    font-size: 15px;
}
</style>
<script type="text/javascript">

	function show_msg(msg){
		if(msg == 1){
			alert("변경되었습니다.");
		}
		else if(msg == 2){
			alert("오류가 발생되었습니다.");
		}
	}

 	function change_save(){
	 	var change = document.changeform;
	 
	 	if(change.changepw.value==""){
			alert("비밀번호를 입력하세요.");			
			change.changepw.focus();
	 	}
		else if(change.changepw.value!=change.changeconfirmpw.value){
			alert("비밀번호와 비밀번호 확인이 다릅니다.");
		}
		else if(change.name.value==""){
			alert("이름을 입력하세요.");			
			change.name.focus();
		}
		else if(change.phone.value==""){
			alert("핸드폰번호를 입력하세요.");
			change.phone.focus();
		}
		else if((change.phone.value < "0"||change.phone.value > "9")&&(change.phone.value < "A"|| change.phone.value > "Z")&&(change.phone.value < "a"||change.phone.value > "z")){
			alert("핸드폰 번호에 한글 및 특수문자는 사용하실 수 없습니다.");
			change.phone.focus();
		}
		else if(change.address.value==""){
			alert("주소를 입력하세요.");
			change.address.focus();
		}
		else{
				change.action="./changesave.jsp";
				change.submit();
		}
	}
 	function openmenu() {
	    document.getElementById("Sidemenu").style.width = "200px";
	    document.getElementById("main").style.marginLeft = "200px";
	    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
	}

</script>
</head>
<body onLoad = "show_msg(<%=msg%>)">
	<%@ include file="sidemenu.jsp"%>	<!-- 메뉴 -->

	<div id="main">												<!-- 메인 내용 -->
		<div class="container" onClick="javascript:openmenu();">	<!-- 메뉴표시 -->
 	 		<div class="menu">
 	 			menu &#10095
 	 		</div>
		</div>		
		
		<jsp:include page="index_top.jsp"/>	<!-- 상단바 -->
				
		<div class="title">
		<a href="index.jsp">
		<img src="title.png" style="margin-left: auto; margin-right: auto; display:block;" height=100px>
		</a>
		</div>
	<%
 	try
 	{
 		Class.forName("com.mysql.jdbc.Driver"); 
 		Connection Conn = DriverManager.getConnection(url,user,password); 
 		PreparedStatement pstmt = Conn.prepareStatement(sql);
 		rs= pstmt.executeQuery();
 			
 		if(rs.next())
 		{
 			pw = rs.getString("pw");
 			mem_name = rs.getString("mem_name");
 			phone = rs.getString("phone");
 			address = rs.getString("addr");

 			 rs.close();
 			 pstmt.close();
 			 Conn.close();
 			   
 		 %>
		<div class="content">							<!-- 내용부분 -->
		<h2>회원정보 변경</h2>
		<form name="changeform" method="post">
		<table class="changetable" style="margin:auto">
		<tr>
		<th scope="row">아이디</th>							<!-- id -->
		<td> <%=id %>
		</td>
		</tr>
		<tr>
		<th scope="row">새 비밀번호</th>							<!-- 비밀번호 -->
		<td> <input type="password" name="changepw" value="<%=pw %>" size="25" maxlength="20"></td>
		</tr>
		<tr>
		<th scope="row">비밀번호 확인</th>						<!-- 비밀번호 확인 -->
		<td><input type="password" name="changeconfirmpw"  value="<%=pw %>" size="25" maxlength="20"></td>
		</tr>
		<tr>
		<th scope="row">이름</th>							<!-- 이름 -->
		<td> <input type="text" name="name" value="<%=mem_name %>" size="25"></td>
		</tr>
		<tr>
		<th scope="row">핸드폰 번호</th>						<!-- 핸드폰 번호 -->
		<td><input type="text" name="phone" value="<%=phone %>" size="25" maxlength="12"> ('-'없이 입력하세요.)</td>
		</tr>
		<tr>
		<th scope="row">주소</th>							<!-- 주소 -->
		<td><input type="text" name="address" value="<%=address %>" size="50"></td>
		</tr>
		</table>
		<br>
		<input type="button" class="btn" value="변경" onClick="javascript:change_save();"> <!-- 확인 버튼 -->
		<input type="button" class="btn" value="취소" onClick="location.href='mypage.jsp'"> <!-- 취소버튼 -->
		</form>
		</div>
		<input type="button" class="scbtn" value="회원탈퇴" onClick="location.href='secession.jsp'"><!-- 회원탈퇴 -->
		</div>
	<%
 	 		}
 	 }catch(SQLException e)
 	 {
 	    out.println(e);
 	 }
 	 catch(Exception el)
 	 {
 	    out.println(el);
 	 }
	%>	
</body>
</html>