package com.lokesh.missionpersonidentification;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lokesh.databcon.Connectdb;

/**
 * Servlet implementation class AddPS
 */
public class AddPS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPS() {
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
		String ps_id=request.getParameter("psid");
		String ps_name=request.getParameter("psName");
		String ps_cont=request.getParameter("psContect");
		String ps_email=request.getParameter("psEmail");
		String ps_pass=request.getParameter("password");
		String ps_city=request.getParameter("psCity");
		String ps_location=request.getParameter("psLocation");
		String ps_pincode=request.getParameter("psPincode");
		try
		{
		Connection con=Connectdb.connect();
		PreparedStatement pss=con.prepareStatement("insert into police_st values(?,?,?,?,?,?,?,?,?)");
		pss.setInt(1, 0);
		pss.setString(2, ps_id);
		pss.setString(3, ps_name);
		pss.setString(4, ps_cont);
		pss.setString(5, ps_email);
		pss.setString(6, ps_pass);
		pss.setString(7, ps_city);
		pss.setString(8, ps_location);
		pss.setString(9, ps_pincode);
		int i=pss.executeUpdate();
		if(i>0)
		{
			System.out.println(i+" Police Station added successfully...");
			response.sendRedirect("Asuccess.html");
		}
		else
		{
			System.out.println(i+" Police Station added failed...");
			response.sendRedirect("Afailed.html");
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
