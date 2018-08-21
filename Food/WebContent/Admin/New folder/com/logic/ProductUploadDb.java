package com.logic;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Product_info;
import com.dbLogic.HibernateProduct_info;
import com.dbLogic.HibernateTrans;

/**
 * Servlet implementation class FileUploadDb
 */
@WebServlet("/ProductUploadDb")
public class ProductUploadDb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out=response.getWriter();
		HibernateProduct_info hp=new HibernateProduct_info();
		Product_info pi=new Product_info();
		
		pi.setProduct_name(request.getParameter("Pname"));
		pi.setProduct_image(request.getAttribute("imgfile").toString());
		pi.setProduct_amount(Double.parseDouble(request.getParameter("Pamount")));
		pi.setProduct_description(request.getParameter("Pdesc"));
		pi.setProduct_availability(request.getParameter("Pstock"));
		pi.setProduct_size(request.getParameter("Psize"));
		pi.setCategory_id(1/*Integer.parseInt(request.getParameter(""))*/);
		
		hp.AddProducts(pi);
		
		out.println("saved");
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
