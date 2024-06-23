<%@ page import="com.lokesh.databcon.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Police Station view and delete</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <!-- Custom Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <style>
    .container-fluid
    {
    width:1800px;
    
    }
    </style>

</head>

<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">

        <!--**********************************
            Nav header start
        ***********************************-->
        <div class="nav-header">
            <div class="brand-logo">
                <a href="index.html">
                    <b class="logo-abbr"><img src="images/logo.png" alt=""> </b>
                    <!-- <span class="logo-compact"><img src="./images/logo.png" alt=""></span>
                    <span class="brand-title">
                        <img src="images/logo.png" alt="">
                    </span> -->
                </a>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
       <div class="header">    
            <div class="header-content clearfix">
                
                <div class="nav-control">
                    <div class="hamburger">
                        <span class="toggle-icon"><i class="icon-menu"></i></span>
                    </div>
                </div>
                <div class="header-left">
                    <div class="input-group icons">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1"></span>
                        </div>
                        
                       
                    </div>
                </div>

            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
          <div class="nk-sidebar">           
            <div class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                    <li class="nav-label">Admin</li>
                   
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">Police Station</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="form-validation.html">ADD</a></li>
                            <li><a href="PSviewAndDelete.jsp">View and Delete</a></li>

                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-envelope menu-icon"></i> <span class="nav-text">Complaint</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="compViewandDeleteAdmin.jsp">Missing View</a></li>
                             <li><a href="FoundcompViewandDeleteAdmin.jsp">Found View</a></li>
                        </ul>
                       
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">Finder</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="finderViewAdmin.jsp">View</a></li>
                           
                        </ul>
                    </li>
                     <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-envelope menu-icon"></i> <span class="nav-text">LogOut</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="LogoutServlet">logout</a></li>
                        </ul>
                       
                    </li>
                </ul>
            </div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>All Police Station</h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                         <thead>
                                            <tr>
                                                <th scope="col">Sr</th>
                                                <th scope="col">PS_id</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Contact</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">Password</th>
                                                <th scope="col">City</th>
                                                <th scope="col">Location</th>
                                                <th scope="col">Pincode</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
									         <%                                 
									           try{
									           Connection con=Connectdb.connect();
									          PreparedStatement ps=con.prepareStatement("select * from police_st");
									          ResultSet rs=ps.executeQuery();
									          while(rs.next())
									          {
									         %>
									         <tr>
									            <td><%=rs.getInt(1) %></td>
									            <td><%=rs.getString(2) %></td>
									            <td><%=rs.getString(3) %></td>
									            <td><%=rs.getString(4) %></td>
									            <td><%=rs.getString(5) %></td>
									            <td><%=rs.getString(6) %></td>
									            <td><%=rs.getString(7) %></td>
									            <td><%=rs.getString(8) %></td>
									            <td><%=rs.getString(9) %></td>
									            
									             <td><a href="deletePS.jsp?id=<%=rs.getInt(1)%>">Delete</a></td>
									            
									            
									         </tr>
									       <%
									          }
									           }
									         catch(Exception e)
									         {
									        	 e.printStackTrace();
									         }
									       %>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>Copyright &copy; Designed & Developed by Lokesh Patil 2023</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="plugins/common/common.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/settings.js"></script>
    <script src="js/gleek.js"></script>
    <script src="js/styleSwitcher.js"></script>

</body>

</html>