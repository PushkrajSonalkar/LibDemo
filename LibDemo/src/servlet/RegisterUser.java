package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DB;
@WebServlet("/RegiUser")
public class RegisterUser 
{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String user = req.getParameter("uname");
		PrintWriter out = resp.getWriter();
		String empid=req.getParameter("eid");
		String email= req.getParameter("uemail");
		String psw = req.getParameter("psw");
		String cpsw = req.getParameter("cpsw");
		if(cpsw.equals(psw)) 
		{
			if(RegisterUser.Register(empid,user,email, psw)) {
				out.println("<script type=\"text/javascript\">");
                out.println("alert('Registration Successful');");
                out.println("location='index.jsp';");
                out.println("</script>");                         
			}
		}
		else {
			resp.sendRedirect("RegisterUser.jsp");
			
		}
		
	}
	public static boolean Register(String i,String u, String e,String p) 
	{
		boolean sts=false;
		try
		{
			Connection con = DB.getCon();
			
			PreparedStatement ps = con.prepareStatement("insert into book_user values(?,?,?,?,?)");
			ps.setString(1, i);
			ps.setString(2, u);
			ps.setString(3, e);
			ps.setString(4, p);
			ps.setLong(5, 0);
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
