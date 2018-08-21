<%@page import="config.user_login"%>
<%@page import="java.util.List"%>
<%@page import="logic.User_info_imp"%>
<%@page import="logic.User_info_in"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile | Food Shop</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/nav.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/product.css">
	<link rel="stylesheet" type="text/css" href="css/submenu.css">
</head>
<body>
<%
	User_info_in uin=new User_info_imp();
	List<user_login> list=uin.getEmplyee(Integer.parseInt(session.getAttribute("uid").toString()));
	user_login ob=null;
	if(list.iterator().hasNext()){
		ob=list.get(0);
	}
%>

	<div class="root">
	
		<!-- Nav Bar -->
			<jsp:include page="nav.jsp"></jsp:include>
		<!-- /Nav Bar -->
		
		<br><br><br><br><br><br><br><br><br>
		
		<div class="items" align="center">
		<div class="cont">
			<form action="updateUser" method="post">
					<h2>Person Details</h2>
					<div class="tab">
						<div class="col">
							<input type="hidden" name="id" value="<%=ob.getId() %>">
							<p>Name</p>
							<input type="text" class="txt" value="<%=ob.getName() %>" name="name" placeholder="Name">
						</div>
						<div class="col">
							<p>Mobile</p>
							<input type="text" class="txt" value="<%=ob.getMobile() %>" name="mobile" placeholder="Mobile">
						</div>
						<div class="col">
							<p>Email</p>
							<input type="text" class="txt" value="<%=ob.getEmail() %>" name="email" placeholder="Email">
						</div>
					</div>
					<br><br>
					<div class="tab">
						<div class="col">
							<p>Age</p>
							<input type="text" class="txt small" value="<%=ob.getAge() %>" name="age" placeholder="Age">
						</div>
						<div class="col">
							<p>User Name</p>
							<input type="text" class="txt" name="username" value="<%=ob.getUsername() %>" placeholder="User Name" readonly="readonly">
						</div>
						<div class="col">
							<p>Alternate Person</p>
							<input type="text" class="txt" value="<%=ob.getAlt_name() %>" name="aname" placeholder="Name">
						</div>
						<div class="col">
							<p>Alternate Number</p>
							<input type="text" class="txt" value="<%=ob.getAlt_mobile() %>" name="amob" placeholder="Mobile">
						</div>
					</div>
					<br><br><br><br>
					<hr>
					<br><br>
					<h2>Persnal Details</h2>
					<div class="tab">
						<div class="col">
							<p>Address</p>
							<input type="text" class="txt" value="<%=ob.getAddress() %>" name="address" placeholder="Address">
						</div>
						<div class="col">
							<p>City</p>
							<input type="text" class="txt" value="<%=ob.getCity() %>" name="city" placeholder="City">
						</div>
						<div class="col">
							<p>Pin</p>
							<input type="text" class="txt" value="<%=ob.getPin() %>" name="pin" placeholder="Pin code">
						</div>
					</div>
					
					<br><br><hr>
					<div class="tab">
						
						<div class="col">
							<input type="submit" class="btn y" value="update">
						</div>
						
					</div>
				
			
			</form>
		</div>	
		</div>
		
		
		<!-- Footer -->
			<jsp:include page="footer.jsp"></jsp:include>
		<!-- /Footer -->
		
	</div>
<script type="text/javascript" src="js/navshad.js"></script>
</body>
</html>