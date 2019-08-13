 <%@page import="java.sql.*" %>
  <%@ page import="java.util.*" %>

<%!
                  Connection con;
                 Statement st,st1;
                  ResultSet rs,rs1;
           String id;
           %>
          <% 
             
              try
              {
                  Class.forName("com.mysql.jdbc.Driver");
              con=DriverManager.getConnection("jdbc:mysql://localhost/project","root","riccs");
              st=con.createStatement();
              st1=con.createStatement();
              }
              catch(Exception ex)
              {
                  out.print("ERROR  "+ex.getMessage());
              }
%>

       
                  <%     id=request.getParameter("t2");   
            
                  if ("delete".equals (request.getParameter("t1")))
               { 
                   
                   try{   
                 st.executeUpdate("delete from product where id='"+id+"'");
            response.sendRedirect("adminproduct.jsp");
               }
               catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }
          }
                    %>   
                    


















<%        
            
  if ("edit".equals (request.getParameter("t1")))
               {     
%>

<%@ include file="editdeleteproductextra.jsp" %> 
<%@ include file="adminmenu.jsp" %> 
       
        <div class="grid_10">
            <div class="box round first">
                <h2>
                    Product Sales</h2>
                <div class="block">
               <%  try
                {       
                  rs=st.executeQuery("select * from product where id='"+id+"'");
            if(rs.next())
            {%>
            <form action="editproduct.jsp">
                <input type="hidden" name="t1" value="edit">
                <input type="hidden" name="t2" value="<%= id %>">
            <table>
                <tr><%String imgsrc="../realproject/productimages/"+rs.getString(5); %>
                    <td colspan="2" align="center"><img src="<%= imgsrc %>" height="100" width="100"></td>
                </tr>
                <tr>
                    <td> Product name</td>
                    <td><input type="text" name="tt1" value="<%= rs.getString(2)   %>" /></td>
                </tr>
                <tr>
                        <td> Product price</td>
                        <td><input type="text" name="tt2" value="<%= rs.getString(3)   %>"/></td>
                </tr>
                <tr>
                       <td> Product quantity</td>
                        <td><input type="text" name="tt3" value="<%= rs.getString(4)   %>" /></td>
                </tr>
                  <tr>
                                <td>Product image</td>
                                <td><input type="file" name="tt4" ></td>  
                 </tr>
                <tr>
                    
                    
                       <td> Product category</td>
                        <td><select  name="tt5" >
                                <option value="<%= rs.getString(6)   %>" > Choose Category </option>
                          <%  try
                            { 
                                rs1=st1.executeQuery("select * from category");
    while(rs1.next()) {%>
                        <option><%=rs1.getString(2)%></option> 

                            <%}}
                                  catch(Exception ex)
                            {   out.print(ex.getMessage());}
              
                          %>
                      </select> </td>   
                </tr>
                <tr>
                       <td> Product description</td>
                        <td><textarea rows="5" cols="30" name="tt6"    > <%= rs.getString(7) %></textarea></td>
                </tr>
                <tr>
                       <td> Product brand</td>
                         <td><select  name="tt7" >
                                 <option value="<%= rs.getString(8)   %>" > Choose Brand </option>
                          <%  try
                            { 
                                rs1=st1.executeQuery("select * from brand");
    while(rs1.next()) {%>
                        <option><%=rs1.getString(2)%></option> 

                            <%}}
                                  catch(Exception ex)
                            {   out.print(ex.getMessage());}
              
                          %>
                      </select> </td>   
                </tr>
                <tr>
                        <td> Keyword</td>
                        <td><input type="text" name="tt8" value="<%= rs.getString(9)   %>" /></td>
                </tr>
                
                
                  <tr>
                    <td colspan="2" align="center"><input type="submit" name="bt1" value="save"></td>
                </tr>
            </table>
            </form>
            
            
            

            <%}
                }  
              catch(Exception ex)
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



             <%  }
                    %>
                    
                  
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
             