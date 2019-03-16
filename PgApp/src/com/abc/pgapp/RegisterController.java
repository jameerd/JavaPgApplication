package com.abc.pgapp;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterController extends HttpServlet 
{
	String w=null;
	 int fee=0;
	public void service(HttpServletRequest x,HttpServletResponse y)
	{
	  try
	  {
		String name=x.getParameter("name");
		int phono=Integer.parseInt(x.getParameter("phono"));
		String email=x.getParameter("email");
		Model m=new Model();
		m.setName(name);
		m.setPhono(phono);
		m.setEmail(email);
		
		boolean b=m.insert();
		
		  if(b==true)
		  {
			y.sendRedirect("/PgApp/RegisterSuccess.jsp");
	      }
		  else
		   {
			  y.sendRedirect("/PgApp/RegisterFailure.jsp");
		   }
	   }
		catch(Exception e)
		{
			e.printStackTrace();
		}

		
	}
}
