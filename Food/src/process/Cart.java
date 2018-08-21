package process;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MailSendAPI.SendMailSSL;
import config.Orders;
import logic.Orders_imp;
import logic.Orders_in;


@WebServlet("/buynow")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("uid").equals("0")) {
			response.sendRedirect("login.jsp");
		}else {
			
		PrintWriter out=response.getWriter();
		Orders ob=new Orders();
		Orders_in oin=new Orders_imp();
		ob.setDate(java.time.LocalDate.now().toString());
		ob.setTime(java.time.LocalTime.now().toString());
		ob.setOrder_status("Order Placed");
		ob.setUser_id(Integer.parseInt(request.getParameter("uid")));
		ob.setProduct_id(Integer.parseInt(request.getParameter("pid")));
		ob.setProduct_name(request.getParameter("pname"));
		ob.setQuantity(Integer.parseInt(request.getParameter("qun")));
		ob.setTotal_price(Double.parseDouble(request.getParameter("tot")));
		ob.setMobile(request.getParameter("mobnum"));
		ob.setAddress(request.getParameter("address"));
		ob.setCity(request.getParameter("city"));
		ob.setPin(request.getParameter("pin"));
		
		
		oin.addOrder(ob);
		sms.SMSApi sms=new sms.SMSApi();
		logic.Login log=new logic.Login();
		String msg="Haii your Order - "+request.getParameter("pname")+" - well be Deliverd Soon.....\n\nYou have to pay Rs : "+request.getParameter("tot")+" By our Employee \n\n\nThanks for your Ordering .............";
		SendMailSSL.send("noreplaybyvenkat@gmail.com", "sendmail123", log.getMail(), "Food - Shop | Order Information ", msg);
		if(sms.sendSMS(log.getMobile(), msg)) {
			response.sendRedirect("cart.jsp");
		}else {
			response.sendRedirect("products.jsp");
		}
		// sendMail=new SendMailSSL();
		
		
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
