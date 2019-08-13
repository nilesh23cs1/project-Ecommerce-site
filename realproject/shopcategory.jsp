

	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Category</h2>
						<div class="panel-group category-products" id="accordian"><!--category-productsr-->
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#mens">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											Mens Corner
										</a>
									</h4>
								</div>
								<div id="mens" class="panel-collapse collapse">
									<div class="panel-body"> 																															                         
                                                                                 <ul>
                                                                            <%  String h_category;
                                                                                try  {
                                     rs=st.executeQuery("select * from category  where type='men' ");
                                   
                                while(rs.next()) {
                                      h_category="shopcategory1.jsp?"+"t1=category&t2="+rs.getString(2);                                      %>
                                   
                                <li><a href="<%= h_category %>"><%= rs.getString(2)%></a></li>
                                            
                                         <%}}
                                      catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }%>
				 </ul>										
										
									</div>
								</div>
							</div>
							
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordian" href="#womens">
											<span class="badge pull-right"><i class="fa fa-plus"></i></span>
											Womens Corner
										</a>
									</h4>
								</div>
								<div id="womens" class="panel-collapse collapse">
									<div class="panel-body">
										 
                                                                            <ul>
                                                                            <%  try  {
                                     rs=st.executeQuery("select * from category  where type='women' ");
                                   
                                while(rs.next()) {
                                      h_category="shopcategory1.jsp?"+"t1=category&t2="+rs.getString(2);   %>
                                   
                              <li><a href="<%= h_category %>"><%= rs.getString(2)%></a></li>
                                            
                                         <%}}
                                      catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }%>
				 </ul>						
                                                                 
									</div>
								</div>
							</div>
							
						</div><!--/category-productsr-->
					
						<div class="brands_products"><!--brands_products-->
							<h2>Brands</h2>
							<div class="brands-name">
						
									         <ul class="nav nav-pills nav-stacked">
                                                                            <%  try  {
                                     rs=st.executeQuery("select * from brand");
                                   
                                while(rs.next()) {
                                      h_category="shopcategory1.jsp"+"?t1=brand&t2="+rs.getString(2);                                      %>
                                   
                                <li><a href="<%= h_category %>"><%= rs.getString(2)%></a></li>
                                            
                                         <%}}
                                      catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }%>
				 </ul>		
							
							</div>
						</div><!--/brands_products-->
						
						<div class="price-range"><!--price-range-->
							<h2>Price Range</h2>
							<div class="well">
								 <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
								 <b>$ 0</b> <b class="pull-right">$ 600</b>
							</div>
						</div><!--/price-range-->
						
						<div class="shipping text-center"><!--shipping-->
							<img src="images/home/shipping.jpg" alt="" />
						</div><!--/shipping-->
						
					</div>
				</div>
				
				