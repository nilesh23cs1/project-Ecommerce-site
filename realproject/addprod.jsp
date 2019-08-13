
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import=" java.io.*"  %>
<%@page import=" java.nio.file.Files"  %>
<%@page import=" java.nio.file.*"  %>

<%@ include file="adminheader.jsp" %> 
<%@ include file="adminmenu.jsp" %> 
       
<%!
                 
            String pname,pprice,pqty,pimg,pcat,pdesc,pbrand,pkeyword;
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
              
                   if ("submit".equals (request.getParameter("bt1")))
               { pname=request.getParameter("t1");
               pprice=request.getParameter("t2");
               pqty=request.getParameter("t3");
               pimg=request.getParameter("t4");
               pcat=request.getParameter("t5");
            pdesc=request.getParameter("t6");
         pbrand=request.getParameter("t7");
             pkeyword=request.getParameter("t8");
            try {
            String source="D:\\New folder\\"+pimg; 
          String  destination="C:\\Users\\niles\\OneDrive\\Documents\\NetBeansProjects\\dxxxxx\\web\\realproject\\productimages\\"+pimg;         
           Path temp = Files.move
        (Paths.get(source), 
        Paths.get(destination));
 
            }
           catch(Exception ex)
              {
                  out.print(ex.getMessage());
              } 
            
      
           
               try
              {
            st.executeUpdate("insert into product(product_name,product_price,product_qty,product_img,product_cat,product_desc,product_brand,keyword) values('"+pname+"','"+pprice+"','"+pqty+"','"+pimg+"','"+pcat+"','"+pdesc+"','"+pbrand+"','"+pkeyword+"')");
               %>
               <script>
                   alert("product added");
                   
               </script>
              <%}
              catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }
            
               } 
           
            
               
            %>


































<%--  product  table   --%>

        <div class="grid_10">
            <div class="box round first">
                <h2>
                    Add Product</h2>
                <div class="block">
                    <form name="f1" action="addprod.jsp">
                        <table>
                            <tr>
                                <td>Product name</td>
                                <td><input type="text" name="t1" required></td>  
                            </tr>
                               <tr>
                                <td>Product price</td>
                                <td><input type="text" name="t2" required></td>  
                            </tr>
                               <tr>
                                <td>Product quantity</td>
                                <td><input type="text" name="t3" required></td>  
                            </tr>
                               <tr>
                                <td>Product image</td>
                                <td><input type="file" name="t4" required></td>  
                            </tr>
                               <tr>
                                <td>Product Category</td>
                                 <td><select  name="t5" >
                          <%  try
                            { 
                                rs=st.executeQuery("select * from category");
    while(rs.next()) {%>
                        <option><%=rs.getString(2)%></option> 

                            <%}}
                                  catch(Exception ex)
                            {   out.print(ex.getMessage());}
              
                          %>
                      </select> </td>   
                            </tr>
                             <tr>
                                <td>Product Description</td>
                                <td><textarea rows="5" cols="30" name="t6"></textarea>
                                </td>
                                 <tr>
                                <td>Product Brand</td>
                                <td><select  name="t7" >
                          <%  try
                            { 
                                rs=st.executeQuery("select * from brand");
    while(rs.next()) {%>
                        <option><%=rs.getString(2)%></option> 

                            <%}}
                                  catch(Exception ex)
                            {   out.print(ex.getMessage());}
              
                          %>
                      </select> </td>   
                            </tr>
                    <tr>
                                <td>Product Keyword</td>
                                <td><input type="text" name="t8" required></td>  
                            </tr>         
                            
                            <tr>
                            <td colspan="2" align="center"><input type="submit" name="bt1" value="submit"></td> 
                            </tr>
                        </table>
                    </form>
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
