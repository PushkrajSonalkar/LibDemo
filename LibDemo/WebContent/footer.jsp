 <div class="card-footer small text-muted"> 
            	<p id="demo"></p>
        	    <script>
					var d = new Date();
					document.getElementById("demo").innerHTML = d;
				</script>
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
    
<!--     Add Book Modal -->
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
         
         <!-- 			Issue a Book Modal -->
		     <div class="modal fade" id="IssueABook" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		      <div class="modal-dialog" role="document">
		        <div class="modal-content">
		          <div class="modal-header">
		            <h5 class="modal-title" id="exampleModalLabel">Issue a Book</h5>
		            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
		              <span aria-hidden="true">×</span>
		            </button>
		          </div>
		          <div class="card card-register mx-auto mt-5">
		            <div class="card-body">
		              <form method="post" action="IssueBookServlet">
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
		                        		<input type="text" id="firstName" class="form-control" name="eid" placeholder="Auther name" required="required" autofocus="autofocus">
		                       			<label for="firstName">Employee Id</label>
		                            </div>
		                       </div>
		                  </div>
		                </div>
		                <input type="submit" class="btn btn-primary btn-block" value="Issue a Book">
		              </form>
		            </div>
		          </div>
		      <div class="modal-footer">
		                  <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
		      </div>
		    </div>
		  </div>
		  </div> 
		  
			<!--   Return Book Modal    -->
			  <div class="modal fade" id="ReturnABook" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			      <div class="modal-dialog" role="document">
			        <div class="modal-content">
			          <div class="modal-header">
			            <h5 class="modal-title" id="exampleModalLabel">Return a Book</h5>
			            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
			              <span aria-hidden="true">×</span>
			            </button>
			          </div>
			          <div class="card card-register mx-auto mt-5">
			            <div class="card-body">
			              <form method="post" action="ReturnBookServlet">
			                <div class="form-row">
			                  <div class="col-md-6 col-sm-6">
			                    <div class="form-group">
			                            <div class="form-label-group">
			                              <input type="text" id="firstName" class="form-control" name="bid" placeholder="Book Call Id" required="required" autofocus="autofocus">
			                              <label for="firstName">Book Call Id</label>
			                            </div>
			                      </div>
			                  </div>
			                  <div class="col-md-6 col-sm-6">
			                    <div class="form-group">
			                            <div class="form-label-group">
			                              <input type="text" id="firstName" class="form-control" name="eid" placeholder="Book Call Id" required="required" autofocus="autofocus">
			                              <label for="firstName">Employee Id</label>
			                            </div>
			                      </div>
			                  </div>
			                 </div>
			                <input type="submit" class="btn btn-primary btn-block" value="Return a Book">
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