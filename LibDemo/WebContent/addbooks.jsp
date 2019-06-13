<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Books</title>
    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin.css" rel="stylesheet">

  </head>

  <body class="bg-dark">

    <div class="container">
      <div class="card card-register mx-auto mt-5">
        <div class="card-header">Register an Account</div>
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
          <div class="text-center">
            <a class="d-block small mt-3" href="index.jsp">Login Page</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  </body>
</html>