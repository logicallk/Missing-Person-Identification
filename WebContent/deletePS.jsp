<%@ page import="com.lokesh.databcon.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   try
 {
	   Connection con=Connectdb.connect();
	   PreparedStatement ps1=con.prepareStatement("delete from police_st where Id=?");
	   ps1.setString(1,request.getParameter("id"));
	   int i=ps1.executeUpdate();
	   if(i>0)
	   {
		   response.sendRedirect("Asuccess.html");
		   System.out.println("Delete Police Station successfuly...");
		   
	   }
	   else
	   {
		   response.sendRedirect("Afailed.html");
	   System.out.println("Delete Police Station Failed...");
	   }
 }
	   
 catch(Exception e)
 {
	 e.printStackTrace();
 }
 %>

</body>
</html>