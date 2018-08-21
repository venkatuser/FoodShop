<!DOCTYPE html>
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
			<h1>Add Products</h1>
			<form action="../upload" enctype="multipart/form-data" method="post">
			<div class="content" >
				<div class="tab">
					<div class="row">
						<div class="col">
							<label>Product Name</label>
							<input type="text" class="txt n" name="Pname" placeholder="Product Name">
						</div>
						<div class="col">
							<label>Product Price</label>
							<input type="text" class="txt n" name="price"  placeholder="Price">
						</div>
						<div class="col">
							<label>Product Availability</label>
							<input type="text" class="txt n" name="status" placeholder="Availability">
						</div>
					</div>
					<div class="row">
						<div class="col">
							<label>Product Description</label>
							<input type="text" class="txt n" name="Pdescription" placeholder="Product Description">
						</div>
						
					</div>
				</div>
				<br>
				<hr><br>
				<div class="tab">
					<div class="row">
						
						<div class="col">
							<label>Image</label><br><br>
							
							    <label for="upload" class="file-upload__label">Uploade Image</label>
							    <input id="upload" class="file-upload__input" type="file" name="file">
							
						</div>
						<div class="col">
							<pre>	</pre>
							
						</div>
						<div class="col">
							<label>Catagery Type</label><br>
							<select class="txt" name="Catagery">
								<option value="pizza">Pizza</option>
								<option value="Chinnes">Chinnes food</option>
								<option value="Others">Others</option>
							</select>
						</div>
					</div>
					
				</div>
				<div class="tab">
					<div class="row">
						<div class="col">
							<input type="submit" class="btn p" name="" value="Add">
						</div>
						
						
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
<script type="text/javascript" src="js/main.js"></script>

</body>
</html>