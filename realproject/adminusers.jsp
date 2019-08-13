<%@ include file="adminheader.jsp" %> 
<%@ include file="adminmenu.jsp" %> 
       
        <div class="grid_10">
            <div class="box round first">
                <h2>
                    Product Sales</h2>
                <div class="block">
                
                    
               <% try
                {
     rs=st.executeQuery("select * from customer "); %>     <table border="2"> <tr><th>Id </th><th> First Name</th> <th>Last Name </th><th>Password </th><th>Email </th><th>Address </th><th>City </th><th>Pincode </th><th>Contact No. </th><th>Username</th><th>Country </th>   </tr>     <%
while(rs.next())
{  %>
<tr>
    <td><%= rs.getString(1) %></td>
    <td><%= rs.getString(2) %></td>
     <td><%= rs.getString(3) %></td>
     <td><%= rs.getString(4) %></td>
     <td><%= rs.getString(5) %></td>
     <td><%= rs.getString(6) %></td> 
     <td><%= rs.getString(7) %></td>
     <td><%= rs.getString(8) %></td>
     <td><%= rs.getString(9) %></td>
      <td><%= rs.getString(10) %></td>
      <td><%= rs.getString(11) %></td>
</tr>
                


    <%}%> 
</table>
<%}
catch(Exception ex)
              {
                  out.print("ERROR  "+ex.getMessage());
              }

%>
                    
                    
                    
                    
                    
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
