
<!DOCTYPE html>
<%@page import="MailSendAPI.SendMailSSL"%>
<%@page import="config.user_login"%>
<%@page import="logic.User_info_imp"%>
<%@page import="logic.User_info_in"%>
<%@page import="config.Orders"%>
<%@page import="java.util.List"%>
<%@page import="logic.Orders_imp"%>
<%@page import="logic.Orders_in"%>
<html>
<%
String name="",mobile="",price="",qun="",address="",product="",status="",id="",email="";
Orders_in orin=new Orders_imp();
	if(request.getParameter("id")!=null){
		 id=request.getParameter("id");
		List<Orders> li=orin.getOrder(Integer.parseInt(id));
		if(li.iterator().hasNext()){
			Orders orr=li.get(0);
			User_info_in uinfo=new User_info_imp();
			List<user_login> liu=uinfo.getEmplyee(orr.getUser_id());
			if(liu.iterator().hasNext()){
				user_login ulog=liu.get(0);
				name=ulog.getName();
				email=ulog.getEmail();
			}
			product=orr.getProduct_name();
			price=String.valueOf(orr.getTotal_price());
			qun=String.valueOf(orr.getQuantity());
			status=orr.getOrder_status();
			mobile=orr.getMobile();
			address=orr.getAddress()+"\n\nCity: "+orr.getCity()+"\nPin: "+orr.getPin();
		}
		
	}
	
	if(request.getParameter("st")!=null){
		id=request.getParameter("orid");
		status=request.getParameter("st");
		if(orin.updateOrder(Integer.parseInt(id), status)){
			sms.SMSApi sms=new sms.SMSApi();
			String msg="Haii your Order - "+product+" - is Dispatched and Deliver soon.......\n\nYou have to pay Rs : "+price+" By our Employee \n\n\nThanks for your Ordering .............";
			SendMailSSL.send("noreplaybyvenkat@gmail.com", "sendmail123",email, "Food - Shop | Order Information ", msg);
			%>
				<jsp:include page="../modal.jsp" >
					<jsp:param value="Update Successfully" name="header"/>
					<jsp:param value="Update...." name="content"/>				
				</jsp:include>
				<script type="text/javascript">modal.style.display = "block";</script>
			<%
		}else{
			%>
				<jsp:include page="../modal.jsp" >
					<jsp:param value="......." name="header"/>
					<jsp:param value="Updation Not Successfully..." name="content"/>				
				</jsp:include>
				<script type="text/javascript">modal.style.display = "block";</script>
			<%
		}
	}
	

%>
<head>
	<title>Managment</title>
	<link rel="stylesheet" type="text/css" href="css/nav.css">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
	<div class="root" >
		<jsp:include page="anav.jsp"></jsp:include>
		<div class="main">
			<h3 style="position: fixed;">Product Name</h3>
			<div class="list">
			
							<%
								
								List<Orders> list=orin.getOrders();
								for(Orders ob:list){
									if(!ob.getOrder_status().equals("Deliverd")){
										
										%>
										<a href="?id=<%=ob.getId() %>"><p ><%=ob.getProduct_name() %> - <%=ob.getQuantity() %></p></a>
										<%
										
									}
								}
							
							%>
				
			</div>

			<div class="status" align="center">
			<form action="" method="post">
				<div class="tab">
					<div class="row">
						<div class="col">
							<label>Product Name</label>
							<input type="text" class="txt sml" name="pname" value="<%=product %>" placeholder="Product name">
						</div>
						<div class="col">
							<label>Quantity</label>
							<input type="text" class="txt sml" name="qun" value="<%=qun %>" placeholder="Quantity">
						</div>
						<div class="col">
							<label>Total Price</label>
							<input type="text" class="txt sml" name="price" value="<%=price %>" placeholder="Total Price">
						</div>
					</div>
				</div>	<br><br>
				<div class="tab">
					<div class="row">
						<div class="col">
							<label>Name</label>
							<input type="text" class="txt" name="uname" value="<%=name %>" placeholder="Name">
						</div>
						<div class="col">
							<label>Mobile</label>
							<input type="text" class="txt" name="mob" value="<%=mobile %>" placeholder="Mobile">
							<input type="hidden" value="<%=id %>" name="orid">
						</div>
					</div>
				</div>
				<br>
				<div class="tab">
					<div class="row">
						<div class="col">
							<label>Address</label><br>
							<textarea class="textarea" name="address" placeholder="Address......"><%=address %></textarea>
						</div>
					</div>
				</div>
				<div class="tab">
					<div class="row">
					<%
						if(status.equals("Order Placed")){
					%>
						<div class="col">
							<input type="submit" class="btn y" name="st" value="Dispatch">
						</div>
					<%
						}
					%>
						<div class="col">
							<input type="submit" class="btn p" name="st" value="Deliverd">
						</div>
						
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
<script type="text/javascript" src="js/main.js"></script>
</body>
</html>