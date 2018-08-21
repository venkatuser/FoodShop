package process;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import config.Product_info;
import logic.Product_info_Imp;
import logic.Product_info_In;



/**
 * Servlet implementation class FileUploadDb
 */
@WebServlet("/ProductUploadDb")
public class ProductUploadDb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		PrintWriter out=response.getWriter();
		Product_info_In pin=new Product_info_Imp();
		
		Product_info pi=new Product_info();
		
		pi.setProduct_name(request.getParameter("Pname"));
		pi.setProduct_image(request.getAttribute("imgfile").toString());
		pi.setProduct_amount(request.getParameter("price"));
		pi.setProduct_description(request.getParameter("Pdescription"));
		pi.setProduct_availability(request.getParameter("status"));
	
		pi.setCategory_type(request.getParameter("Catagery"));
		
		pin.addProduct(pi);

		response.sendRedirect("Admin/view.jsp");
		}catch(Exception e) {
			System.out.println(e);
			
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
