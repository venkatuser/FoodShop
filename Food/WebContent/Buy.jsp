
<%@page import="logic.Login"%>
<style>


/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 5; /* Sit on top */
    padding-top: 10px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    
    border: 1px solid #888;
    width: 700px;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 16px 16px;
    background-color: #03b8b9;
    color: white;
}

.modal-body {
	padding: 30px 20px;
	padding-bottom:80px;
	
}

.modal-footer {
    padding: 10px 16px;
    padding-bottom:0px;
    
    color: black;
}
.butn{
	border: none;
	background-color: red;
	color: white;
	border-radius: 5px;
	width: 80px;
	height:40px;;
	
}
.sline{
display: table;
}
.cll{
display: inline-block;
vertical-align: middle;
padding-left:30px;
width:40%;
}

.cll1{
display:table-cell;
vertical-align: middle;
padding-left:30px;
width:40%;
}
.tott,.ovtot{
	border: none;
	border-bottom: 2px solid black;
	padding:10px;
	background-color: rgba(255,255,255,0.2);
}
.quan{
	border: none;
	border-bottom: 2px solid black;
	padding:10px;
	background-color: rgba(255,255,255,0.2);
	width:90px;
}

@media screen and (max-width:1100px){
.modal-content {
		padding:50px;
	}
}

@media screen and (max-width:600px){

	.modal-content{
		width:80%;
	}
	.sline{
		display: block;
	}
	.cll,.cll1{
	display: block;
	width:100%;
	}
	.modal-content {
		padding:20px;
	}
	
	
}


</style>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close" onclick=" document.getElementById('myModal').style.display='none'">&times;</span>
      <h2 align="center">
      <%
		      
		
		      
		    Login login=new Login(); 
     		out.println(" "+request.getParameter("header"));
      		int uid=Integer.parseInt(session.getAttribute("uid").toString());
      %>
      </h2>
    </div>
     <form action="buynow" method="post" > 
    <div class="modal-body">
    
  
	  <div class="sline" >
						
			<div class="cll">
			<p align="left"><b><%=request.getParameter("header") %></b></p>
				<img src="images/uploads/<%=request.getParameter("img") %>" width="240px">
				
			</div>
			
			<div class="cll" align="justify" >
			<p align="center"><b>Description</b></p>
				<p style="overflow: auto; height:100px; padding: 10px;">
				<%=request.getParameter("des") %>
				</p>
			</div>
			
		</div><br><br>
		
		<div class="sline" >
		<input type="hidden" name="pid" value="<%=request.getParameter("id") %>" >
		<input type="hidden" name="uid" value="<%=uid %>" >
		<input type="hidden" name="pname" value="<%=request.getParameter("header") %>" >
		
			<div class="cll1">
				<p><b>Price</b></p>
				<input type="text"  name="Price" value="<%=request.getParameter("price") %>" class="tott" id="pr" readonly="readonly">
			</div>
			<div class="cll1">
			<p><b>Quantity</b></p>
				<input type="number" name="qun" value="0" onchange="addqun()" class="quan" id="qn" min="1">
			</div>
			
			<div class="cll1">
			<p><b>Total Amount</b></p>
				<input type="text" name="tot" value="0"  class="ovtot" id="atot" readonly="readonly">
			</div>
		
	</div>
	<br><br>
		<div class="sline" >
		
			<div class="cll1">
				<p><b>Address</b></p>
				<input type="text"  name="address" value="<%=request.getParameter("address") %>" class="tott" required="required" >
			</div>
			
			<div class="cll1">
			<p><b>City</b></p>
				<input type="text" name="city" value="<%=request.getParameter("city") %>" class="quan" required="required">
			</div>
			<div class="cll1">
			<p><b>PinCode</b></p>
				<input type="text" name="pin" value="<%=request.getParameter("pin") %>" class="quan" required="required">
			</div>
			<div class="cll1">
			<p><b>Mobile</b></p>
				<input type="text" name="mobnum" value="<%=request.getParameter("mobile") %>"  class="quan" >
			</div>
			
			
		
	</div>

     <p></p>
    </div>
    <hr>
    <div class="modal-footer" align="right"><b>Note *</b> You can Change Your Address Details
      <button type="submit" class="butn"> Buy</button>
    </div>
    </form>
  </div>

</div>
<script type="text/javascript">
			pr=document.getElementById('pr');
			qn=document.getElementById('qn');
			
			function addqun(){
				
				document.getElementById('atot').value=pr.value*qn.value;
			}
</script>
<script>

// Get the modal
var modal = document.getElementById('myModal');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

</script>