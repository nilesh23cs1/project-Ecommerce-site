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
            String pwd,pwd1;
           %>
          <%  pwd=request.getParameter("t1");
              pwd1=request.getParameter("t2");
             
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

     if ("Save".equals (request.getParameter("bt1")))
               {  String name=session.getAttribute("n").toString(); 
             
                    if(pwd.equals(pwd1))
            {
               try
              {
            st.executeUpdate("update  customer set password ='"+pwd+"' where username='"+name+"'");
               %>
                  <script> 
                      alert(" Password Updated");
                      </script>
            <%
            
                session.setAttribute("n", null);
                response.sendRedirect("customerlogin.jsp");
              }
              catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }
       
               } 
            else
            { %>
                  <script> 
                      alert(" Password not matched");
                      </script>
            <%
            }
                   
                   
                   
                
             
       
            }  %>
     
     
     
     
     
     
     
     
     
     
   <div class="login">
  <div class="login-triangle"></div>
  
  <h2 class="login-header">Forget Password</h2>

  <form class="login-container" action="customerforgetpassword1.jsp" >
    <p><input type="password" name="t1" placeholder="Password" required></p>
    <p><input type="password" name="t2" placeholder="Retype Password" required></p>
    <p><input type="submit" value="Save" name="bt1"></p>
  </form>
 
  
</div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    
  </body>
</html>
