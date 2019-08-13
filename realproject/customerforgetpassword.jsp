<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Forget Password</title>
    <link rel="stylesheet" href="css/style.css">   
  </head>
 <body>
 <%!              Connection con;
                  Statement st;
                  ResultSet rs;
            String name,email;
           %>
          <%  name=request.getParameter("t1");
              email=request.getParameter("t2");
             session.setAttribute("n", name);
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

     if ("Next".equals (request.getParameter("bt1")))
               {   
               try
              {
              rs=st.executeQuery("select * from customer where username='"+name+"' and email='"+email+"'");
              if(rs.next())
              {
                  response.sendRedirect("customerforgetpassword1.jsp");
              }
              else
              {%>
                  <script> 
                      alert("wrong username and email");
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
  
  <h2 class="login-header">Forget Password</h2>

  <form class="login-container" action="customerforgetpassword.jsp" >
    <p><input type="text" name="t1" placeholder="username" required></p>
    <p><input type="text" name="t2" placeholder="email" required></p>
    <p><input type="submit" value="Next" name="bt1"></p>
  </form>
 
  
</div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    
  </body>
</html>
