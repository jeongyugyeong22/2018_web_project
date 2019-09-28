<%@page contentType= "text/html;charset = utf-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>상품등록</title>
<link href='indexstyle.css' rel='stylesheet' style="text/css"/>
<style>
.title{
	padding-top:5%;
}
.content{				/* 내용 */
	padding-top:3%;
	text-align : center;
}
h2{
    font-family:NanumSquareRound;

}
table.addtable {
    border-top: 1px solid #c4c4c4;
    border-bottom: 1px solid #c4c4c4;
}

table.addtable th{
    width: 150px;
    text-align: left;
    padding: 10px;
    border: 1px solid #f2f2f2;
    background: #f2f2f2;
    font-weight:lighter;
    font-family:NanumSquareRound;
    font-size:15px;
}
table.addtable td{
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
</style>
<script language="javascript">
     function go_save()
	 {
		var theForm = document.frm;

		if(theForm.productKind.value =='')
		 {
			alert('상품분류를 선택하세요');
			theForm.productKind.focus();
		 }
		else if (theForm.name.value=='')
		{
			alert('상품명을 입력하세요');
			theForm.name.focus();
		}
		else if (theForm.price.value=='')
		{
			alert('가격을 입력하세요');
			theForm.price.focus();
		}
        else if (theForm.size.value=='')
		{
			alert('사이즈를 입력하세요');
			theForm.size.focus();
		}
		else if (theForm.fileImage.value=='')
		{
			alert('상품이미지들 입력하세요');
			theForm.fileImage.focus();
		}
		else if (theForm.color.value=='')
		{
			alert('상품의 색상을 입력하세요');
			theForm.color.focus();
		}
		else if (theForm.count.value=='')
		{
			alert('상품의 수량을 입력하세요');
			theForm.count.focus();
		}
		else
		{
		  theForm.action="./ad_itemsave.jsp?item_name="+theForm.name.value;
		  theForm.submit();
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
	<jsp:include page="sidemenu.jsp"/>	<!-- 상단바 -->

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
		
		<div class="content">							<!-- 내용부분 -->
		<h2>상품등록</h2>
		<form name="addform" method="post">
		<table class="addtable" style="margin:auto">
 		<tr>
      		<th scope="row">상품명</th>
      		<td> <input type="text" name="name" size="25" maxlength="20" ></td>
    	</tr>
    	<tr>
      		<th scope="row">가격</th>
      		<td> <input type="text" name="price" size="25" maxlength="20" ></td>
    	</tr>
   		<tr>
      		<th scope="row">상품 분류</th>
     		<td width="343" colspan="5">
             <select name="productKind">
			   <option value="">&nbsp;</option>
			   <option value="1">sleeveless</option>
			   <option value="2">tshirt</option>
			   <option value="3">knit</option>
			   <option value="4">dress</option>
			   <option value="5">padding</option>
			   <option value="6">cardigan</option>
			   <option value="7">hairpin</option>
			   <option value="8">muffler</option>
			   <option value="9">cushion</option>
			   <option value="10">house</option>
			   <option value="11">harness&lead</option>
			   <option value="12">bag</option>
			   <option value="13">all in one</option>
			 </select>
       		</td>
 	    </tr>
    	<tr>
      		<th scope="row">사이즈</th>
      		<td> <input type="text" name="size" size="25" maxlength="20" ></td>
    	</tr>
    	<tr>
      		<th scope="row">색상</th>
      		<td> <input type="text" name="color" size="25" maxlength="20" ></td>
    	</tr>
    	<tr>
      		<th scope="row">수량</th>
      		<td> <input type="text" name="count" size="25" maxlength="20" ></td>
  		</tr>
   		<tr>
        <th scope="row">상품이미지</th>
        <td width="343" colspan="5">
          <input type="file" name="fileImage">
		</td>
    	</tr>
		</table>
		<br>
    	<input type="button" class="btn" value="등록" onClick="javascript:go_save();">
    	<input type="reset" class="btn" value="다시 입력">
	</form>
	</div>
	</div>
</body>
</html>