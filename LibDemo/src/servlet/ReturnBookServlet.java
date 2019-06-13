package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DB;

@WebServlet("/ReturnBookServlet")
public class ReturnBookServlet extends HttpServlet 
{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		PrintWriter out = resp.getWriter();
		String book_id = req.getParameter("bid");
		String emp_id = req.getParameter("eid");

		if(ReturnBook(book_id,emp_id)) 
		{
			out.println("<script type=\"text/javascript\">");
            out.println("alert('Book Returned Successful');");
            out.println("location='issuebook.jsp';");
            out.println("</script>"); 
		}
		else 
		{
			out.println("<script type=\"text/javascript\">");
            out.println("alert('Please provide valid Book Id and Employee Id');");
            out.println("location='issuebook.jsp';");
            out.println("</script>"); 
		}
	}
	public static boolean ReturnBook(String book_id,String emp_id) 
	{
		boolean sts=false;
		try
		{
			java.sql.Date d = new java.sql.Date(new java.util.Date().getTime());
			Connection con = DB.getCon();
			PreparedStatement ps = con.prepareStatement("update book_issue_return set issue_sts=0 , issue_date=null , r_status=? , return_date= ? where emp_id= ? and book_id=?");
			ps.setInt(1, 1);
			ps.setDate(2, d);
			ps.setString(3, emp_id);
			ps.setString(4, book_id);
			
			ps.executeUpdate();
			sts=true;
			con.close();
		}catch(Exception e1)
		{
			e1.printStackTrace();
		}
		return sts;
	}
}
