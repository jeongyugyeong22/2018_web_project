<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.lang.*,java.io.*,java.sql.*,java.util.*" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	String sql_id = "select * from member where id = '"+id+"' AND pw = '"+pw+"'";

	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";
	
	Connection Conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs =null;
try
	{
		Class.forName("com.mysql.jdbc.Driver"); 
		Conn = DriverManager.getConnection(url, user, password); 
		pstmt = Conn.prepareStatement(sql_id);
		 
		rs= pstmt.executeQuery();
		 
		 if(rs.next())
		 {
		   id = rs.getString("id");
		   pw = rs.getString("pw");
		   
		   rs.close();
		   pstmt.close();
		   Conn.close();
		   
 		   session.setAttribute("id",id);
 		   session.setAttribute("pw",pw);

		   %>
  		 <form name="frm" method="post" action="index.jsp">
  		 <input type="hidden" name="msg" value="1">
  		 </form>
  		 <script language="javascript">
   		   document.frm.submit();
  		 </script>
  		 <%
 		}else
 		{
  		 rs.close();
  		 pstmt.close();
   		 Conn.close();
  		 %>
   		<form name="frm" method="post" action="index.jsp">
   		<input type="hidden" name="msg" value="2">
  		 </form>
   		<script language="javascript">
   		   document.frm.submit();
   		</script>
  		 <%
 		}
}
 
 catch(SQLException e)
 {
    out.println(e);
 }
 catch(Exception el)
 {
    out.println(el);
 }
 %>