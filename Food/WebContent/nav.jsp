<%@page import="config.Product_info"%>
<%@page import="logic.Product_info_Imp"%>
<%@page import="logic.Product_info_In"%>
<%@page import="java.util.List"%>
<%
	String uname;
		if(session.getAttribute("usename")!=null){
			uname=session.getAttribute("usename").toString();
		}else{
			uname=null;
		}
		
		Product_info_In pin=new Product_info_Imp();
		int i=0;
		List<Product_info> list=pin.getList();
		
%>


<nav id="MainNav" onload="addcart()">
	<header align="center" id="mhd">
		<div class="header" id="h">

			<div class="nav"><img src="images/icon.png" class="nav-img" id="logo"></div>
			<div class="nav"><label id="logotitle">Food Shop</label></div>
			<div class="al" onclick="navoc()">&#9776;</div>
		</div>
		<div class="link" id="l">
			<ul>
				<li><a href="index.jsp">Home</a></li>
				<li><a href="products.jsp">Products</a>
					<div class="submenu">
						<div class="tab">
							<div class="row">
								<div class="col nor">
								<a href="products.jsp"><b>Others</b></a>
								<%
									for(i=0;i<4;i++){
										Product_info pi=list.get(i);
								%>
									<a href="view.jsp?id=<%=pi.getProduc_id() %>"><%=pi.getProduct_name() %></a>
								<%
									}
							
								%>
								</div>
								<%
									for(i=0;i<4;i++){
										Product_info pi=list.get(i);
								%>
								<div class="col ad">
									<img src="images/uploads/<%=pi.getProduct_image() %>" width="200px">
									<a href="view.jsp?id=<%=pi.getProduc_id() %>"><%=pi.getProduct_name() %></a>			
								</div>
								<%
									}
								%>
							</div>
						</div>
					</div>
				</li>
				<li><a href="about.jsp">About us</a></li>
				<li><a href="cart.jsp" title="Cart" >Cart <img src="images/cart.png" width="25" style="position: relative;top: 6px;"><span id="countcart"></span></a></li>
				
					<li><form action="search.jsp" method="get" autocomplete="off"><img class="ss s2" src="images/search1.png"><img class="ss s1" src="images/search.png"><input type="text" name="q" class="search" placeholder="Search"/> </form></li>
				
			<%
				if(uname==null){
			%>
				<li><a href="login.jsp">Login</a></li>
			<%
				}
				else{
			%>
				<li><a href="logout.jsp">Logout</a>
					<div class="mini">
							<a href="profile.jsp"><img alt="Person" src="images/person.png" style="vertical-align: middle; width:25px; "> Welcome <%=uname %></a><br>
							
					</div>
				</li>
			<%
				}
			%>
			</ul>
		</div>
	</header>
</nav>