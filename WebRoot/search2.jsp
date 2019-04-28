<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" pageEncoding="utf-8"%>
<HTML>
 <div style="top:0px;left:0px;width:100%;height:100px;background-color:#2F2F4F;font-family:宋体;font-size:55;color:white;text-align:center">
 <BR><b>我的电话簿</b><BR><BR>
 </div>
<BODY >
<FONT size=4><P align=center>查找完毕！</FONT>
<BR><BR>
 <% 
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=utf-8");
 
    //获取提交的姓名：
    String name=request.getParameter("name");
    if(name==null){
    	name="";
    }
    
    Connection con;
    Statement sql; 
    ResultSet rs;
    try{
		Class.forName("com.mysql.jdbc.Driver");
    }catch(ClassNotFoundException e){}
    
    try { 
    
    	String dbUrl = "jdbc:mysql://127.0.0.1/db_note?useUnicode=true&characterEncoding=utf-8";
		String user = "root";
		String password = "bit";
		con = DriverManager.getConnection(dbUrl, user, password);
		sql=con.createStatement();

        String condition="SELECT * FROM link WHERE name = "+"'"+name+"'";        

        rs=sql.executeQuery(condition);
        
        out.print("<Table Border=10 align=center>");
        out.print("<TR>");
        
        out.print("<TH width=100>"+"姓名");
        out.print("<TH width=100>"+"电话");
        
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
    }
    catch(SQLException e)
           {  }
%>

<FORM action="index.jsp" method=post>
<div align="center";style= "color:red;background-color:#808080;">
<Input type="submit" name="b" value=" 返回主页 ">
</div>
</FORM>
</BODY>
</HTML>