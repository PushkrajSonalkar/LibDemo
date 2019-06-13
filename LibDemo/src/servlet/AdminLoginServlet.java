package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminLogin")
public class AdminLoginServlet extends HttpServlet
{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String email = req.getParameter("email");
		String psw = req.getParameter("psw");
		
		if(email.equals("p@gmail.com") && psw.equals("123")) 
		{
			HttpSession session= req.getSession();
			session.setAttribute("email", email);
			resp.sendRedirect("dashboard.jsp");
		}
		else
		{
			resp.sendRedirect("Admin.jsp");
		}
	}
}
