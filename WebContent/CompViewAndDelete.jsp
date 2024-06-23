<%@ page import="com.lokesh.databcon.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.lokesh.missionpersonidentification.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Police Station Home</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="images/favicon.png">
    <!-- Pignose Calender -->
    <link href="plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    <!-- Custom Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    
   <style>
    .container-fluid
    {
    width:2400px;
    
    }
    
    .content-body{
    background-image:url(R-1.jpg);
    background-repeat:no-repeat;
    background-position:center;
    background-size:cover;
    background-bottom:500px;
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
                   <!--  <span class="logo-compact"><img src="images/logo-.png" alt=""></span>
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
                    <li class="nav-label">Police Station</li>
                   
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-envelope menu-icon"></i> <span class="nav-text">Complaint</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="addmissingcomplaint.html">Add</a></li>
                            <li><a href="CompViewAndDelete.jsp">Missing View&Delete</a></li>
                             <li><a href="FoundCompViewAndDelete.jsp">Found View&Delete</a></li>
                        </ul>
                       
                    </li>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">Finder</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="finderViewMP.jsp">View</a></li>
                           
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

        
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>All Missing Complaint</h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                         <thead>
                                            <tr>
                                                <th scope="col">Sr</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Gender</th>
                                                <th scope="col">Height</th>
                                                <th scope="col">Color</th>
                                                <th scope="col">Age</th>
                                                <th scope="col">Place of Missing</th>
                                                <th scope="col">Date</th>
                                                <th scope="col">Time</th>
                                                <th scope="col">Relative No</th>
                                                <th scope="col">PoliceStation Email</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Action</th>
                                                <th scope="col">Mark</th>
                                            </tr>
                                        </thead>
                                        <tbody>
									         <%                                 
									           try{
									           Connection con=Connectdb.connect();
									          PreparedStatement ps=con.prepareStatement("select * from missingperson where status=? and PS_email=?");
									          ps.setString(1, "Pending");
									          ps.setString(2, User.getEmail());
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
									              <td><%=rs.getString(10) %></td>
									               <td><%=rs.getString(11) %></td>
									                <td><%=rs.getString(12) %></td>
									            
									             <td><a href="deleteMC.jsp?id=<%=rs.getInt(1)%>">Delete</a></td>
									             <td><a href="markasFound.jsp?id=<%=rs.getInt(1)%>">Mark as found</a></td>
									            
									            
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

    <!-- Chartjs -->
    <script src="plugins/chart.js/Chart.bundle.min.js"></script>
    <!-- Circle progress -->
    <script src="plugins/circle-progress/circle-progress.min.js"></script>
    <!-- Datamap -->
    <script src="plugins/d3v3/index.js"></script>
    <script src="plugins/topojson/topojson.min.js"></script>
    <script src="plugins/datamaps/datamaps.world.min.js"></script>
    <!-- Morrisjs -->
    <script src="plugins/raphael/raphael.min.js"></script>
    <script src="plugins/morris/morris.min.js"></script>
    <!-- Pignose Calender -->
    <script src="plugins/moment/moment.min.js"></script>
    <script src="plugins/pg-calendar/js/pignose.calendar.min.js"></script>
    <!-- ChartistJS -->
    <script src="plugins/chartist/js/chartist.min.js"></script>
    <script src="plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>



    <script src="js/dashboard/dashboard-1.js"></script>

</body>

</html>