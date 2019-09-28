<%@ page language="java" import="java.sql.*, java.lang.*, java.util.* " contentType= "text/html;charset = utf-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%
	int qna_num = Integer.parseInt(request.getParameter("qna_num"));
	String passwd = request.getParameter("passwd");
	String id=(String)session.getAttribute("id");

	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";

	int message = 0;

	String sql_delete = "delete from qna where qna_num = '" + qna_num + "' AND qna_pw='"+passwd+"'";
	String sql_admindelete="delete from qna where qna_num = '" + qna_num + "'";
	try
	{
		//mysql 연결
		Class.forName("com.mysql.jdbc.Driver");
		Connection Conn = DriverManager.getConnection(url, user, password); 
		Statement stmt = Conn.createStatement();
		
		if("admin".equals((String)session.getAttribute("id"))){
			message=stmt.executeUpdate(sql_admindelete);
		}
		else{
			message=stmt.executeUpdate(sql_delete);
		}
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
	<form name="frm" method="post" action="qna.jsp">
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
	<form name="frm" method="post" action="qna.jsp">
	<input type="hidden" name="msg" value="2">
	</form>
	<script language="javascript">
		document.frm.submit();
	</script>
	<%
	}
	%>