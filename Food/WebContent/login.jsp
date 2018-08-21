<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="java.sql.*,logic.*"  %> 

<%!

	Login login=new Login();

%>

<!DOCTYPE html>
<html>
<head>
	<title>Login | Sign Up | Food Shop</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="css/nav.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<link rel="stylesheet" type="text/css" href="css/submenu.css">
</head>

<style type="text/css">
	body{
		background-image: url("images/bg4.jpg");
		background-repeat: no-repeat;
		background-size: cover;
		background-attachment: fixed;
		height: 100%;
	}
</style>

<!-- Main Logic  -->

	<%
		
		if(request.getParameter("sub_l")!=null){
			
			String uname=request.getParameter("uname");
			String pass=request.getParameter("pass");
			
			if(login.checkLogin(uname, pass))
			{
				int id=login.getId();
				session.setAttribute("usename",uname);
				session.setAttribute("uid",id);
				System.out.print(session.getAttribute("uid"));
				%>
				<jsp:forward page = "profile.jsp" />
				<%
			}
			else{
				if((uname.equals("admin"))&&(pass.equals("admin")))
				{
					session.setAttribute("usename",uname);
					response.sendRedirect("Admin/home.jsp");
				}
				%>
				<jsp:include page="modal.jsp" >
					<jsp:param value="Invalid Details" name="header"/>
					<jsp:param value="please check the user name and Password <br><br> if you Have more problem please contect us" name="content"/>				
				</jsp:include>
				<script type="text/javascript">modal.style.display = "block";</script>
				<%
			}
			
		}
		
	%>
	
	<%
		
		if(request.getParameter("sub_s")!=null){
			
			String uname=request.getParameter("uname");
			String pass=request.getParameter("pass");
			String email=request.getParameter("email");
			
			if(login.insertUserData(uname,email,pass)){
				%>
				<jsp:include page="modal.jsp" >
					<jsp:param value="Successfully" name="header"/>
					<jsp:param value="Please Login and Continue your Process" name="content"/>				
				</jsp:include>
				<script type="text/javascript">modal.style.display = "block";</script>
				<%
			}
			else{
				%>
				<jsp:include page="modal.jsp" >
					<jsp:param value="Invalid Details" name="header"/>
					<jsp:param value="please check the user name and Mail id <br><br> It may be Already Exits......" name="content"/>				
				</jsp:include>
				<script type="text/javascript">modal.style.display = "block";</script>
				<%
			}
			
		}
		
	%>

<!-- /Main Logic -->

<body>
	<div id="root">
		<!-- Nav Bar -->
			<jsp:include page="nav.jsp"></jsp:include>
		<!-- /Nav Bar -->

		<div class="container">
			<br><br><br><br><br><br>
			<div class="tab">
				<div class="row">
					<div class="col">
						<div class="cont">
							<h2>Login</h2>
							<br>
							<form action="" method="post" autocomplete="off">
							<input type="text" class="txt" name="uname" placeholder="User Name" required="">
							<br><br><br>
							<input type="password" class="txt" name="pass" placeholder="password" required="">
							<br><br><a href="#">Forgot password</a><br><br>
							
							<input type="submit" name="sub_l" class="btn" value="Login">
							</form>
						</div>
					</div>
					<hr>
					<div class="col">
						<div class="cont">
							<h2>Sign Up</h2>
							<br>
							<form method="post" autocomplete="off">
							<input type="text" class="txt" name="uname" placeholder="User Name" required="">
							<br><br><br>
							<input type="Email" class="txt" name="email" placeholder="Email Id" required="">
							<br><br><br>
							<input type="password" class="txt" name="pass" placeholder="password" required="">
							
							<br><br><br>
							<input type="submit" name="sub_s" class="btn" value="Sign Up">

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

<script type="text/javascript" src="js/navshad.js"></script>

</body>
</html>