 package com.abc.pgapp;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Model 
{

	private String url="jdbc:oracle:thin:@//localhost:1521/XE";
	private String un="HR";
	private String pw="ORACLE";
	private Connection con=null;
	private PreparedStatement pstmt=null;

	String name=null;
	int phono=0;
	String email=null;
	String sha=null;
	int fees=0;
	public void setName(String name) 
	{
		this.name = name;
	}
	public void setPhono(int phono) 
	{
		this.phono = phono;
	}
	public void setEmail(String email) 
	{
		this.email = email;
	}
	public void setFees(int fees) 
	{
		this.fees = fees;
	}
	public void setSha(String sha) 
	{
		this.sha = sha;
	}
	public String getSha() 
	{
		return sha;
	}
	
	public int getFees() 
	{
		return fees;
	}
	
	public String getName() 
	{
		return name;
	}
	public int getPhono() 
	{
		return phono;
	}
	public String getEmail() 
	{
		return email;
	}
	
	public Model()
	{
		try 
		{
			DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
			con=DriverManager.getConnection(url, un, pw);
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	}
	
	
	
	boolean insert()
	{
		try
		{
		pstmt=con.prepareStatement("insert into PGREGISTER  values(?,?,?)");
		pstmt.setString(1,name);
		pstmt.setInt(2, phono);
		pstmt.setString(3, email);
		pstmt.executeUpdate();
		return true;
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return false;
		
	}
	
	

}
