<%@ include file="adminheader.jsp" %> 
<%@ include file="adminmenu.jsp" %> 

<%
   if ("save".equals (request.getParameter("bt1")))
               {
                 try
                {       
                
                String b=request.getParameter("t2");
                String c=request.getParameter("t3");
            st.executeUpdate("insert into category(categoryname,type) values('"+b+"','"+c+"')"); 
          %>
          <script> alert("Successfully category Inserted");</script>
                <%}
      
              catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }

}

%>







        <div class="grid_10">
            <div class="box round first">
                <h2>
                    Product Sales</h2>
                <div class="block">
                 
                  <%  if ("add".equals (request.getParameter("t1")))
               {%> 
                    
                    
                    
                    
                        <div style="margin:20px;  border:4px outset greenyellow ;
                             border-radius:10px ;"> 
                        <form style="margin:20px; " action="category.jsp">
                         <center> 
                    
                     <input type="hidden" name="t1" value="add" />
                       <h1 style="display:inline;"> Enter Category name</h1>&nbsp &nbsp &nbsp
                    
                    <input type="text" name="t2" /><br><br>  
                  
                   <h1 style="display:inline;"> Enter Category type</h1>&nbsp &nbsp &nbsp
                    
                    <input type="text" name="t3" /><br><br>       
                    
                    
                    
                    
                    <input  type="submit" name="bt1" value="save" style=" width:100px ; height:40px; background-color:black;  color:white;   margin:20px;  border-radius:10px ; " />
                         
                         </center>
                          </form>
                          </div>  
  
               <%} else
                {
rs=st.executeQuery("select * from category "); %>     <table border="3"> <tr><th>Id </th><th> Category Name</th><th> Category Type</th></tr>                <%
while(rs.next())
{  %>
<tr>
    <td><%= rs.getString(1) %></td>
    <td><%= rs.getString(2) %></td>
     <td><%= rs.getString(3) %></td>
</tr>
                


    <%}%> 
</table>
<%}%>


               
               
               
               
               
               
               
               
               
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
