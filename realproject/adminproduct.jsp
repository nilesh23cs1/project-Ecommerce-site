<%@ include file="adminheader.jsp" %> 
<%@ include file="adminmenu.jsp" %> 

        <div class="grid_10">
            <div class="box round first">
                <h2>
                    Product Sales</h2>
                <div class="block">
                
              <%
try{

rs=st.executeQuery("select * from product "); %>     <table border="2"> <tr><th>Product Image </th><th>Id </th><th> Product  Name</th><th> Price </th><th> Quantity  </th><th>Category</th><th> Description</th><th>Brand </th> <th>Keyword </th><th>Edit </th><th>Delete </th>  </tr>              
<%
while(rs.next())
{  String imgsrc="../realproject/productimages/"+rs.getString(5);
%>
<tr>
    <td><img src="<%= imgsrc %>" height="100" width="100"></td>
    <td><%= rs.getString(1) %></td>
     <td><%= rs.getString(2) %></td>
    <td><%= rs.getString(3) %></td>
     <td><%= rs.getString(4) %></td>
    <td><%= rs.getString(6) %></td>
     <td><%= rs.getString(7) %></td>
    <td><%= rs.getString(8) %></td>
       <td><%= rs.getString(9) %></td>
    <td><a href="editdeleteproduct.jsp?t1=edit&t2=<%= rs.getString(1)%>"> edit</a></td>
    <td><a href="editdeleteproduct.jsp?t1=delete&t2=<%= rs.getString(1)%>"> delete</a></td>
</tr>
                


    <%}%> 
</table>



 <%   }  catch(Exception ex)
              {
                  out.print(ex.getMessage());
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
