<!DOCTYPE html>
<html>
<head>
	<title>Food | Shop</title>
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

<body onload="typer()">
	<div id="root">
		<!-- Nav Bar -->
		<jsp:include page="nav.jsp"></jsp:include>
		

		<!-- / Nav Bar -->
		<script type="text/javascript">
			txt="You are all invited to our Food Shop";
			i=0;
			j=0;
			s=50;
			l=txt.length;
			v=0;
			var images = ["images/bg1.jpg","images/bg3.jpg","images/bg.jpg","images/bg4.jpg"];
			function typer(){
				if(i<txt.length){
					document.getElementById("ban-cont").innerHTML +=txt.charAt(i);
					i++;
					
					 
				      

					setTimeout(typer,s); 

				}
				else{
					document.body.style.background = "url(" + images[v] + ") ";
				    document.body.style.backgroundSize="cover";
				    document.body.style.backgroundAttachment = "fixed";
				    document.body.style.transition="0.5s";  
				      v = v + 1;
				      
				      if (v == images.length) {
				        v =  0;
				      }
					setTimeout(clr,3000);
				}
			}
			function clr(){
				var t=txt;
				if(i>=0){
					document.getElementById("ban-cont").innerHTML=""+t.substring(0,i);
					i--;
					setTimeout(clr,s);
				}
				else{
					setTimeout(typer,500);
				}
			}
		</script>
		<div id="ban">
			<div class="tab" align="center">
				<div class="row">
					<div class="col  time" style="width: 60%;border: none;" align="center"><h1>Food Shop</h1>
						<lable id="ban-cont" ></lable>
					</div>
					<div class="col  time active" >
						<div class="tab" align="center">
							<div class="row">
								<div class="col ">
									<img src="images/bf.png"><br>
									Breakfast<br>
									9pm - 11pm
								</div>
								<div class="col">
									<img src="images/lun.png"><br>
									Lunch<br>
									12pm - 3pm
								</div>
							</div>
							<div class="row">
								<div class="col">
									<img src="images/din.png"><br>
									Dinner<br>
									9pm - 11pm
								</div>
								<div class="col">
									<img src="images/ice.png"><br>
									Ice Cream<br>
									9am - 11pm
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			


		</div>
		<div id="items" align="center">
			<br>
			<div class="tab">
				<div class="row pr">
					<div class="col">
						<img src="images/food.png">
						<p class="dis">
							Fast Food also available and it is fastly avilable
						</p>
					</div>
					<div class="col">
						<img src="images/server.png">
						<p class="dis">
							Fast Food also available and it is fastly avilable
						</p>
					</div >
					<div class="col">
						<img src="images/fastfood.png">
						<p class="dis">
							Fast Food also available and it is fastly avilable
						</p>
					</div>
					<div class="col">
						<img src="images/delivery.png">
						<p class="dis">
							Fast Food also available and it is fastly avilable
						</p>
					</div>
				</div>
			</div>
			<br><br>
			
			<hr>
			<br>
			<h1>Special Food</h1>
			<div class="tab">
				<div class="row pr s">
					<div class="col" style="box-shadow: none;">
						<img src="images/s2.jpg" class="lt">
					</div>
					<div class="col" style="box-shadow: none;">
						
							<b>
								Sour Cream & Onion Straws
							</b>
							<br><br>
							<p align="justify">Two familiar favorites finally meet but without the chip. Savory sour cream & onion come together with crisp, airy veggie straws for a snack that has 20% less fat than a greasy potato chip. At 140 calories per serving (38 straws), you'll never have to feel guilty indulging your salt tooth again.</p>

						
					</div>
				</div>
				<div class="row pr s">
					<div class="col" style="box-shadow: none;">
						
							<b>
								Vanilla Almond Clusters
							</b>
							<br><br>
							<p align="justify">For anyone who feels like they're always on the go, meet your new best friend. Almonds are kettle cooked and tossed with vanilla for a hearty crunch and a light sweetness. With 5g of protein per serving, pop a few of these bite-sized clusters anytime (and anywhere) you want something sweet and satisfying.</p>

						
					</div>
					<div class="col" align="center" style="box-shadow: none;">
						<img src="images/s1.jpg" class="lt">
					</div>
				</div>
			</div>

			<br>
			<hr>
			<br>
			<h1 align="center">Customer Says</h1>
			<div class="tab">
				<div class="row cs">
					<div class="col">
						<p><h2><b>  Selva Mani - </b></h2></p>
						<br>
						<p  style="text-align: justify;">"Hello Weinsteins: I randomly picked up your Lasanga tonight from whole foods because I wanted something light and raw. And let me just say that I was BLOWN AWAY by how yummy the dish was and on the spot said to myself "if eating raw can taste this good it"s time to commit fully and stop playing around!"</p>
					</div>
					<div class="col">
						<p><h2><b> - Prithivi - </b></h2></p>
						<br>
						<p  style="text-align: justify;">"I got my large order of Raw Vegan foods in today via UPS and was very impressed with the packaging & freshness as well as the quality of my meals. The Raw Tuna Sandwich was soooo good!! Looking forward to being a REGULAR ordering customer from now on!!"</p>
					</div>
				</div>
			</div>
			<br><br>
		</div>
		<div>
		<jsp:include page="footer.jsp"></jsp:include>


	</div>

<script type="text/javascript" src="js/navshad.js"></script>
</body>
</html>