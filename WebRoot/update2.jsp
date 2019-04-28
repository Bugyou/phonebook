<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" pageEncoding="utf-8"%>
<HTML>
 <div style="top:0px;left:0px;width:100%;height:100px;background-color:#2F2F4F;font-family:宋体;font-size:55;color:white;text-align:center">
 <BR><b>我的电话簿</b><BR><BR>
 </div>
<BODY >
<FONT size=4><P align=center>修改成功！</FONT>
<FORM action="index.jsp" method=post>
<div align="center";style= "color:red;background-color:#808080;">
<Input type="submit" name="b" value=" 查看通讯录">
</div>
</FORM>

  <% //获取提交的姓名：
   request.setCharacterEncoding("utf-8");
   response.setCharacterEncoding("utf-8");
   response.setContentType("text/html;charset=utf-8");
   
   String no=request.getParameter("no");
          if(no==null)
            {no="";
            } 
          
   //获取提交的新的姓名：
   String nameNew=request.getParameter("name");
          if(nameNew==null)
            {nameNew="";
            }
     
    //获取提交的新的电话：
    String phoneNoNew=request.getParameter("phoneNo");
          if(phoneNoNew==null)
            {phoneNoNew="";
            }
       
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
        String sql_update="update link set name='"+ nameNew+"',phoneNo='" + phoneNoNew +"' where no=" + no;  
        sql.executeUpdate(sql_update);
        con.close();
   }catch(SQLException e1) {}    
 %>

</BODY>
</HTML>
