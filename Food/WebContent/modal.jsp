
<style>


/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 5; /* Sit on top */
    padding-top: 100px; /* Location of the box */
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
    
    color: white;
}
.butn{
	border: none;
	background-color: red;
	color: white;
	border-radius: 5px;
	width: 80px;
	height:40px;;
	
}


@media screen and (max-width:600px){

	.modal-content{
		width:80%;
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
      		out.println(" "+request.getParameter("header")+" ");
      	%>
      </h2>
    </div>
    <div class="modal-body">
    
    <%
    	String s=request.getParameter("content");
    	out.println(" "+s+" ");
    
    %>
     
    </div>
    <hr>
    <div class="modal-footer" align="right">
     <button onclick=" document.getElementById('myModal').style.display='none'" class="butn"> Cancel</button>
    </div>
  </div>

</div>

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