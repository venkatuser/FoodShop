package logic;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import config.user_login;

/**
 * Servlet implementation class AddUser
 */
@WebServlet("/updateUser")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user_login ob=new user_login();
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		ob.setId(Integer.parseInt(request.getParameter("id")));
		ob.setName(request.getParameter("name"));
		ob.setAddress(request.getParameter("address"));
		ob.setAge(Integer.parseInt(request.getParameter("age")));
		ob.setAlt_mobile(request.getParameter("amob"));
		ob.setAlt_name(request.getParameter("aname"));
		ob.setUsername(request.getParameter("username"));
		ob.setCity(request.getParameter("city"));
		ob.setPin(request.getParameter("pin"));
		ob.setEmail(request.getParameter("email"));
		ob.setMobile(request.getParameter("mobile"));
		User_info_in uin=new User_info_imp();
		if(uin.updateUser(ob)) {
			out.print(""
					+ "<script>"
					+ "alert('Updated');"
					+ "</scsript>"
					+ "");
			response.sendRedirect("profile.jsp");
		}else {
			out.print(""
					+ "<script>"
					+ "alert('Some Error Accourd please Check your Details');"
					+ "</scsript>"
					+ "");
			response.sendRedirect("profile.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
