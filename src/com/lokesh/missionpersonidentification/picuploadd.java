package com.lokesh.missionpersonidentification;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.UUID;
import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

/**
 * Servlet implementation class picuploadd
 */
@WebServlet("/UploadServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,    // 10MB
                 maxRequestSize = 1024 * 1024 * 50)  // 50MB
public class picuploadd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public picuploadd() {
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
		
		 String uploadPath = "C:/Users/acer/workspace1/missionpersonidentification/WebContent/missingPersonPic/"; // Specify the folder where you want to save the image

	        File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdir();
	        }

	        Part imagePart = request.getPart("image");
	        String fileName = getFileName(imagePart);
	        String folderName = request.getParameter("name");
	        String folderPath = uploadPath + File.separator + folderName;

	        File folder = new File(folderPath);
	        if (!folder.exists()) {
	            folder.mkdirs();
	        }

	        String filePath = folderPath + File.separator + fileName;
	        imagePart.write(filePath);
	       

	        response.sendRedirect("PSsuccess.html");
	    }

	    private String getFileName(Part part) {
	        String contentDisposition = part.getHeader("content-disposition");
	        String[] tokens = contentDisposition.split(";");
	        for (String token : tokens) {
	            if (token.trim().startsWith("filename")) {
	                return token.substring(token.indexOf("=") + 2, token.length() - 1);
	            }
	        }
	        return "";
	    }
	}


