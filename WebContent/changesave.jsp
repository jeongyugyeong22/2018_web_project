<%@ page language="java" import="java.sql.*, java.lang.*, java.util.* " contentType= "text/html;charset = utf-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%
	String id = (String)session.getAttribute("id");
	String pw=request.getParameter("changepw"); // 비밀번호 받아들임
	String mem_name=request.getParameter("name"); //이름 받아들임
	String phone=request.getParameter("phone"); //핸드폰번호 받아들임
	String addr=request.getParameter("address"); //주소 받아들임
	
	String sql="";
	String sql_update="";
	int msg=0;

 	ResultSet rs = null;
 	
	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";

try
	{	
		sql="select pw from member where id = '" +id+ "'";
		sql_update="update member set pw='"+ pw +"', mem_name = '" +mem_name+ "',phone='" +phone+"',addr='"+addr+"'where id='"+id+ "'";
		//mysql 연결
		Class.forName("com.mysql.jdbc.Driver"); 
		Connection Conn = DriverManager.getConnection(url, user, password); 
		PreparedStatement pstmt =  Conn.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			rs.close();
			pstmt.close();
				
			pstmt = Conn.prepareStatement(sql_update);
			
			//리턴값이 정상일 경우 1 비정상일 경우 -1
			msg = pstmt.executeUpdate();
				
			if(msg > 0)
			{
				pstmt.close();
				Conn.close();
				%>
				<form name="frm" method="post" action="./changeinfo.jsp">
				<input type="hidden" name="msg" value="1">
				</form>
				<script language="javascript">
					document.frm.submit();
				</script>
				<%
			}
			else
			{
				rs.close();
				pstmt.close();
				Conn.close();
				%>
				<form name="frm" method="post" action="./changeinfo.jsp">
				<input type="hidden" name="msg" value="2">
				</form>
				<script language="javascript">
					document.frm.submit();
				</script>
				<%
			}
		}
	}
	catch(SQLException e)
	{
		out.println(e);
	}
	catch(Exception e1)
	{
		out.println(e1);
	}
%>
