<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String msg=request.getParameter("msg");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댕신사</title>
<link href='indexstyle.css' rel='stylesheet' style="text/css"/>
<style>
.title{
	padding-top:5%;
}
.content{				/* 내용 */
	padding-top:3%;
}

#loginform{				/* 로그인폼 */
	float:right;
}

img {vertical-align: middle;}

.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

.dot {
  cursor: pointer;
  height: 8px;
  width: 8px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  height: 8px;
  width: 8px;
  background-color: #717171;
}

</style>

<script type="text/javascript">

	function show_msg(msg){
		if(msg == 1){
			alert("로그인되었습니다.");
		}
		else if(msg == 2){
			alert("아이디나 비밀번호를 확인해주세요.");
		}
	}
	
	function openmenu() {
	    document.getElementById("Sidemenu").style.width = "200px";
	    document.getElementById("main").style.marginLeft = "200px";
	    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
	}
	
</script>
</head>
<body onLoad="show_msg('<%=msg%>');">

	<jsp:include page="sidemenu.jsp"/>	<!-- 상단바 -->

	<div id="main">												<!-- 메인 내용 -->
		<div class="container" onClick="javascript:openmenu();">	<!-- 메뉴표시 -->
 	 		<div class="menu">
 	 			menu &#10095
 	 		</div>
		</div>

	<div style="padding:0px 0px 300px;">							<!-- 스크롤 -->
	
		<jsp:include page="index_top.jsp"/>	<!-- 상단바 -->
		
		<div class="title">
		<a href="index.jsp">
		<img src="title.png" style="margin-left: auto; margin-right: auto; display:block;" height=150px>
		</a>
		</div>
		
		<div class="content">										<!-- 내용 -->
			<div class="slideshow-container">
				<div style="text-align:center;">
  				<span class="dot" onclick="currentSlide(1)"></span> 
 				<span class="dot" onclick="currentSlide(2)"></span> 
 				<span class="dot" onclick="currentSlide(3)"></span> 
				</div>
				<div class="Slides">
				<a href="top.jsp">
				<img src="3.jpg" style="width:100%">
				</a>
				</div>
				<div class="Slides">
				<a href="outer.jsp">
				<img src="2.jpg" style="width:100%">
				</a>
				</div>
				<div class="Slides">
				<a href="allinone.jsp">
				<img src="제목 없음-1.jpg" style="width:100%">
				</a>
				</div>
			</div>
		<script>
		var slideindex = 0;
		showSlides();
		var x,dots;
		
		function currentSlide(n) {
			   var i;
			    var x = document.getElementsByClassName("Slides");
			    var dots = document.getElementsByClassName("dot");
			   if (n > x.length) {n = 1}
			    else if(n < 1){n = x.length}
			    for (i = 0; i < x.length; i++) {
			       x[i].style.display = "none";  
			    }
			    for (i = 0; i < dots.length; i++) {
			        dots[i].className = dots[i].className.replace(" active", "");
			    }
			    x[n-1].style.display = "block";  
			    dots[n-1].className += " active";
			   clearTimeout(timer);
			}
		function showSlides() {
		  var i;
		  var slides = document.getElementsByClassName("Slides");
		  var dots = document.getElementsByClassName("dot");
		  for (i = 0; i < slides.length; i++) {
		      slides[i].style.display = "none";  
		  }
		  slideindex++;
		  if (slideindex > slides.length) {slideindex = 1}    
		  
		  for (i = 0; i < dots.length; i++) {
		      dots[i].className = dots[i].className.replace("active", "");
		  }
		  slides[slideindex-1].style.display = "block";  
		  dots[slideindex-1].className += " active";
		   setTimeout(showSlides, 3000); //3초마다 바뀜

		}
		</script>
	</div>
</div>
</div>
<div class="footer">											<!-- 하단 -->
  댕신사<br>
  이 홈페이지에는 네이버에서 제공한 나눔글꼴이 적용되어 있습니다. 
</div>
</body>
</html>