
<!DOCTYPE html>
<%@page import="logic.Orders_imp"%>
<%@page import="logic.Orders_in"%>
<%@page import="config.Orders"%>
<%@page import="java.util.List"%>
<html>
<%
	Orders_in orin=new Orders_imp();
	String uid="0";
	if(session.getAttribute("uid")==null){
		response.sendRedirect("login.jsp");
	}else{
		uid=session.getAttribute("uid").toString();
	}
	if(request.getParameter("id")!=null){
		String id=request.getParameter("id");
		if(orin.hideData(Integer.parseInt(id))){
			%>
				<jsp:include page="modal.jsp" >
					<jsp:param value="Deleted Successfully" name="header"/>
					<jsp:param value="Your Order is deleted" name="content"/>				
				</jsp:include>
				<script type="text/javascript">modal.style.display = "block";</script>
			<%
		}else{
			%>
				<jsp:include page="modal.jsp" >
					<jsp:param value="Sorry...." name="header"/>
					<jsp:param value="Your Order Order is Already Dispatch You cannot Delete " name="content"/>				
				</jsp:include>
				<script type="text/javascript">modal.style.display = "block";</script>
			<%
		}
	}

%>

<head>
	<title>About us</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/nav.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
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
	.col{
		margin: 10px;
	}
</style>
<body>
	<div id="root">
		<!-- Na Bar -->
			<jsp:include page="nav.jsp"></jsp:include>
		<!-- /Nav Bar -->
		<div id="items">
			<br><br><br><br><br><br><br><br>
			<div class="tab" style="width: 100%">
				<div class="row">
				
					<div class="col"  style="width: 50%">
					<br><br><h1>Order Status</h1>
						<div style="height:400px; overflow: auto;  padding: 20px;">
							<table id="myTable">
							<tr>
								<th>Product Name</th>
								<th>Quantity</th>
								<th>Total Price</th>
								<th>Status</th>
								<th>Action</th>
							</tr>
							<%
								
								List<Orders> list=orin.getOrders(Integer.parseInt(uid));
								for(Orders ob:list){
									if(!ob.getOrder_status().equals("Deliverd")){
										if(ob.getOrder_status().equals("Order Placed")){
							%>
							<tr class="y">
							<td><%=ob.getProduct_name() %></td>
								<td><%=ob.getQuantity() %></td>
								<td><%=ob.getTotal_price() %></td>
								<td><%=ob.getOrder_status() %></td>
								<td><a href="?id=<%=ob.getId() %>"><input type="submit" value="Delete" class="btn y"></a></td>
							<%
										}else if(ob.getOrder_status().equals("Dispatch")){
							%>
							<tr class="g">
							<td><%=ob.getProduct_name() %></td>
								<td><%=ob.getQuantity() %></td>
								<td><%=ob.getTotal_price() %></td>
								<td><%=ob.getOrder_status() %></td>
								<td align="center">  </a></td>
							<%
										}
							%>
								
							</tr>
							<%
									}
								}
							
							%>
							
							</table>
						</div>
					</div>
					<div class="col"  style="width: 50%">
					<br><br><h1>Your Orders</h1>
						<div style="height:400px; overflow: auto; padding: 20px;">
							
							<table id="myTable">
							<tr>
								<th>Product Name</th>
								<th>Quantity</th>
								<th>Total Price</th>
								
							</tr>
							<%
								
								list=orin.getOrders(Integer.parseInt(uid));
								for(Orders ob:list){
									if(ob.getOrder_status().equals("Deliverd")){		
							%>
								<tr class="p">
								<td><%=ob.getProduct_name() %></td>
								<td><%=ob.getQuantity() %></td>
								<td><%=ob.getTotal_price() %></td>
								
							</tr>
							<%
									}
								}
							
							%>
							
							</table>
						</div>
						
					</div>
				</div>
			</div>
			<br>
			
			<br>
		</div>
		
		<!-- Footer -->
			<jsp:include page="footer.jsp"></jsp:include>
		<!-- /Footer -->
	</div>

<script type="text/javascript" src="js/navshad.js"></script>
</body>
</html>