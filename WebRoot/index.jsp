<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" pageEncoding="utf-8"%>
<HTML>
 <div style="top:0px;left:0px;width:100%;height:100px;background-color:#2F2F4F;font-family:宋体;font-size:55;color:white;text-align:center">
<BR><b>我的电话簿</b><BR><BR>
 </div>
<BODY bgcolor=white >

<Font size=4>
<BR>
<% 
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
   response.setContentType("text/html;charset=utf-8");
       
    Connection con;
    Statement sql; 
    ResultSet rs;
    try{
		Class.forName("com.mysql.jdbc.Driver");
    }catch(ClassNotFoundException eq){}
    
       
   try {
    	String dbUrl = "jdbc:mysql://127.0.0.1/db_note?useUnicode=true&characterEncoding=utf-8";
		String user = "root";
		String password = "bit";
		con = DriverManager.getConnection(dbUrl, user, password);
		sql=con.createStatement();
        rs=sql.executeQuery("SELECT * FROM link order by phoneNo");
        out.print("<Table Border=10 align=center >");
        out.print("<TR>");
       
        out.print("<TH width=150 align=center>"+"姓名");
        out.print("<TH width=150 align=center>"+"电话");
        
        out.print("</TR>");

	    while(rs.next()){
	        out.print("<TR>");
            
            out.print("<TD align=center>"+rs.getString(2)+"</TD>");
            out.print("<TD align=center>"+rs.getString(3)+"</TD>");
            
            out.print("<TD align=center>"+"<a href=insert1.jsp?no=" + rs.getString("no") + " onclick=\"return window.confirm('是否确定添加？')\" >添加</a></TD>");
            out.print("<TD align=center>"+"<a href=delete1.jsp?no=" + rs.getString("no") + " onclick=\"return window.confirm('是否确定删除？')\">删除</a></TD>");
            out.print("<TD align=center>"+"<a href=update1.jsp?no=" + rs.getString("no") + " onclick=\"return window.confirm('是否确定编辑？')\" >编辑</a></TD>");
            out.print("<TD align=center>"+"<a href=search1.jsp?no=" + rs.getString("no") + " onclick=\"return window.confirm('是否确定查找？')\" >查找</a></TD>");
           
 	        out.print("</TR>") ; 
        }
        out.print("</Table>");
        con.close();
   }catch(SQLException e1) {}    
 %>
<BR><BR>

<FORM action="insert1.jsp" method=post>
<div align="center">
<Input type="submit" name="b" value="  添加  ">
</div>
</FORM>

<FORM action="search1.jsp" method=post>
<div align="center">
<Input type="submit" name="b" value="  查找  ">
</div>
</FORM>

</FONT>
</BODY>
</HTML>
