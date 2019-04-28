<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.sql.*" pageEncoding="utf-8"%>
<HTML>
 <div style="top:0px;left:0px;width:100%;height:100px;background-color:#2F2F4F;font-family:宋体;font-size:55;color:white;text-align:center">
 <BR><b>我的电话簿</b><BR><BR>
 </div>
<BODY>
<Font size=4>
<div style="top:0px;left:0px;width:100%;height:100px;background-color:#C0C0C0;font-family:宋体;font-size:30;color:white;text-align:center">
<BR><b>添加新联系人：</b><BR>
</div>
<div align=center>
<FORM action="insert2.jsp" method=post>
姓名：
<Input type="text" name="name">
电话：
<Input type="text" name="phoneNo">
<Input type="submit" name="b" value="添加">
</FORM>
</div>
</Font>
</BODY>
</HTML>
