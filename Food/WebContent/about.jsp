<!DOCTYPE html>
<html>
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
</style>
<body>
	<div id="root">
		<!-- Na Bar -->
			<jsp:include page="nav.jsp"></jsp:include>
		<!-- /Nav Bar -->
		<div id="items">
			<br><br><br><br><br><br>
			<div class="tab">
				<div class="row">
					<div class="col">
						<h2>Timing</h2>
						<p>Morning 9:00 AM - 11 AM</p>
						<p>Afternoon 12:00 PM - 3 PM</p>
						<p>Night 7:00 PM - 11 PM</p>
					</div>
					<div class="col">
						<div class="cont">
							<h2>Contact US</h2>
							<br>
							<form method="post" autocomplete="off">
							<input type="text" class="txt" name="uname" placeholder="User Name" required="">
							<br><br><br>
							<input type="text" class="txt" name="uname" placeholder="Mobile Number" required="">
							<br><br><br>
							<textarea class="txt" placeholder="Message"></textarea>
							<br><br><br>
							<input type="submit" name="sub" class="btn" value="Send">
							</form>
						</div>
					</div>
				</div>
			</div>
			<br>
			
			<br>
		</div>
		<div class="map">
			<h2 align="center">Map</h2>
		</div>
		<!-- Footer -->
			<jsp:include page="footer.jsp"></jsp:include>
		<!-- /Footer -->
	</div>

<script type="text/javascript" src="js/navshad.js"></script>
</body>
</html>