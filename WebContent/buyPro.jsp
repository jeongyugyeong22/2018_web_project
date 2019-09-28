<%@ page language="java" import="java.sql.*, java.lang.*, java.util.* " contentType= "text/html;charset = utf-8"
	pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8");%>
<%
	String id= (String)session.getAttribute("id");
    String item_name = request.getParameter("p_name");
    String[] p_name = item_name.split(",");
    String st_cost = request.getParameter("ordertotal");
	int cost = Integer.parseInt(st_cost);
    String size = request.getParameter("p_size");
    String[] p_size = size.split(",");
    String mem_name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String addr = request.getParameter("address");
	String st_count=request.getParameter("count");
	int count = Integer.parseInt(st_count);
	String st_point = request.getParameter("use_point");
	int use_point = Integer.parseInt(st_point);
	String string_point = request.getParameter("point");
	int my_point = Integer.parseInt(string_point);
	String st_pointsum = request.getParameter("pointsum");
	int pointsum = Integer.parseInt(st_pointsum);
	int sell_count = 0;
	int point = 0;
	int i = 0;
	
	cost = cost - use_point;
	
	point = (my_point-use_point)+pointsum;
	
	int rs2 = 0;
	int msg = 0;
	
	String url = "jdbc:mysql://210.125.72.193:3306/homepage_db?autoReconnect=true&useUnicode=true&characterEncoding=utf-8";
	String user = "d_20151621";
	String password = "1621";
	
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection Conn = DriverManager.getConnection(url,user,password);
	PreparedStatement pstmt = null;
	
	Statement stmt = null;
	
	ResultSet rs = null;
	
	String sql = "select * from item";
	String pointsql = "update member set point = " + point + " where id = '" + id + "'";
	String sql_amount="update item set count = " + count + " where item_name = '" + item_name+"'";
	
	if(session.getAttribute("id")==null){
		response.sendRedirect("login.jsp");
	}
	else{
	try
	{ 
		pstmt = Conn.prepareStatement(sql);
		rs = pstmt.executeQuery();

		while(rs.next())
		{			
			for(i=0;i<p_name.length;i++){
				if(p_name[i]==rs.getString("item_name")){
					count = rs.getInt("count");
					count--;
					sell_count = rs.getInt("count_sell");
					sell_count++;
				}
			}
		}
		
		stmt = Conn.createStatement();
		rs2 = stmt.executeUpdate(sql_amount);
		
		stmt.close();
		
		String sql_save="insert into itemorder (id,item_name,cost,size,mem_name,phone,addr) values ('"+id+"','"+item_name+"','"+cost+"','"+size+"','"+mem_name+"','"+phone+"','"+addr+"')";
		stmt = Conn.createStatement();
		rs2 = stmt.executeUpdate(sql_save);
		if(rs2 > 0)
		{
			msg = 1;
		}
		else
		{
			msg = 2;
		}
		
		stmt.close();
		
		stmt = Conn.createStatement();
		rs2 = stmt.executeUpdate(pointsql);
		
		stmt.close();
		rs.close();
		pstmt.close();
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

	%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%if(msg==1){%>
	<form name="frm" method="post" action="order.jsp">
	<input type="hidden" name="msg" value="1">
	</form>
	<script language="javascript">
		document.frm.submit();
	</script>
	<%
	}
	else{
	%>
	<form name="frm" method="post" action="cart.jsp?id=<%=id%>">
	<input type="hidden" name="msg" value="2">
	</form>
	<script language="javascript">
		document.frm.submit();
	</script>
	<%
	}
	}
	%>