<%@ page language="java" import="java.sql.*, java.lang.*, java.util.* " contentType= "text/html;charset = utf-8"%>
<%
    request.setCharacterEncoding("UTF-8");

	String id = (String)session.getAttribute("id");
	int item_num = Integer.parseInt(request.getParameter("item_num"));
	int count = Integer.parseInt(request.getParameter("change_count"));
	
	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?autoReconnect=true&useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";

	int rs = 0;
	int message = 0;

	String sql_update="update cart set count='"+ count +"'where id='"+id+ "'&item_num ='"+item_num+"'";

	try
	{
		//mysql 연결
		Class.forName("com.mysql.jdbc.Driver");
		Connection Conn = DriverManager.getConnection(url, user, password); 
		Statement stmt = Conn.createStatement();
		
		//리턴값이 정상일 경우 1 비정상일 경우 -1
		message=stmt.executeUpdate(sql_update);
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
	<form name="frm" method="post" action="cart.jsp">
	<input type="hidden" name="msg" value="5">
	</form>
	<script language="javascript">
		document.frm.submit();
	</script>
	<%
	}
	else
	{
	%>
	<form name="frm" method="post" action="cart.jsp">
	<input type="hidden" name="msg" value="6">
	</form>
	<script language="javascript">
		document.frm.submit();
	</script>
	<%
	}
	%>
''