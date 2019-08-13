<%@page import="java.sql.*" %>

<%!    
                  Connection con;
                  Statement st;
                  ResultSet rs;
         String pwd,name,img,pname,price,qty;
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










<%
         Cookie pook=null;
 Cookie pk[]=request.getCookies();
      if (pk!=null)
      { for (int i = 0; i < pk.length-1; i++)      
          {
           pook = pk[i];
         String[] pokens = pook.getValue( ).split("_");

 try
              { 
                 img=pokens[0];
                 pname=pokens[1];
                 price=pokens[2];
                 qty=pokens[3];
             String totalvalue=pokens[4];
             name=session.getAttribute("customer").toString();
            st.executeUpdate("insert into customerproduct values('"+img+"','"+pname+"','"+price+"','"+qty+"','"+totalvalue+"','"+name+"')");
         pook.setMaxAge(0);
        response.addCookie(pook);
              } catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }
      
}
      }
                


%>










<%  if ("Return To Site".equals (request.getParameter("bt1")))
               {  response.sendRedirect("shop.jsp"); 
               }
   if ("My Account".equals (request.getParameter("bt2")))
               {   response.sendRedirect("customerprofile.jsp");
               }
   if ("My Cart".equals (request.getParameter("bt3")))
               { response.sendRedirect("cart.jsp");   
               }
   if ("My Order".equals (request.getParameter("bt4")))
               { response.sendRedirect("customermyorderpayment.jsp?t1=order");
               }
   if ("My Payment".equals (request.getParameter("bt5")))
               {  response.sendRedirect("customermyorderpayment.jsp?t1=payment"); 
               }
    if ("Log Out".equals (request.getParameter("bt6")))
               {  
                  
                   response.sendRedirect("customerlogin.jsp?ta=logout"); 
               }
     %>
     
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Welcome Customer</title>
    <link rel="stylesheet" href="css/style.css">   
  </head>
 <body>
 

     
   <div class="login">
  <div class="login-triangle"></div>
   <% String user=session.getAttribute("customer").toString();
      %>
  <h2 class="login-header">
     Welcome <%= user %>
  </h2>

  <form class="login-container" action="customer.jsp" >
<p><input type="submit" value="Return To Site" name="bt1"></p>
<p><input type="submit" value="My Account" name="bt2"></p>
<p><input type="submit" value="My Cart" name="bt3"></p>
<p><input type="submit" value="My Order" name="bt4"></p>
    <p><input type="submit" value="My Payment" name="bt5"></p>
       <p><input type="submit" value="Log Out" name="bt6"></p>
  </form>
</div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    
  </body>
</html>
