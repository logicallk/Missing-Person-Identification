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
 * Servlet implementation class AddComplaint
 */
public class AddComplaint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddComplaint() {
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
		
		String ms_name=request.getParameter("msName");
		String ms_gender=request.getParameter("msGen");
		String ms_color=request.getParameter("msHei");
		String ms_height=request.getParameter("msCol");
		String ms_age=request.getParameter("msAge");
		String ms_placelost=request.getParameter("msPlace");
		String ms_date=request.getParameter("msDate");
		String ms_time=request.getParameter("msTime");
		String ms_relno=request.getParameter("msRelno");
		
	
		try
		{
		Connection con=Connectdb.connect();
		PreparedStatement pss=con.prepareStatement("insert into missingperson values(?,?,?,?,?,?,?,?,?,?,?,?)");
		pss.setInt(1, 0);
		
		pss.setString(2, ms_name);
		pss.setString(3, ms_gender);
		pss.setString(4, ms_color);
		pss.setString(5, ms_height);
		pss.setString(6, ms_age);
		pss.setString(7, ms_placelost);
		pss.setString(8, ms_date);
		pss.setString(9, ms_time);
		pss.setString(10, ms_relno);
		pss.setString(11, User.getEmail());
		pss.setString(12, "Pending");
		int i=pss.executeUpdate();
		if(i>0)
		{
			System.out.println(i+" Missing complaint added successfully...");
			response.sendRedirect("pic.html");
		}
		else
		{
			System.out.println(i+" Missiong complaint added failed...");
			response.sendRedirect("PSfailed.html");
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
