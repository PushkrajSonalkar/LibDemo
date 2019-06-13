<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin View Book</title>
<link rel="icon" href="favicon.png" type="image/gif" >

<!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">

  </head>

  <body id="page-top">

<%
  if(session.getAttribute("email")==null){
    response.sendRedirect("index.jsp");
  }
%>
    <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

      <a class="navbar-brand mr-1" href="index-2.html">Library Admin</a>

      <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
      </button>

      <!-- Navbar Search -->
      <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        <div class="input-group" style="display: none;">
          <input type="text" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
          <div class="input-group-append">
            <button class="btn btn-primary" type="button">
              <i class="fas fa-search"></i>
            </button>
          </div>
        </div>
      </form>

      <!-- Navbar -->
      <ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown no-arrow mx-1"style="display: none;">
          <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-bell fa-fw"></i>
            <span class="badge badge-danger">9+</span>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
        <li class="nav-item dropdown no-arrow mx-1"style="display: none;">
          <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-envelope fa-fw"></i>
            <span class="badge badge-danger">7</span>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
            <a class="dropdown-item" href="#">Action</a>
            <a class="dropdown-item" href="#">Another action</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="#">Something else here</a>
          </div>
        </li>
        <li class="nav-item dropdown no-arrow">
          <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fas fa-user-circle fa-fw"></i>
          </a>
          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
          </div>
        </li>
      </ul>

    </nav>

    <div id="wrapper">

      <!-- Sidebar -->
      <ul class="sidebar navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="dashboard.jsp">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#AddBookModal">
            <i class="fa fa-cart-plus"></i>
            <span>Add Books</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="">
            <i class="fa fa-book"></i>
            <span>Issue Books</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="">
            <i class="fa fa-search"></i>
            <span>View Books</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="">
            <i class="fa fa-users"></i>
            <span>User Approval</span></a>
        </li>
      </ul>

      <div id="content-wrapper">

        <div class="container-fluid">

          <!-- Breadcrumbs-->
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="dashboard.jsp">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">Update Books</li>
          </ol>
<!-- 			Update Book Form -->
			<%@page import="java.sql.DriverManager"%>
			<%@page import="java.sql.ResultSet"%>
			<%@page import="java.sql.Statement"%>
			<%@page import="java.sql.Connection"%>
			<%
				String id = request.getParameter("book_id");
				String driver = "oracle.jdbc.driver.OracleDriver";
				String connectionUrl = "jdbc:oracle:thin:@localhost:1521:xe";
				String userid = "system";
				String password = "root123";
				try {
				Class.forName(driver);
				} catch (ClassNotFoundException e) {
				e.printStackTrace();
				}
				Connection connection = null;
				Statement statement = null;
				ResultSet resultSet = null;
			%>
			
      	  <div class="card card-register mx-auto mt-5">
            <div class="card-header">Update Book</div>
        		<div class="card-body">
        		<form method="post" action="UpdateBookServlet">
              	<%
						try{
						connection = DriverManager.getConnection(connectionUrl, userid, password);
						statement=connection.createStatement();
						String sql ="select * from book_details where book_id ="+ id;
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
					%>
                <div class="form-row">
                  <div class="col-md-6">
                    <div class="form-group">
                            <div class="form-label-group">
                              <input type="text" value=<%=resultSet.getString("book_id") %> class="form-control" name="bid" placeholder="Book Call Id" required="required" autofocus="autofocus">
                              <label for="firstName">Book Call Id</label>
                            </div>
                      </div>
                  </div>
                  <div class="col-md-6">
                            <div class="form-group">
                            <div class="form-label-group">
                              <input type="text" value=<%=resultSet.getString("book_name") %> class="form-control" name="bname" placeholder="Book name" required="required" autofocus="autofocus">
                              <label for="firstName">Book Name</label>
                            </div>
                       </div>
                  </div>
                </div>
                <div class="form-row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <div class="form-label-group">
                        <input type="text" value=<%=resultSet.getString("auther_name") %> class="form-control" name="auname" placeholder="Auther name" required="required" autofocus="autofocus">
                        <label for="firstName">Auther Name</label>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <div class="form-label-group">
                          <input type="text" value=<%=resultSet.getString("publication_name") %> class="form-control" name="pname" placeholder="Publication name" required="required" autofocus="autofocus">
                          <label for="firstName">Publication Name</label>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="form-row">
                    <div class="col-md-6">
                      <div class="form-label-group">
                        <input type="text" value=<%=resultSet.getString("book_price") %> class="form-control" name="price" placeholder="Price" required="required">
                        <label for="inputPassword">Book Price</label>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-label-group">
                        <input type="text" value=<%=resultSet.getString("book_stock") %> class="form-control" name="bstock" placeholder="Book Stock" required="required">
                        <label for="confirmPassword">Book Stock</label>
                      </div>
                    </div>
                  </div>
                </div>
                <input type="submit" class="btn btn-primary btn-block" value="Update Book">
                <%
						}
						connection.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
					%>
              </form>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

        <!-- Sticky Footer -->
        <footer class="sticky-footer">
          <div class="container my-auto">
            <div class="copyright text-center my-auto">
              <span>Copyright © Library Mgmt System 2019</span>
            </div>
          </div>
        </footer>

      </div>
      <!-- /.content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="LogoutServlet">Logout</a>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="AddBookModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Add Book</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
      	  <div class="card card-register mx-auto mt-5">
            <div class="card-body">
              <form method="post" action="AddBookServlet">
                <div class="form-row">
                  <div class="col-md-6">
                    <div class="form-group">
                            <div class="form-label-group">
                              <input type="text" id="firstName" class="form-control" name="bid" placeholder="Book Call Id" required="required" autofocus="autofocus">
                              <label for="firstName">Book Call Id</label>
                            </div>
                      </div>
                  </div>
                  <div class="col-md-6">
                            <div class="form-group">
                            <div class="form-label-group">
                              <input type="text" id="firstName" class="form-control" name="bname" placeholder="Book name" required="required" autofocus="autofocus">
                              <label for="firstName">Book Name</label>
                            </div>
                       </div>
                  </div>
                </div>
                <div class="form-row">
                  <div class="col-md-6">
                    <div class="form-group">
                      <div class="form-label-group">
                        <input type="text" id="firstName" class="form-control" name="auname" placeholder="Auther name" required="required" autofocus="autofocus">
                        <label for="firstName">Auther Name</label>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <div class="form-label-group">
                          <input type="text" id="firstName" class="form-control" name="pname" placeholder="Publication name" required="required" autofocus="autofocus">
                          <label for="firstName">Publication Name</label>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <div class="form-row">
                    <div class="col-md-6">
                      <div class="form-label-group">
                        <input type="text" id="inputPassword" class="form-control" name="price" placeholder="Price" required="required">
                        <label for="inputPassword">Book Price</label>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-label-group">
                        <input type="text" id="confirmPassword" class="form-control" name="bstock" placeholder="Book Stock" required="required">
                        <label for="confirmPassword">Book Stock</label>
                      </div>
                    </div>
                  </div>
                </div>
                <input type="submit" class="btn btn-primary btn-block" value="Add Book">
              </form>
            </div>
          </div>
      <div class="modal-footer">
                  <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
  </div>    
          
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>

    <!-- Demo scripts for this page-->
    <script src="js/demo/datatables-demo.js"></script>
    <script src="js/demo/chart-area-demo.js"></script>

  </body>
</html>