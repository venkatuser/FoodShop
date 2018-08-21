<!DOCTYPE html>
<%@page import="logic.Login"%>
<%@page import="java.util.List"%>
<%@page import="config.Product_info"%>
<%@page import="logic.Product_info_Imp"%>
<%@page import="logic.Product_info_In"%>
<html>
<%
String id;
Product_info ob=null;
Product_info_In pin=new Product_info_Imp();
	if(request.getParameter("id")!=null){
		id=request.getParameter("id");
		List<Product_info> list=pin.getPrList(Integer.parseInt(id));
		ob=list.get(0);
		if(session.getAttribute("uid")!=null){
		
        %>	
		<jsp:include page="Buy.jsp" >
			<jsp:param value="<%=ob.getProduct_name() %>" name="header"/>
			<jsp:param value="<%=ob.getProduct_image() %>" name="img"/>
			<jsp:param value="<%=ob.getProduct_amount() %>" name="price"/>
			<jsp:param value="<%=ob.getProduct_description() %>" name="des"/>
			<jsp:param value="<%=Login.city %>" name="city"/>	
			<jsp:param value="<%=Login.address %>" name="address"/>	
			<jsp:param value="<%=Login.mobile %>" name="mobile"/>	
			<jsp:param value="<%=Login.pincode %>" name="pin"/>	
			<jsp:param value="<%=ob.getProduc_id() %>" name="id"/>
		</jsp:include>
		<script type="text/javascript">modal.style.display = "block";</script>
		
		<%
		}
	}else{
		response.sendRedirect("products.jsp");
	}
%>
<head>
	<title>Product - <%=ob.getProduct_name() %></title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/nav.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/submenu.css">
	<link rel="stylesheet" type="text/css" href="css/product.css">

</head>
<style type="text/css">
	body{
		background-image: url("images/bg.jpg");
		background-repeat: no-repeat;
		background-size: cover;
		background-attachment: fixed;
		height: 100%;
	}
</style>
<body>
	<div id="root">
			
		<!-- Nav Bar -->
			<jsp:include page="nav.jsp"></jsp:include>
		<!-- /Nav Bar -->
		
		
		<div id="items" align="center">
			<br><br><br><br><br><br><br><br><br><br><br><br>
			<h2><%=ob.getProduct_name() %> - Information</h2>
			<div class="tab">
			
				<div class="row">
					<div class="col">
						<img src="images/uploads/<%=ob.getProduct_image() %>" class="pinfo">
					</div>
					<div class="col">
						<div class="cont" align="left">
							<h2><%=ob.getProduct_name() %></h2>
							<br>
							<form method="post" autocomplete="off">
							<h3>Price</h3>
							<input type="text" class="txt" name="uname" value="<%=ob.getProduct_amount() %>" Readonly="readonly">
							<br><br><br>
							<h3>Availability</h3>
							<input type="text" class="txt" name="uname"  value="<%=ob.getProduct_availability() %>" Readonly="readonly">
							<br><br><br>
							<h4 style="text-align: justify;"><%=ob.getProduct_description() %></h4>
							<br><br><br>
							<input type="submit" name="sub" class="btn" value="Buy">
							</form>
						</div>
					</div>
				</div>
			</div>
			<br>
			
			<br>
	
		<hr>
		<h2 style="padding:40px;">Related Products</h2>
		
		<div class="tab" >
			
				<div class="row prd">
				<%
					  
						int i=0;
						List<Product_info> list=pin.getList();
						for( int j=1;j<=3;j++){
							Product_info pi=list.get(j);
				 %>
				
					<div class="col im">
						<div class="cc">
						 <a href="?id=<%=pi.getProduc_id() %>">
							<img src="images/uploads/<%=pi.getProduct_image() %>" class="image">
							<div class="overlay">
								<div class="tt">
									<br>
									<b><%=pi.getProduct_name() %></b>
									<br>
									<p>Rs - <%=pi.getProduct_amount() %></p>
									<p><input type="submit" class="btn " value="Buy" ></p>
								</div>
							</div>
						</a>
						</div>
						<br>
						<b><%=pi.getProduct_name() %></b>
					</div>
				
					 <%
					 	i++;
					 	if(i%3==0){
						 		%>
									 </div>
									 <div class="row prd">		
						 		<%
						 	}
						}
						
					 %>
				</div>
			
				
				</div>
		<br><br><br><br><br>
		</div>
					
		<footer>
			<div class="tab">
				<div class="row">
					<div class="col">
						<h3 align="center">Quick Links</h3>
						<p align="center">
							<a href=""> Products </a><br>
							<a href=""> About us </a><br>
							<a href=""> Login </a><br>
						</p>
					</div>
					<div class="col">
						<h3 align="center">Testimnal</h3>
						<p align="justify">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam</p>
					</div>
					<div class="col">
						<h3 align="center">Social Media</h3>
						<p align="center">
							<a href=""> Facbook </a><br>
							<a href=""> Twitter </a><br>
							<a href=""> Instagram </a><br>
						</p>
					</div>
				</div>
			</div>
			
		</footer>
		<div class="copy" align="center">
				All rights recived @ Food Shop
		</div>
	</div>

<script type="text/javascript" src="js/navshad.js"></script>
</body>
</html>