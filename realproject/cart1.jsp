<%@page import="java.sql.*" %>


<%!
                  Connection con;
                  Statement st;
                  ResultSet rs;
            String pwd,uname,fname,lname,email,address,city,pcode,no,country;
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
String username=session.getAttribute("customer").toString();
try
              {
           rs=st.executeQuery("select * from customerproduct where username='"+username+"'");
              if(rs.next())
              {  
response.sendRedirect("payment.jsp");


} 
              else
              {%>
              
              <script> alert("You have no items in cart"); 
           setTimeout(function(){window.location="shop.jsp";},100);
           </script>
              <%     }
              }
              
              catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }




%>