package com.lokesh.missionpersonidentification;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lokesh.databcon.Connectdb;

/**
 * Servlet implementation class PoliceStation
 */
public class PoliceStation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PoliceStation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		
		try
		{
			Connection con=Connectdb.connect();
			PreparedStatement pq=con.prepareStatement("select * from police_st where PS_email=? and PS_password=?");
			pq.setString(1, email);
			pq.setString(2, pass);
			ResultSet rp=pq.executeQuery();
			if(rp.next())
			{ 
				User.setEmail(email);
				System.out.println("Login successfully...");
				response.sendRedirect("policestation-Home.html");
			}
			else
			{
				System.out.println("Login Failed...");
				response.sendRedirect("policelogin.html");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
