package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.util.ConcurrentDateFormat;

import database.DB;


@WebServlet("/IssueBookServlet")
public class IssueBookServlet extends HttpServlet 
{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		PrintWriter out = resp.getWriter();
		String book_id = req.getParameter("bid");
		String emp_id = req.getParameter("eid");

		if(IssueBook(book_id,emp_id)) 
		{
			out.println("<script type=\"text/javascript\">");
            out.println("alert('Book Issued Successful');");
            out.println("location='issuebook.jsp';");
            out.println("</script>"); 
		}
	}
	public static boolean IssueBook(String book_id,String emp_id) 
	{
		boolean sts=false;
		try
		{
			java.sql.Date d = new java.sql.Date(new java.util.Date().getTime());
			Connection con = DB.getCon();
			PreparedStatement ps = con.prepareStatement("insert into book_issue_return (EMP_ID,BOOK_ID,ISSUE_STS,ISSUE_DATE) values(?,?,?,?)");
			ps.setString(1, emp_id);
			ps.setString(2, book_id);
			ps.setString(3, "1");
			ps.setDate(4, d);;
			
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
