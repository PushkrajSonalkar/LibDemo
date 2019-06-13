package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DB;

@WebServlet("/UpdateBookServlet")
public class UpdateBookServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		PrintWriter out = resp.getWriter();
		String book_id = req.getParameter("bid");
		String book_name = req.getParameter("bname");
		String auther_name = req.getParameter("auname");
		String publication_name = req.getParameter("pname");
		String book_price = req.getParameter("price");
		String book_stock  = req.getParameter("bstock");
		if(UpdateBook(book_id,book_name,auther_name,publication_name,book_price,book_stock)) 
		{
			out.println("<script type=\"text/javascript\">");
            out.println("alert('Book Updated Successful');");
            out.println("location='viewbook.jsp';");
            out.println("</script>"); 
		}
	}

	private static boolean UpdateBook(String book_id, String book_name, String auther_name, String publication_name,
			String book_price, String book_stock) 
	{
		boolean sts=false;
		try
		{
			Connection con = DB.getCon();
			
			PreparedStatement ps = con.prepareStatement("UPDATE book_details set book_name=?, auther_name=?, publication_name=?, book_price=?, book_stock=? where book_id=?");
			ps.setString(1, book_name);
			ps.setString(2, auther_name);
			ps.setString(3, publication_name);
			ps.setString(4, book_price);
			ps.setString(5, book_stock);
			ps.setString(6, book_id);
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
