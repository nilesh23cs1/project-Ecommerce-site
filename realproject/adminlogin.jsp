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
            String pwd,name;
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

     if ("Login".equals (request.getParameter("bt1")))
               {   
               try
              {
              rs=st.executeQuery("select * from adminlogin where id='"+name+"' and password='"+pwd+"'");
              if(rs.next())
              {
                  response.sendRedirect("admin.jsp");
              }
              else
              {%>
                  <script> 
                      alert("wrong email and password");
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

  <form class="login-container" action="adminlogin.jsp" >
    <p><input type="email" name="t1" placeholder="email" required></p>
    <p><input type="password" name="t2" placeholder="Password" required></p>
    <p><input type="submit" value="Login" name="bt1"></p>
  </form>
</div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    
  </body>
</html>
