<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import="logic.Product_info_In"%>
<%@page import="logic.Product_info_Imp"%>
<%@page import="config.Product_info"%>
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
			<h1>View Products</h1>
			<div class="content" >
				
				<input type="text" id="myInput" onkeyup="search('myInput','myTable')" placeholder="Search for names.." title="Type in a name">

				<table id="myTable">
				  <tr class="header">
				    <th >Name</th>
				     <th >Image</th>
				    <th >Amount</th>
				    <th >Description</th>
				    
				   
				    <th >Availability</th>
				    <th >Process</th>
				  </tr>
				  
				  <%
					  Product_info_In pin=new Product_info_Imp();
					
						List<Product_info> list=pin.getList();
						for( Product_info pi:list){
				  %>
				  <tr>
				  <form action="../process" method="post">
				  
				    <td><input type="text" class="td" name="prname"  value="<%=pi.getProduct_name() %>" /></td>
				    <input type="hidden" value="<%=pi.getProduc_id() %>" name="prid">
				    <td><img src="../images/uploads/<%=pi.getProduct_image()  %>" width="100px" /></td>
				    <td><input type="text" class="td" name="pramt"  value="<%=pi.getProduct_amount() %>" /></td>
				    <td style="text-align: justify;"><textarea class="tar" name="des" ><%=pi.getProduct_description() %></textarea></td>
				    <td><input type="text" class="td" name="prab"  value="<%=pi.getProduct_availability() %>" /></td>
				    <td ><input type="submit" class="btn y sm" name="upd" value="Update"> <br><input type="submit" class="btn r sm" name="upd" value="Delete"></td>
				  
				  </form>
				  </tr>
				 <%
						}
				 %>
				</table>

				
			</div>
		</div>
	</div>
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>