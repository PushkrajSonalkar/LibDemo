<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
          <jsp:include page="nav.jsp" />  
    
    <div id="wrapper">

      <!-- Sidebar -->
      <jsp:include page="sidenav.jsp" />
<div id="content-wrapper">

        <div class="container-fluid">

          <!-- Breadcrumbs-->
          <ol class="breadcrumb">
            <li class="breadcrumb-item">
              <a href="dashboard.jsp">Dashboard</a>
            </li>
            <li class="breadcrumb-item active"><a href="issuebook.jsp">Issue or Return Book</a></li>
            <li class="breadcrumb-item active">Requested Books</li>
          </ol>
          
          <!-- DataTables Example -->
			<%@page import="java.sql.DriverManager"%>
			<%@page import="java.sql.ResultSet"%>
			<%@page import="java.sql.Statement"%>
			<%@page import="java.sql.Connection"%>
			<%
				String id = request.getParameter("userid");
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
			
          <div class="card mb-3">
            <div class="card-header">
              <i class="fas fa-table"></i>
             Requested Books Table</div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>Book Call No</th>
                      <th>Book Name</th>
                      <th>Auther Name</th>
                      <th>Publication Name</th>
                      <th>Price</th>
                      <th>Stock</th>
                      <th>Edit</th>
                      <th>Delete</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>Book Call No</th>
                      <th>Book Name</th>
                      <th>Auther Name</th>
                      <th>Publication Name</th>
                      <th>Price</th>
                      <th>Stock</th>
                      <th>Edit</th>
                      <th>Delete</th>
                    </tr>
                  </tfoot>
                  <tbody>
                    <%
						try{
						connection = DriverManager.getConnection(connectionUrl, userid, password);
						statement=connection.createStatement();
						String sql ="select * from book_details";
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
					%>
						<tr>
						<td><%=resultSet.getString("book_id") %></td>
						<td><%=resultSet.getString("book_name") %></td>
						<td><%=resultSet.getString("auther_name") %></td>
						<td><%=resultSet.getString("publication_name") %></td>
						<td><%=resultSet.getString("book_price") %></td>
						<td><%=resultSet.getString("book_stock") %></td>
						<td><a class="btn btn-primary" href="updatebook.jsp?book_id=<%=resultSet.getString("book_id")%>">Update</a></td>
						<td><a class="btn btn-info" href="DeleteBookServlet?book_id=<%=resultSet.getString("book_id") %>">Delete</a></td>
						</tr>
					<%
						}
						connection.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
					%>
                  </tbody>
                </table>
              </div>
            </div>
            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
          </div>
          
          
          
          </div>
        <!-- /.container-fluid -->
<jsp:include page="footer.jsp" />  
          