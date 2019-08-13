<%@ include file="shopheader.jsp" %> 
<%@ include file="shopcategory.jsp" %> 

<%! int pageid,total,eid ;
String spageid;
%>
<% 
    if(request.getParameter("page")!=null)
    {spageid=request.getParameter("page"); 
    }
    else
    {spageid="1";}
 pageid=Integer.parseInt(spageid);
 eid=pageid;
 total=6;  
if(pageid==1){}  
else{  
    pageid=pageid-1;  
    pageid=pageid*total+1;  
}  

%>
	
	
	




<%-- .............................................................................................................. --%>
    <div class="col-sm-9 padding-right">
					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Features Items</h2>
                                                <%  String sl="%"+request.getParameter("s1")+"%";
                                                    String ji=" LIMIT "+(pageid-1)+","+total;
                                                    try
              {
           rs=st.executeQuery("SELECT * FROM product"+" where keyword LIKE '"+sl+"'"+ ji);
              while(rs.next())
              {   %>
                                                           <div class="col-sm-4">
							<div class="product-image-wrapper">
								<div class="single-products">
									<div class="productinfo text-center">
                                                                         <%  String imgsrc="../realproject/productimages/"+rs.getString(5);%>  
                                                                            <img src=<%=imgsrc %> alt="" width=180 height=381 />
										<h2>$<%= rs.getString(3) %></h2>
										<p><%= rs.getString(2) %></p>
										<a href="product-details.jsp?id=<%= rs.getString(1) %>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>View description</a>
									</div>
									<div class="product-overlay">
										<div class="overlay-content">
											<h2>$<%= rs.getString(3) %></h2>
											<p><%= rs.getString(2) %></p>
                                                                                    
											<a href="product-details.jsp?id=<%= rs.getString(1) %>" class="btn btn-default add-to-cart"><i class="fa fa-shopping-cart"></i>View description</a>
										</div>
									</div>
								</div>
								<div class="choose">
									<ul class="nav nav-pills nav-justified">
										<li><a href=""><i class="fa fa-plus-square"></i>Add to wishlist</a></li>
										<li><a href=""><i class="fa fa-plus-square"></i>Add to compare</a></li>
									</ul>
								</div>
							</div>
						</div>
                                             
              <%}} catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }%>
              
            
                                                        <ul class="pagination">
							<li class="active"><a href="shop.jsp?page=1">1</a></li>
							<li><a href="shop.jsp?page=2">2</a></li>
							<li><a href="shop.jsp?page=3">3</a></li>
							<li><a href="shop.jsp?page=4">&raquo;</a></li>
						</ul>
                <span  style="font-weight:bold; margin-left: -100px;"> <%= eid%> of <%= 3%></span>
					</div><!--features_items-->
				</div>
			</div>
		</div>
	</section>
<%@ include file="shopfooter.jsp" %> 	