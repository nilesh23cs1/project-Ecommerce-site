<%@page import="java.sql.*" %>


<%!
                  Connection con;
                  Statement st;
                  ResultSet rs;
            String pwd,uname,fname,lname,email,address,city,pcode,no,country;
           %>
          <%
             
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



<% if("submit".equals(request.getParameter("bt1")))
{
               uname=request.getParameter("t1");
               pwd=request.getParameter("t2");
               fname=request.getParameter("t3");
               lname=request.getParameter("t4");
               email=request.getParameter("t5");
               address=request.getParameter("t6");
               city=request.getParameter("t7");
               pcode=request.getParameter("t8");
               no=request.getParameter("t9");
               country=request.getParameter("t10");
                try
              {
            st.executeUpdate("insert into customer(firstname,lastname,password,email,address,city,pincode,contactno,username,country) values('"+fname+"','"+lname+"','"+pwd+"','"+email+"','"+address+"','"+city+"','"+pcode+"','"+no+"','"+uname+"','"+country+"')");
            %>   <script> alert("record inserted");</script>
            <%
              }
              catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }
              response.sendRedirect("customerlogin.jsp");
}              
%>






<!DOCTYPE html>
<html lang="en">
<head>
    <title>Registration Form </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/price-range.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body><!--/header-->

<section id="cart_items">
	  <div class="container"><!--/breadcrums-->

			<div class="step-one">
				<center><h2 class="heading"> Registration Form	</h2></center>
		</div>
			<div class="register-req">
				<p>Befor checkout you must register yourself or login</p>
			</div><!--/register-req-->

			<div class="shopper-informations">
				<div class="row">
				  <div class="col-sm-5 clearfix">
					  <div class="bill-to">
							<form name="f1" action="registration.jsp">
							<div class="form-one">
								
									<input type="text" placeholder="Username" name="t1" required >
									<input type="password" placeholder="Password*" name="t2" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="must contain 8 or more characters that are of at least one number, and one uppercase and lowercase letter"  >
									<input type="text" placeholder="First Name" name="t3" required pattern="[A-Za-z]{1,50}" title="please enter valid firstname pattern[ combination of A-Z or a-z]">
									<input type="text" placeholder="Last Name " name="t4" required pattern="[A-Za-z]{1,50}" title="please enter valid lastname pattern[ combination of A-Z or a-z]">
									<input type="text" placeholder="Email" name="t5"  required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="please enter valid email">
									<input type="text" placeholder="Address " name="t6" required>
									<input type="text" placeholder="City " name="t7" required pattern="[A-Za-z]{1,50}" title="please enter valid City pattern[ combination of A-Z or a-z]" >
									<input type="text" placeholder="Pincode" name="t8" required pattern="[0-9]{6}" title="please enter valid pin no pattern[ combination of 0-9 and 6 digit]">
				                                        <input type="text" placeholder="Contact No." name="t9" required pattern="[0-9]{10}" title="please enter valid Contact no pattern[ combination of 0-9 and 10 digit]" >

                                                        
                                                        </div>
							<div class="form-two">
								

									<select name="t10">
										<option>-- Country --</option>
										<option value="United States">United States</option>
			
										<option value="UK">UK</option>
										<option value="India">India</option>
										<option value="Pakistan">Pakistan</option>
									</select>
									
									
                                    <input name="bt1" type="submit" value="submit" name="bt1" style="color:white; background-color:black; margin-top: 20px;"> 
					</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="review-payment">
				<h2>&nbsp;</h2>
		  </div>
	</div>
	</section>
	<footer id="footer">
	  <div class="footer-top">
	    <div class="container">
	      <div class="row">
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
					<p class="pull-left">Copyright � 2013 E-SHOPPER Inc. All rights reserved.</p>
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