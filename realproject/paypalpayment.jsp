<%@page import="java.sql.*" %>
  <%@ page import="java.util.*" %>

<%!
                  Connection con;
                 Statement st,stt,sttt;
                  ResultSet rs;
         
           
           %>
          <% 
             
              try
              {
                  Class.forName("com.mysql.jdbc.Driver");
              con=DriverManager.getConnection("jdbc:mysql://localhost/project","root","riccs");
              st=con.createStatement();
                stt=con.createStatement();
                    sttt=con.createStatement();
              }
              catch(Exception ex)
              {
                  out.print("ERROR  "+ex.getMessage());
              }
%>










<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">

  <!-- Identify your business so that you can collect the payments. -->
  <input type="hidden" name="business" value="gunnu22@gmail.com">

  <!-- Specify a Buy Now button. -->
  <input type="hidden" name="cmd" value="_xclick">

  <!-- Specify details about the item that buyers will purchase. -->
  <input type="hidden" name="item_name" value="Hot Sauce-12oz. Bottle">
  <input type="hidden" name="amount" value="5.95">
  <input type="hidden" name="currency_code" value="USD">

  <!-- Display the payment button. -->
  <input type="image" name="submit" border="0"
  src="paypal.jpg" alt="Buy Now">
  <img alt="" border="0" width="1" height="1"
  src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" >

</form>