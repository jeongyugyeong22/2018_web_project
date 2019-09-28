<%@ page language="java" import="java.sql.*, java.lang.*, java.util.* " contentType= "text/html;charset = utf-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%

int num = 0;
String id=(String)session.getAttribute("id");
String mem_name = request.getParameter("name");
String title = request.getParameter("title");
String notice_pw=request.getParameter("pw");
String content = request.getParameter("content");
int message = 0;

String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?useUnicode=true&characterEncoding=utf-8";
String user = "d_20151621";
String password = "1621";

ResultSet rs = null;

if(session.getAttribute("id")==null){
	response.sendRedirect("login.jsp");
}
else{
	
try
	{
		//mysql 연결
		Class.forName("com.mysql.jdbc.Driver");
		Connection Conn = DriverManager.getConnection(url, user, password); 
		PreparedStatement stmt = Conn.prepareStatement("select max(notice_num) from notice");
		rs = stmt.executeQuery();

		if (rs.next()){
		      num=rs.getInt(1)+1;
		}
		else{
		      num=1;
		}
		String sql_save="insert into notice (notice_num,notice_pw,id,mem_name,title,content) values ('"+num+"','"+notice_pw+"','"+id+"','"+mem_name+"','"+title+"','"+content+"')";

		//리턴값이 정상일 경우 1 비정상일 경우 -1
		message=stmt.executeUpdate(sql_save);
		
		stmt.close();
		Conn.close();
    }
	catch(SQLException e)
	{
		out.println(e);
	}
	catch(Exception e1)
	{
		out.println(e1);
	}

if(message > 0)
{
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<form name="frm" method="post" action="noticecontent.jsp?notice_num=<%=num%>">
<input type="hidden" name="msg" value="1">
</form>
<script language="javascript">
	document.frm.submit();
</script>
<%
}
else
{
%>
<form name="frm" method="post" action="notice.jsp">
<input type="hidden" name="msg" value="2">
</form>
<script language="javascript">
	document.frm.submit();
</script>
<%
}
}
%>