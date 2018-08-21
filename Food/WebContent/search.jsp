<%@page import="config.Product_info"%>
<%@page import="java.util.List"%>
<%@page import="logic.Product_info_Imp"%>
<%@page import="logic.Product_info_In"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
	Product_info_In prin=new Product_info_Imp();
	String query="";
	if(request.getParameter("q")!=null){
		query=request.getParameter("q");
	}
	List<Product_info> li=prin.search(query);

%>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search | Food Shop</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/nav.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/product.css">
	<link rel="stylesheet" type="text/css" href="css/submenu.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<style>
	.col{
		text-align: justify;
		
	}
	.row{
		margin-bottom: 20px;
	}
</style>
	<div id="root">
		
		<jsp:include page="nav.jsp"></jsp:include>
		
		<div class="items" align="center">
				<br><br><br><br><br><br><br><br>
			<h1 align="center">Products</h1>
			<div class="tab"  align="center">
				<%
					if(li.iterator().hasNext()){
					for(Product_info ob:li){
				%>
				<div class="row" >
					
					<div class="col" align="center">
						<div class="cont">
							<img alt="product name" src="images/uploads/<%=ob.getProduct_image() %>" width="260px">
						</div>
					</div>
					
					<div class="col">
						<div class="cont">
							 <a href="view.jsp?id=<%=ob.getProduc_id() %>"><h2><%=ob.getProduct_name() %></h2></a>
							 <br>
								<%=ob.getProduct_description() %>
								<br><br>
								<b>Price :</b> <%=ob.getProduct_amount() %>
								<br><br>
							<hr>
						</div>
					</div>
				
				</div>
				<%
					}
				}else{
					%>
						<div class="col" align="center">
						<div class="cont" align="center">
							<img alt="some" src="images/searchengin-brands.svg" width="100px">
							<h2>Not Found Please search Correct Keyword</h2>
						</div>
					</div>
					<%	
				}
				%>
				
				
				
				
				
			</div>
		</div>
		<br><br><br><br><br>
		<jsp:include page="footer.jsp"></jsp:include>
		
	</div>
<script type="text/javascript" src="js/navshad.js"></script>
</body>
</html>