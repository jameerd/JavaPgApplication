<%@ page   import="java.io.IOException" import="java.io.PrintWriter" 
import="java.sql.*" import="javax.servlet.http.*" import="oracle.jdbc.driver.OracleDriver" 
language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
   
 <%! String url="jdbc:oracle:thin:@//localhost:1521/XE";
String pwd="oracle";
String un="hr";
 Connection con=null;
 Statement stmt=null;
 ResultSet res=null;
 String a=null;
 String b=null;
 String c=null;
 String d=null;
 
 %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3>FOOD_AVAILABLE</h3>
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
			res=stmt.executeQuery("SELECT * FROM FOOD");
			while(res.next()==true)
			{
              a=res.getString("DAY");
              b=res.getString("BREAK_FAST");
              c=res.getString("LUNCH");
              d=res.getString("DINNER");
              
             out.println("<table>"+a+"=>"+"<br/>"+"<li>[break_fast]"+b+" "+"<li>[lunch]"+c+""+"<li>[dinner]"+d +"</table>");
             
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