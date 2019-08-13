<%@page import="java.sql.*" %>

<%!    
                  Connection con;
                  Statement st;
                  ResultSet rs;
         String pwd,name,img,pname,price,qty,username;
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
<html>
    <head><style>
     body {
    background: #ffffff url("image1.jpg") no-repeat center;
    background-size: 100% 100%;
th,td,table,tr{color:white;}


     }   
            
            
            
            
        </style>
    </head>      
    <body>









<% username=session.getAttribute("customer").toString();              %>






<% if ("order".equals (request.getParameter("t1")))
               {%>
                   
                    <center> <h1 style="margin:20px;background-color:black;color:white; ">My Orders  </h1></center>
                  
                      
                        <table border="2" > <tr>
                   <th>  <font color="white">   Product Image </font></th>
                            <th>  <font color="white">Product name </font></th>  
                            <th><font color="white">Price</font></th>
                            <th><font color="white">Quantity</font></th>
                            <th><font color="white">Total</font></th>
                            </tr>
                         
                  <%      try {
                      String imgsrc;
                rs=st.executeQuery("select * from payedproduct where username='"+username+"'");
                while(rs.next())     
                {%>
                
                <tr>
                     <% imgsrc="../realproject/productimages/"+rs.getString(1); %>
                    <td><img src="<%= imgsrc %>" height="100" width="100"></td>              
                    <td><font color="white"><%= rs.getString(2) %></font> </td>
                    <td>  <font color="white"> <%= rs.getString(3) %></font> </td>
                    <td><font color="white"><%= rs.getString(4) %></font> </td>
                    <td><font color="white"> <%= rs.getString(5) %> </font></td>
                </tr>
                  
                        
                        
                        
                        
                    <%}} catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }   %>
                            
                        
                        </table>
                    
    
              <% }%>
              
              
              
              
              
              
              
              
              
              
              <%
               if ("payment".equals (request.getParameter("t1")))
               {%>
               
                 <center><h1 style="margin:20px;background-color:black;color:white; "> My Payment   </h1></center>
                      <table border="2"> <tr>
                              <th><font color="white">Payment Type</font></th>
                            <th><font color="white">Total Payment</font></th>
                            <th><font color="white">Bank Name</font></th>
                            <th><font color="white">Branch</font></th>
                            <th><font color="white">CVV</font></th>
                            <th><font color="white">Card No.</font></th>
                            <th><font color="white">Payment Date</font></th>
                        </tr>
                     
                  <%      try {
                rs=st.executeQuery("select * from offlinepayment where username='"+username+"' ");
                while(rs.next())     
                {%>
                
                <tr>
                    <td><font color="white"><%= rs.getString(2) %></font> </td>
                    <td><font color="white">   <%= rs.getString(3) %></font> </td>
                    <td><font color="white"><%= rs.getString(4) %></font> </td>
                    <td><font color="white"> <%= rs.getString(5) %></font> </td>
                    <td><font color="white"><%= rs.getString(6) %></font> </td>
                    <td><font color="white">   <%= rs.getString(7) %></font> </td>
                    <td><font color="white"><%= rs.getString(8) %></font> </td>
                </tr>
             
                    <%}} catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }   %>
                </table>   
      
                 
               <%}
               %>
</body>
</html>