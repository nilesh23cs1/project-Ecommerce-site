<%@ include file="adminheader.jsp" %> 
<%@ include file="adminmenu.jsp" %> 
       
        <div class="grid_10">
            <div class="box round first">
                <h2>
                    Product Sales</h2>
                <div class="block">
                       <center><h1 style="margin:20px;background-color:black;color:white; "> No. Of Customer Logged In   </h1></center>
                  <center>      <table border="2"> <tr>
                        <th>id</th>
                            <th>First name</th>
                            <th>Last Name</th>
                            <th>Password</th>
                            <th>Email</th>
                            <th>Address</th>
                            <th>City</th><th>Pincode</th><th>Contact No.</th><th>Username</th><th>Country</th>
                        </tr>
                     
                  <%      try {
                rs=st.executeQuery("select * from customer");
                while(rs.next())     
                {%>
                
                <tr>
                    <td> <%= rs.getString(1) %> </td>
                    <td><%= rs.getString(2) %> </td>
                    <td>   <%= rs.getString(3) %> </td>
                    <td><%= rs.getString(4) %> </td>
                    <td> <%= rs.getString(5) %> </td>
                    <td><%= rs.getString(6) %> </td>
                    <td>   <%= rs.getString(7) %> </td>
                    <td><%= rs.getString(8) %> </td>
                    <td> <%= rs.getString(9) %> </td>
                    <td><%= rs.getString(10) %> </td>
                    <td>   <%= rs.getString(11) %> </td>
                </tr>
                  
                        
                        
                        
                        
                    <%}} catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }   %>
                            
                        
                    </table>    </center> 
                    <hr>   
                    <hr>
                    
                    <center> <h1 style="margin:20px;background-color:black;color:white; "> Orders for Product  </h1></center>
                    <center>       <table border="2" > <tr>
                        <th>Product Image </th>
                            <th>Product name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th> Username</th>
                        </tr>
                     
                  <%      try {
                      String imgsrc;
                rs=st.executeQuery("select * from payedproduct");
                while(rs.next())     
                {%>
                
                <tr>
                     <% imgsrc="../realproject/productimages/"+rs.getString(1); %>
                    <td><img src="<%= imgsrc %>" height="100" width="100"></td>              
                    <td><%= rs.getString(2) %> </td>
                    <td>   <%= rs.getString(3) %> </td>
                    <td><%= rs.getString(4) %> </td>
                    <td> <%= rs.getString(5) %> </td>
                    <td><%= rs.getString(6) %> </td>
                    
                </tr>
                  
                        
                        
                        
                        
                    <%}} catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }   %>
                            
                        
                        </table></center>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                </div>
            </div>
            
      
       <%-- admn footer --%>
        <div class="clear">
        </div>
    </div>
    <div class="clear">
    </div>
    <div id="site_info">
        <p style="text-align:center;background-color:red;">designed and developed by Nilesh agarwal  </p>
    </div>
</body>
</html>
