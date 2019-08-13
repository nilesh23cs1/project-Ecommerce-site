<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<%!    
                  Connection con;
                  Statement st;
                  ResultSet rs;
            String id ,name,img,price,qty,delete;
           int cid,total,found,tb_qty,tqt,c,result;
           %>
          <%  id=request.getParameter("id");
                  session.setAttribute("i", id);  
             
              try
              {
                  Class.forName("com.mysql.jdbc.Driver");
              con=DriverManager.getConnection("jdbc:mysql://localhost/project","root","riccs");
              st=con.createStatement();
              }
              catch(Exception ex)
              {
                  out.print("ERROR  "+ex.getMessage());
              }
              
%>



























<%@ include file="productdetailheader.jsp" %> 
	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Shopping Cart</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
				
                                    
                                    
                                    
                                    
                                    
                                    <%	
                                         int final1= 0;
                                        
                                    if(session.getAttribute("customer")!=null)
                                    {%>
                                      <thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="price">Price</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>    
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                   <%  try
                                    {      
                                        String u=session.getAttribute("customer").toString();
            rs=st.executeQuery("select * from customerproduct where username='"+u+"'");
         while (rs.next())
                 {%>
                 
               
                                    <tbody>
                                     <tr>
							<td class="cart_product">
                                                            <%  String imgsrc="../realproject/productimages/"+rs.getString(1); %>
								<a href=""><img src="<%= imgsrc %>" alt="" height="100" width="100" /></a>
							</td>
							<td class="cart_description">
                                                            <h4><a href=""><%= rs.getString(2) %></a></h4>
							
							</td>
							<td class="cart_price">
								<p>$<%= rs.getString(3) %></p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									
									<input class="cart_quantity_input" type="text" name="quantity" value="<%= rs.getString(4) %>" autocomplete="off" size="2">
									
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">$<%= rs.getString(5) %></p>
							</td>
							<td class="cart_delete">
                                                     <%       delete="cartdelete.jsp?pim="+rs.getString(1); %> 
                                                            <a class="cart_quantity_delete" href="<%= delete %>"  ><i class="fa fa-times"></i></a>
							</td>
						</tr> 
                                    
                                    
                 
                 
                 
               <%  final1= final1+Integer.parseInt(rs.getString(5)); }
                session.setAttribute("total",final1); %>
                                    
    <h1 style="margin-left:850px;color:white;background-color:grey;  ">  Total Price: $<%= final1 %> </h1> 
                           
                                
                                        </tbody>
                                        </table>   


<%} 
             catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }
   }
     











else
                                    {

                                              c=0;
                                            Cookie ck1[]=request.getCookies();
                                            Cookie cook = null;
      if (ck1==null)
{ %> <script> alert("No item in cart");</script>  <%}
else {%>

                                        <thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="price">Price</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
                                         <% 
                                           for (int i = 0; i < ck1.length-1; i++) {
                                           
                                           cook = ck1[i];
                                           String[] tokens = cook.getValue( ).split("_");
                                           
                                           %>
                                           
                                           
                                               <tr>
							<td class="cart_product">
                                                               <%  String imgsrc="../realproject/productimages/"+tokens[0];%> 
								<a href=""><img src="<%= imgsrc %>" alt="" height="100" width="100" /></a>
							</td>
							<td class="cart_description">
								<h4><a href=""><%= tokens[1] %></a></h4>
							
							</td>
							<td class="cart_price">
								<p>$<%= tokens[2] %></p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									
									<input class="cart_quantity_input" type="text" name="quantity" value="<%=tokens[3]  %>" autocomplete="off" size="2">
									
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">$<%= tokens[4] %></p>
							</td>
							<td class="cart_delete">
                                                        <%    delete="cartdelete.jsp?pim="+cook.getName(); %>
								<a class="cart_quantity_delete" href="<%= delete %>" ><i class="fa fa-times"></i></a>
							</td>
						</tr> 
                                           
                                           <% }
                                             result=0;
                                             for (int i = 0; i < ck1.length-1; i++) {                                        
                                           cook = ck1[i];
                                           String[] tokens = cook.getValue( ).split("_");
                                           result=result+Integer.parseInt(tokens[4]);}
                                          session.setAttribute("total",result); 
                                           %>
                                        <h1 style="margin-left:850px;color:white;background-color:grey;  ">  Total Price: $<%= result %> </h1> 
                                       
                                           
                                           
                                        </tbody>
                                        </table>
<%}} %>
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                        
					

					
					
				
			</div>
		</div>
	</section> <!--/#cart_items-->

        <% if (session.getAttribute("customer")==null)
{ %>
<center>  <a href="customerlogin.jsp">   <input type="button" value="checkout"> </a></center>
   
<%}
else {
  %>
  <center>  <a href="cart1.jsp">   <input type="button" value="checkout"> </a></center>
<%}%>



	<footer id="footer"><!--Footer-->
		<div class="footer-top">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="companyinfo">
							<h2><span>e</span>-shopper</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,sed do eiusmod tempor</p>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe1.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe2.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe3.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
						
						<div class="col-sm-3">
							<div class="video-gallery text-center">
								<a href="#">
									<div class="iframe-img">
										<img src="images/home/iframe4.png" alt="" />
									</div>
									<div class="overlay-icon">
										<i class="fa fa-play-circle-o"></i>
									</div>
								</a>
								<p>Circle of Hands</p>
								<h2>24 DEC 2014</h2>
							</div>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="address">
							<img src="images/home/map.png" alt="" />
							<p>505 S Atlantic Ave Virginia Beach, VA(Virginia)</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="footer-widget">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Service</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Online Help</a></li>
								<li><a href="">Contact Us</a></li>
								<li><a href="">Order Status</a></li>
								<li><a href="">Change Location</a></li>
								<li><a href="">FAQ?s</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Quock Shop</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">T-Shirt</a></li>
								<li><a href="">Mens</a></li>
								<li><a href="">Womens</a></li>
								<li><a href="">Gift Cards</a></li>
								<li><a href="">Shoes</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>Policies</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Terms of Use</a></li>
								<li><a href="">Privecy Policy</a></li>
								<li><a href="">Refund Policy</a></li>
								<li><a href="">Billing System</a></li>
								<li><a href="">Ticket System</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="single-widget">
							<h2>About Shopper</h2>
							<ul class="nav nav-pills nav-stacked">
								<li><a href="">Company Information</a></li>
								<li><a href="">Careers</a></li>
								<li><a href="">Store Location</a></li>
								<li><a href="">Affillate Program</a></li>
								<li><a href="">Copyright</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3 col-sm-offset-1">
						<div class="single-widget">
							<h2>About Shopper</h2>
							<form action="#" class="searchform">
								<input type="text" placeholder="Your email address" />
								<button type="submit" class="btn btn-default"><i class="fa fa-arrow-circle-o-right"></i></button>
								<p>Get the most recent updates from <br />our site and be updated your self...</p>
							</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<p class="pull-left">Copyright ï¿½ 2013 E-SHOPPER Inc. All rights reserved.</p>
					<p class="pull-right">Designed by <span><a target="_blank" href="http://www.themeum.com">Themeum</a></span></p>
				</div>
			</div>
		</div>
		
	</footer><!--/Footer-->
	


    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/main.js"></script>
</body>
</html>