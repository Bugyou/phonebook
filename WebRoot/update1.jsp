<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*"%>  

<HTML>
 <div style="top:0px;left:0px;width:100%;height:100px;background-color:#2F2F4F;font-family:宋体;font-size:55;color:white;text-align:center">
 <BR><strong>我的电话簿</strong><BR><BR>
 </div>
<BODY>

<div style="top:0px;left:0px;width:100%;height:100px;background-color:#C0C0C0;font-family:宋体;font-size:30;color:white;text-align:center">
<BR><b>编辑联系人：</b><BR>
</div>
<%  
     request.setCharacterEncoding("utf-8");
     response.setCharacterEncoding("utf-8");
     response.setContentType("text/html;charset=utf-8");
     String no2=request.getParameter("no");  
     if(no2==null)
        {
          no2="";
        }
     
		Class.forName("com.mysql.jdbc.Driver");
    
    	String dbUrl = "jdbc:mysql://127.0.0.1/db_note?useUnicode=true&characterEncoding=utf-8";
		String user = "root";
		String password = "bit";
		Connection  con = DriverManager.getConnection(dbUrl, user, password);
		Statement sql=con.createStatement();

        String condition="select * from link where no="+"'"+no2+"'";
  
        ResultSet rs=sql.executeQuery(condition);
        rs.next();
               
 %>
 
<FORM action="update2.jsp"  method="post" style="text-align:center" >  
 新的姓名 ：<input type="text" name="name" value=<%=rs.getString("name")%> > 
 &nbsp;&nbsp;
 新的号码：<input type="text" name="phoneNo" value=<%=rs.getString("phoneNo")%> >           
         <input type="hidden" name="no" value=<%=rs.getString("no")%> >
<BR><BR>
<input type="submit" value="  修改  " >  
</FORM>  

</BODY>
</HTML>
