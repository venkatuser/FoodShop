<!DOCTYPE html>
<%@page import="config.user_login"%>
<%@page import="logic.User_info_imp"%>
<%@page import="logic.User_info_in"%>
<%@page import="logic.Orders_imp"%>
<%@page import="logic.Orders_in"%>
<%@page import="config.Product_info"%>
<%@page import="java.util.List"%>
<%@page import="logic.Product_info_In"%>
<%@page import="logic.Product_info_Imp"%>
<html>
<head>
	<title>Managment</title>
	<link rel="stylesheet" type="text/css" href="css/nav.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div class="root" >
		<jsp:include page="anav.jsp"></jsp:include>
		<div class="main">
			
			<%
			Orders_in oin=new Orders_imp();
			User_info_in uin=new User_info_imp();
			Product_info_In pri=new Product_info_Imp();
			List<user_login> list=uin.getEmployees();
			int tem=0;
			for(user_login ob:list){
				tem++;
			}
			List<Product_info> list1=pri.getList();
			int prlist=0;
			for(Product_info ob:list1){
				prlist++;
			}
			int a=oin.todayOrder();
			%>
			<h1>Dash Board</h1><br>
			<div align="center">
				<div class="tab">

					<div class="row">
						<div class="col p">
							<div class="data">
								<h3>Total Products</h3>
								<h1><%=prlist %></h1>
							</div>
					
						</div> <pre> </pre>
						<div class="col r">
							
							<div class="data">
								<h3>Today Order</h3>
								<h1><%=a %></h1>
							</div>
						</div> <pre> </pre>
						<div class="col y">
							<div class="data">
								<h3>Total Customer</h3>
								<h1><%=tem %></h1>
							</div>
							
						</div>
					</div>
					
				</div>
				<br>
				<h2>Current Data</h2><br>
				<div class="tab">
					<div class="row">
						<div class="col">
							<table id="myTable">
								<tr>
									<th>Product Name</th>
									<th>Price</th>
									<th>Availability</th>
									<th>Type</th>
								</tr>
								<%
									int i=0;
									
									List<Product_info> l=pri.getAvList();
									for(Product_info ob:l){
										i++;
								%>
								<tr>
									<td><%=ob.getProduct_name() %></td>
									<td><%=ob.getProduct_amount() %></td>
									<td><%=ob.getProduct_availability() %></td>
									<td><%=ob.getCategory_type() %></td>
								</tr>
								<%
									}if(i==0){
										%>
										<tr>
											<td colspan="4" style="text-align: center;"> All Products Are Available </td>
										</tr>
										<%
									}
								%>
							</table>
						</div>
					</div>
				</div>
				<br>
				<div class="tab">
					<div class="row">
						<div class="col">

						</div>
					
						
						
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>