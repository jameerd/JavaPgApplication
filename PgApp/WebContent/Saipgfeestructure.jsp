<%@ page   import="java.io.IOException" import="java.io.PrintWriter" 
import="java.sql.*" import="javax.servlet.http.*" import="oracle.jdbc.driver.OracleDriver" 
language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
   
 <%! String url="jdbc:oracle:thin:@//localhost:1521/XE";
String pwd="oracle";
String un="hr";
 Connection con=null;
 Statement stmt=null;
 ResultSet res=null;
 String sha=null;
 int fees=0;
 %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>FEE_STRUCTURE</h1>
<%! 
    public void jspInit()
    {
	 try 
	 {
		DriverManager.registerDriver(new OracleDriver());
	 }
	 catch (SQLException e) 
	 {
		e.printStackTrace();
	 }
	 try 
	 {
		con=DriverManager.getConnection(url, un, pwd);
	 } 
	 catch (SQLException e) 
	 {
     e.printStackTrace();
	 }
   } 
%>
<%  
      try 
		{
    	  stmt=con.createStatement();
			res=stmt.executeQuery("SELECT * FROM FEESTRUCTURE");
			while(res.next()==true)
			{
              sha=res.getString("SHARING");
              fees=res.getInt("FEES");
             out.println(sha+" "+fees+"<br>");
             
			}
			
		}
		catch(Exception e) 
		{
			
		}
 %>
 <%!public void jspDestroy() 
	{
     try 
       {
		con.close();
	    res.close();
	   }
     catch (SQLException e) 
       {
			e.printStackTrace();
	   }
    
	}
 %>

</body>
</html>