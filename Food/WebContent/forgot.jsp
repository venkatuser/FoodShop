<%@page import="MailSendAPI.SendMailSSL"%>
<%@page import="net.bytebuddy.utility.RandomString"%>
<%@page import="com.sun.corba.se.spi.orbutil.fsm.Guard.Result"%>
<%@page import="java.sql.*,logic.*"  %> 

<%!
	Login login=new Login();
%>


<!DOCTYPE html>
<html>
<head>
	<title>Forgot Password | Food Shop</title>
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


<body>
	<div id="root">
		<!-- Nav Bar -->
			<jsp:include page="nav.jsp"></jsp:include>
		<!-- /Nav Bar -->

		<div class="container" align="center">
			<br><br><br><br><br><br><br><br><br><br><br>
			
						<div id="firsts">
							<h2>Forgot Password</h2>
							<br>
							
							<p>Please Enter the valid Email Id we send the Verification Code Through the Email</p><br><br>
							<form action="" method="post" autocomplete="off">
							<input type="email" class="txt" name="mail" placeholder="Email Id" required="">
							<br><br>
							
							<input type="submit" name="checkEmail" class="btn" value="send">
							</form>
							<br><br><br><br><br><br><br><br>
						</div>
						<div id="seconds">
							<h2>Forgot Password</h2>
							<br>
							<%
								String code="";

								if(session.getAttribute("code")!=null){
									code=session.getAttribute("code").toString();
								}
								
							%>
							<p>Please Enter the OTP words <span id="ss"></span></p><br><br>
							<form action="" method="post" autocomplete="off">
							<input type="text" class="txt" name="code" placeholder="...."  required="">
							<br><br>
							
							<input type="submit" name="validation" class="btn" value="send">
							</form>
							<br><br><br><br><br><br><br><br>
						</div>
						<div id="Thirds">
							<h2>Forgot Password</h2>
							<br>
							<p>Please Enter the New Password</p><br><br>
							<form action="" method="post" autocomplete="off">
							<input type="password" class="txt" name="pass" placeholder="New Password"  required="">
							<br><br>
							
							<input type="submit" name="changePassword" class="btn" value="send">
							</form>
							<br><br><br><br><br><br><br><br>
						</div>
		</div>

	</div>
	<script type="text/javascript">

	document.getElementById('seconds').style="display:none";
	document.getElementById('firsts').style="display:block";
	document.getElementById('Thirds').style="display:none";

	</script>
</body>

<%
String email="";
	if(request.getParameter("checkEmail")!=null){
	
	email=request.getParameter("mail");

		if(login.checkEmail(email)){
			RandomString c=new RandomString();
			code=c.nextString();
			String msg="hello sir/Madom \n\n Your OTP Code is\n "+code;
			SendMailSSL.send("noreplaybyvenkat@gmail.com", "sendmail123", email, "Food - Shop | Forgot password ", msg);
			session.setAttribute("code",code);
			session.setAttribute("em",email);
			%>
			<script type="text/javascript">
				document.getElementById('seconds').style="display:block";
				
				document.getElementById('firsts').style="display:none";
				document.getElementById('Thirds').style="display:none";
			</script>
			<%
		}
		else{
			
			
			%>
			<jsp:include page="modal.jsp" >
				<jsp:param value="Invalid Details" name="header"/>
				<jsp:param value="please check the Mail id <br><br> Given Mail id Is Not Exits" name="content"/>				
			</jsp:include>
			<script type="text/javascript">modal.style.display = "block";</script>
			<%
		}
	
	}
	else if(request.getParameter("validation")!=null){
		code=request.getParameter("code");
		%>
		<script type="text/javascript">
			document.getElementById('firsts').style="display:none";
			document.getElementById('seconds').style="display:block";
			document.getElementById('Thirds').style="display:none";
		</script>
		<%
		if(session.getAttribute("code").toString().equals(code)){
			
			%>
			<script type="text/javascript">
				document.getElementById('firsts').style="display:none";
				document.getElementById('seconds').style="display:none";
				document.getElementById('Thirds').style="display:block";
			</script>
			<%
		}
		else{
			%>
			<jsp:include page="modal.jsp" >
				<jsp:param value="Invaild value" name="header"/>
				<jsp:param value="please check the Mail id <br><br> and then try again" name="content"/>				
			</jsp:include>
			<script type="text/javascript">modal.style.display = "block";</script>
			<%
		}
	}else if(request.getParameter("changePassword")!=null){
		String pass=request.getParameter("pass");
		email=session.getAttribute("em").toString();
		
		if(login.updatePassword(pass, email)){
			response.sendRedirect("login.jsp");
		}
		else{
			%>
			<jsp:include page="modal.jsp" >
				<jsp:param value="Some Problem" name="header"/>
				<jsp:param value="please do it again " name="content"/>				
			</jsp:include>
			<script type="text/javascript">modal.style.display = "block";</script>
			<%
		}
		
	}

%>

</html>