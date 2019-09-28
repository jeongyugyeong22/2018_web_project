<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  int order_num = Integer.parseInt(request.getParameter("order_num"));

%>
<html>
<head>
<title>게시판</title>
<link href='indexstyle.css' rel='stylesheet' style="text/css"/>

<style>
h4{
	font-family:NanumSquareRound;
}

.title{
	padding-top:5%;
}
.content{
	padding-top:3%;
	text-align : center;
}
.pw{
	padding-top:2%;
	font-family:NanumSquareRound;
    font-size: 13px;
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
.contents{
	text-align:left;
}
</style>
<script type="text/javascript">  
	function openmenu() {
   		document.getElementById("Sidemenu").style.width = "200px";
   		document.getElementById("main").style.marginLeft = "200px";
   		document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
	}

  function deleteSave(){	
	if(!document.delForm.passwd.value){
	   alert("비밀번호를 입력하세요.");
	   document.delForm.passwd.focus();
	   return false;
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
			<a href="review.jsp" style="text-decoration:none;">REVIEW</a>
		</div> 

		<form method="POST" name="delForm" action="reviewdelPro.jsp?order_num=<%=order_num%>" onsubmit="return deleteSave()"> 
 		<h4>비밀번호를 입력해주세요.</h4>
 		<div class="pw">
 		<label>비밀번호 :   </label>
        <input type="password" name="passwd" size="8" maxlength="12">
	    </div>
	    <br>
		<input type="submit" class="btn" value="글삭제" >
      	<input type="button" class="btn" value="글목록" onclick="location.href='review.jsp'">  
	</form>
	</div>
	</div>
	</div>

</body>
</html>