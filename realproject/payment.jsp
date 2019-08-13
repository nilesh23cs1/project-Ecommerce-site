<%@page import="java.sql.*" %>
  <%@ page import="java.util.*" %>

<%!
                  Connection con;
                 Statement st,stt,sttt,stttt;
                  ResultSet rs,rs1,rs2;
                    int final1;
           %>
          <% 
             
              try
              {
                  Class.forName("com.mysql.jdbc.Driver");
              con=DriverManager.getConnection("jdbc:mysql://localhost/project","root","riccs");
              st=con.createStatement();
                stt=con.createStatement();
                    sttt=con.createStatement();
                     stttt=con.createStatement();
              }
              catch(Exception ex)
              {
                  out.print("ERROR  "+ex.getMessage());
              }
%>





<%
 try
                                    {      final1=0;
                                        String e=session.getAttribute("customer").toString();
            rs=st.executeQuery("select * from customerproduct where username='"+e+"'");
         while (rs.next())
                 {
final1= final1+Integer.parseInt(rs.getString(5));
                 }
                                    } catch(Exception ex)
              {
                  out.print("ERROR  "+ex.getMessage());
              }



%>











<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Login Form</title>
    <link rel="stylesheet" href="css/style.css">   
  </head>
 <body>

          <%  
     if ("Debit Card Payment".equals (request.getParameter("bt1")))
               {   response.sendRedirect("offlinepayment.jsp?t1=Debit Card"); 
               }
         if ("Credit Card Payment".equals (request.getParameter("bt2")))
               {   
                   
                   response.sendRedirect("offlinepayment.jsp?t1=Credit Card"); 
               }    
         
          if ("Cash On Delivery".equals (request.getParameter("bt3")))
               {   String date= new java.util.Date().toString();
                String result=String.valueOf(final1);
              String ptype="Cash On Delivery " ;                 
                String      uname=session.getAttribute("customer").toString();  
              
                try
                {       
            st.executeUpdate("insert into offlinepayment(username,paymenttype,totalpayment,paymentdate) values('"+uname+"','"+ptype+"','"+result+"','"+date+"')"); 
                  rs=st.executeQuery("select * from customerproduct where username='"+uname+"'");
            while(rs.next())
            {
 stt.executeUpdate("insert into payedproduct values('"+rs.getString(1)+"','"+rs.getString(2)+"','"+rs.getString(3)+"','"+rs.getString(4)+"','"+rs.getString(5)+"','"+rs.getString(6)+"')");

            }
            
            int customerquant,productquant;
            String productimage,sproductquant;
            rs=st.executeQuery("select * from customerproduct where username='"+uname+"'"); 
            while(rs.next())
            {
            customerquant=Integer.parseInt(rs.getString(4));
            productimage=rs.getString(1);
              rs1=stt.executeQuery("select * from product where product_img='"+ productimage+"'"); 
            if(rs1.next())
            {
                   productquant=Integer.parseInt(rs1.getString(4));
                   productquant=productquant-customerquant;
                   sproductquant=String.valueOf(productquant);
                   stttt.executeUpdate("update product set product_qty='"+ sproductquant+"' where product_img='"+ productimage+"' ");  
            }}
            
            
            
            
            
              
            stt.executeUpdate("delete from customerproduct where username='"+uname+"'");
            response.sendRedirect("paypalsuccess.jsp");
                }
    
              catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }
     
               }  
          
          
  
    %>
     
     
     
     
     
     
     
     
   <div class="login">
  <div class="login-triangle"></div>
  
  <h2 class="login-header">Payment</h2>

  <form class="login-container" action="payment.jsp" >
 <p><input type="submit" value="Debit Card Payment" name="bt1"></p>
 <p><input type="submit" value="Credit Card Payment" name="bt2"></p>
 <p><input type="submit" value="Cash On Delivery" name="bt3"></p>
</form>
 

  <form class="login-container" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">

  <!-- Identify your business so that you can collect the payments. -->
  <input type="hidden" name="business" value="gunnu22@gmail.com">

  <!-- Specify a Buy Now button. -->
  <input type="hidden" name="cmd" value="_xclick">

  <!-- Specify details about the item that buyers will purchase. -->
  <input type="hidden" name="item_name" value="paypal for testing">
  <input type="hidden" name="amount" value="<%= final1 %> ">
  <input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="return" value="http://localhost:8080/dxxxxx/realproject/paypalsuccess1.jsp">
  <!-- Display the payment button. -->
  <input type="image" name="submit" border="0"
  src="paypal1.png" height="85" width="85" 
  alt="Buy Now">
  <img alt="" border="0" width="1" height="1"
  src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" >

</form>
  
  
  
  
  
  
  
  
</div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    
  </body>
</html>
