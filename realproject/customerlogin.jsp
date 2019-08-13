<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Login Form</title>
    <link rel="stylesheet" href="css/style.css">   
  </head>
 <body>
 <%!              Connection con;
                  Statement st;
                  ResultSet rs;
            String pwd,name,img,pname,price,qty;
           %>
          <%  name=request.getParameter("t1");
               pwd=request.getParameter("t2");
             
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

               if ("logout".equals (request.getParameter("ta")))
               {session.setAttribute("customer",null); 
               }
              
              
              
              
     if ("Login".equals (request.getParameter("bt1")))
               {  
                   
            
                   
               try
              {
              rs=st.executeQuery("select * from customer where username='"+name+"' and password='"+pwd+"'");
              if(rs.next())
              {
                  session.setAttribute("customer",name);
                  response.sendRedirect("customer.jsp");
              }
              else
              {%>
                  <script> 
                      alert("wrong username and password");
                                    </script>
                <%  
              }
              }
              catch(Exception ex)
              {
                  out.print(ex.getMessage());
              } 
             
       
            }  %>
     
     
     
     
     
     
     
     
     
     
   <div class="login">
  <div class="login-triangle"></div>
  
  <h2 class="login-header">Log in</h2>

  <form class="login-container" action="customerlogin.jsp" >
    <p><input type="text" name="t1" placeholder="username" required></p>
    <p><input type="password" name="t2" placeholder="Password" required></p>
    <p><input type="submit" value="Login" name="bt1"></p>
  </form>
  <center> <button style="margin-top:20px; "><a href="customerforgetpassword.jsp">Forget Password</a></button></center>
   <center> <button style="margin-top:20px; "><a href="registration.jsp">Signup/Registration</a></button></center>
</div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    
  </body>
</html>
