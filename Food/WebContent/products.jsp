

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
Product_info_In pin1=new Product_info_Imp();
	if(request.getParameter("id")!=null){
		id=request.getParameter("id");
		List<Product_info> list=pin1.getPrList(Integer.parseInt(id));
		ob=list.get(0);
		if(session.getAttribute("uid")!=null){
		%>
		
		<jsp:include page="Buy.jsp" >
			<jsp:param value="<%=ob.getProduct_name() %>" name="header"/>
			<jsp:param value="<%=ob.getProduct_image() %>" name="img"/>
			<jsp:param value="<%=ob.getProduct_amount() %>" name="price"/>
			<jsp:param value="<%=ob.getProduct_description() %>" name="des"/>	
			<jsp:param value="<%=ob.getProduc_id() %>" name="id"/>	
			<jsp:param value="<%=Login.city %>" name="city"/>	
			<jsp:param value="<%=Login.address %>" name="address"/>	
			<jsp:param value="<%=Login.mobile %>" name="mobile"/>	
			<jsp:param value="<%=Login.pincode %>" name="pin"/>	
			<jsp:param value="<%=ob.getProduc_id() %>" name="id"/>		
		</jsp:include>
		<script type="text/javascript">modal.style.display = "block";</script>
		
		<%
		}else{
			%>
			<jsp:include page="modal.jsp" >
				<jsp:param value="Please Login" name="header"/>
				<jsp:param value="Login and you can buy the product <br><br> if you Have no Account please Create a new One" name="content"/>				
			</jsp:include>
			<script type="text/javascript">modal.style.display = "block";</script>
			<%
		}
		
	}else{
		//response.sendRedirect("products.jsp");
	}
	
%>

<head>
	<title>Products | Food Shop</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/nav.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/product.css">
	<link rel="stylesheet" type="text/css" href="css/submenu.css">

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
			<br><br><br><br>
			<h1 align="center">Products</h1>
			<br>
			<hr>
			<br><br>
			<div class="tab">
			
				<div class="row prd">
				<%
					  Product_info_In pin=new Product_info_Imp();
						int i=0;
						List<Product_info> list1=pin.getList();
						for( Product_info pi:list1){
				 %>
					<div class="col im">
						<div class="cc">
						<a href="view.jsp?id=<%=pi.getProduc_id() %>">
							<img src="images/uploads/<%=pi.getProduct_image() %>" class="image">
							<div class="overlay">
								<div class="tt">
									<br>
									<b><%=pi.getProduct_name() %></b>
									<br>
									<p>Rs - <%=pi.getProduct_amount() %></p>
									<form action="?id=<%=pi.getProduc_id() %> " method="post" >
									<p><input type="submit" class="btn " value="Buy" name="buy" ></p>
									</form>
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
					
			<br><br><br><br>

			</div>
			
		<!-- Footer -->
			<jsp:include page="footer.jsp"></jsp:include>
		<!-- /Footer -->

	</div>
<script type="text/javascript">
	i=0;
	function addCart() {

		
		if(sessionStorage.getItem('cart_count')==null){
			i=1;
			sessionStorage.setItem('cart_count',i);
		}else{
			i=sessionStorage.getItem('cart_count')
			sessionStorage.setItem('cart_count',i);
			i++;
		}
		document.getElementById('countcart').innerHTML=i;
		sessionStorage.setItem('cart_count',i);
	}
</script>
<script type="text/javascript" src="js/navshad.js"></script>

</body>
</html>