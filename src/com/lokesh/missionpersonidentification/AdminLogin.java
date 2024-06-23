package com.lokesh.missionpersonidentification;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

/**
 * Servlet implementation class AdminLogin
 */
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
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
		
		if(email.equals("admin@gmail.com") && pass.equals("admin"))
		{
			 HttpSession session = request.getSession();
			session.setAttribute("email", email);
			System.out.println("Login successfully...");
			response.sendRedirect("Admin.html");
		}
		else
		{
			System.out.println("Login Failed...");
			response.sendRedirect("page-login.html");
		}
	}

}
