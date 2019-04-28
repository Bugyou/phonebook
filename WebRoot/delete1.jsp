<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" pageEncoding="utf-8"%>
<HTML>
 <div style="top:0px;left:0px;width:100%;height:100px;background-color:#2F2F4F;font-family:宋体;font-size:55;color:white;text-align:center">
<BR><b>我的电话簿</b><BR><BR>
 </div>
<BODY >
<FONT size=4><P align=center>删除成功！</FONT>
<FORM action="index.jsp" method=post>
<div align="center";style= "color:red;background-color:#808080;">
<Input type="submit" name="b" value=" 查看通讯录">
</div>
</FORM>

  <% 
    String no2=request.getParameter("no");
          if(no2==null)
            {no2="";
            }

    Connection con;
    Statement sql; 
    ResultSet rs;
    try{
		Class.forName("com.mysql.jdbc.Driver");
    }catch(ClassNotFoundException e){}
    

    try{ 
    	String dbUrl = "jdbc:mysql://127.0.0.1/db_note?useUnicode=true&characterEncoding=utf-8";
		String user = "root";
		String password = "bit";
		con = DriverManager.getConnection(dbUrl, user, password);
		sql=con.createStatement();
        //删除操作：
        String deleteAll="DELETE  FROM link WHERE no"+" = "+"'"+no2+"'";
        System.out.println(deleteAll);
        sql.executeUpdate(deleteAll);
   
       
        con.close();
   }catch(SQLException e1) {}    
 %>
</FONT>
</BODY>
</HTML>
