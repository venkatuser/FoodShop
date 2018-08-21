package process;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import config.Product_info;
import logic.Product_info_Imp;
import logic.Product_info_In;

/**
 * Servlet implementation class ProductUpdation
 */
@WebServlet("/process")
public class ProductUpdation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name,amount,des,avl,id;
		name=request.getParameter("prname");
		amount=request.getParameter("pramt");
		id=request.getParameter("prid");
		des=request.getParameter("des");
		avl=request.getParameter("prab");
		Product_info prin=new Product_info();
		Product_info_In pi=new Product_info_Imp();
		
		if(request.getParameter("upd").equals("Update")) {
			prin.setProduc_id(Integer.parseInt(id));
			prin.setProduct_amount(amount);
			prin.setProduct_availability(avl);
			prin.setProduct_name(name);
			prin.setProduct_description(des);
			pi.updateProduct(prin);
				
		}
		else {
			
			prin.setProduc_id(Integer.parseInt(id));
			pi.deleteProduct(prin);
			
			
		}
		response.sendRedirect("Admin/view.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
