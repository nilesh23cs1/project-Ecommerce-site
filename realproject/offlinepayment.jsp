<%@page import="java.sql.*" %>
  <%@ page import="java.util.*" %>

<%!
                  Connection con;
                  Statement st,stt,sttt,stttt;
                  ResultSet rs,rs1;
            String uname,date,result,ptype,bname,branch,cvv,card;
           %>
          <% 
             
              try
              {
                  Class.forName("com.mysql.jdbc.Driver");
              con=DriverManager.getConnection("jdbc:mysql://localhost/project","root","riccs");
              st=con.createStatement();
                 stt=con.createStatement();
                    sttt=con.createStatement();
                       stttt=con.createStatement();
              }
              catch(Exception ex)
              {
                  out.print("ERROR  "+ex.getMessage());
              }
%>



<% if("Pay Now".equals(request.getParameter("bt1")))
{  date= new java.util.Date().toString();
    result=session.getAttribute("total").toString();;
    
  ptype=request.getParameter("t1");
       uname=session.getAttribute("customer").toString();         
               bname=request.getParameter("t2");
               branch=request.getParameter("t3");
               cvv=request.getParameter("t4");
               card=request.getParameter("t5");
             
                try
                {  
                    
            st.executeUpdate("insert into offlinepayment values('"+uname+"','"+ptype+"','"+result+"','"+bname+"','"+branch+"','"+cvv+"','"+card+"','"+date+"')");
             rs=st.executeQuery("select * from customerproduct where username='"+uname+"'");
            while(rs.next())
            {
 stt.executeUpdate("insert into payedproduct values('"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getString(3)+"','"+rs.getString(4)+"','"+rs.getString(5)+"','"+rs.getString(6)+"')");

            }
            int customerquant,productquant;
            String productimage,sproductquant;
            rs=st.executeQuery("select * from customerproduct where username='"+uname+"'"); 
            while(rs.next())
            {
            customerquant=Integer.parseInt(rs.getString(4));
            productimage=rs.getString(1);
              rs1=stt.executeQuery("select * from product where product_img='"+ productimage+"'"); 
            if(rs1.next())
            {
                   productquant=Integer.parseInt(rs1.getString(4));
                   productquant=productquant-customerquant;
                   sproductquant=String.valueOf(productquant);
                   stttt.executeUpdate("update product set product_qty='"+ sproductquant+"' where product_img='"+ productimage+"' ");  
            }}
             
            
            
            
              
            stt.executeUpdate("delete from customerproduct where username='"+uname+"'");
            response.sendRedirect("paypalsuccess.jsp");
                }
                
              catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }
            
}   





%>






<!DOCTYPE html>
<html lang="en">
<head>
    <title>Payment Page</title>
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
				<center><h2 class="heading"> Payment Page	</h2></center>
		</div>
			<div class="register-req">
				<p>Enter all the information Carefully</p>
			</div><!--/register-req-->

			<div class="shopper-informations">
				<div class="row">
				  <div class="col-sm-5 clearfix">
					  <div class="bill-to">
                                              <%  String paymenttype=request.getParameter("t1"); %>
							<form name="f1" action="offlinepayment.jsp">
							<div class="form-one">
                                                      
                                                            
								<input type="hidden" value="<%= paymenttype %>" name="t1">
                                                                  Bank Name <select   name="t2"  required >
                                                                      <option>SBI</option> 
                                                                      <option>ICIC</option> 
                                                                      <option>HDFC</option> 
                                                                      <option>UCO</option> 
                                                                  </select>
							Branch <select   name="t3"  required >
                                                                      <option>Baroda</option> 
                                                                      <option>Mumbai</option> 
                                                                      <option>Delhi</option> 
                                                                      <option>Surat</option> 
                                                                  </select>
                                                         <br>	CVV No. <input type="password" placeholder="Enter CVV No." name="t4"  required pattern="[0-9]{3}" title="enter valid cvv no. [3 numeric digits]">
                                                        <br>	Card No.<input type="text" placeholder="Enter Card No." name="t5"  required pattern="[0-9]{16}" title=" enter valid card no.[16 numeric digits] ">
							 
                                                        </div>
							<div class="form-two">
									
                                    <input name="bt1" type="submit" value="Pay Now" name="bt1" style="color:white; background-color:black; margin-top: 20px;"> 
					
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
					<p class="pull-left">Copyright © 2013 E-SHOPPER Inc. All rights reserved.</p>
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