<%@ page import="java.sql.*, javax.naming.*, javax.sql.DataSource"%>
<%@page contentType="text/html;charset=utf-8"
    pageEncoding="UTF-8"%>
<%!
//null처리를 위한 function
public static String nullcheck(String str) throws Exception {

if (str == null){
return "";
}else{
return str;     // 넘어온 Stirng 을 그대로 다시 return
}
}

%>
<%
int message = 0;
String id = nullcheck(request.getParameter("id"));


if ("".equals(id))
     message = 1;  //검색화면
else {
%>
<%
String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?useUnicode=true&characterEncoding=utf-8";
String user = "d_20151621";
String password = "1621";

Connection Conn=null;
Statement stmt=null;
ResultSet rs =null;

try {
	Class.forName("com.mysql.jdbc.Driver"); 
	Conn = DriverManager.getConnection(url, user, password); 
	stmt = Conn.createStatement();
%>
<%
    rs = stmt.executeQuery("select count(id) from member where id = '"+id+"'");
    rs.next();
    if (rs.getInt(1) >= 1)
        message = 2;   // 사용할수 없음
    else
        message = 3;   // 사용가능
    }catch(SQLException se){
        out.println(se.toString());
    }catch(Exception e1){
	out.println(e1);
	}finally{
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (Conn != null) Conn.close(); Conn = null;} catch (Exception e) {}
    }
%>
<%
}
%>
<html>
<head><title>id 중복체크</title>
<style>
@font-face { font-family: 'NanumSquareRound'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/NanumSquareRound.woff') format('woff'); 
font-weight: normal; font-style: normal; }
h4{
	margin-top:1px;
	text-align:center;
	font-family:NanumSquareRound;
}
h2{
	margin-top:1px;
	text-align:center;
	font-family:NanumSquareRound;
}
.check{
	margin-top:10px;
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
.checkbtn{
	width:80px;
	height:20px;
	border : 1px solid black;
	background-color : white;
	text-align:center;
	font-family:NanumSquareRound;
	font-size: 13px;
	cursor: pointer;
}
</style>

</head>
<body>
<form method=post name=formm action="./check.jsp">
	<br>
	<h2>아이디 중복확인</h2>
	<hr>
<%
  if(message == 2) {
%>
<script language=javascript>
   opener.document.joinform.id.value="";
</script>
	<div class ="check">
		<form id="checkform">
			<h6>아이디는 영소문자,숫자로 표현해주세요.<br>
			공백 또는 특수문자가 포함된 아이디는 사용할 수 없습니다.</h6>
			<h4>* <%=id%> 는 이미 등록된 아이디 입니다.</h4>
			<input type="button" class="btn" value="취소" onClick="window.close()">
		</form>
	</div>
		
<%
  } else if (message == 1) {
%>
	<div class ="check">
		<form id="checkform">
			<h6>아이디는 영소문자,숫자로 표현해주세요.<br>
			공백 또는 특수문자가 포함된 아이디는 사용할 수 없습니다.</h6>
			<h4>*사용할 아이디를 입력하시고 검색하여 주세요</h4>
			<input type="button" class="btn" value="취소" onClick="window.close()">
		</form>
	</div>
<%
  } else if (message == 3) {
%>
            <SCRIPT language=javascript>
              function idok() {
                 opener.joinform.id.value="<%=id%>";
                 self.close();
              }
            </SCRIPT>
            
	<div class ="check">
		<form id="checkform">
			<h6>아이디는 영소문자,숫자로 표현해주세요.<br>
			공백 또는 특수문자가 포함된 아이디는 사용할 수 없습니다.</h6>
            <h4>* <%=id%> 은(는) 사용가능합니다.</h4>
        <input type="button" class="btn" value="사용하기" onClick="javascript:idok()">
		</form>
	</div>
<%
  }
%>
</form>
</body>
</html>