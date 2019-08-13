<%@page import="java.sql.*" %>

<%!    
                  Connection con;
                  Statement st;
                  ResultSet rs;
                    %>
 <%   try
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
    if(session.getAttribute("customer")==null)
    {
        if(request.getParameter("pimg")=="") {}
        else
    
        {
      Cookie dl[]=request.getCookies();
      Cookie del = null;
      if (dl!=null)
 {
 String co=request.getParameter("pim");
   for (int i = 0; i < dl.length-1; i++)
   {
        del = dl[i]; 
  if((del.getName( )).compareTo(co) == 0 )
  {
                    del.setMaxAge(0);
                  response.addCookie(del);

    
    }
    }
 }
    }}
    else
    {
        if(request.getParameter("pimg")=="") {}
        else
    
        {
    String uu=session.getAttribute("customer").toString();
    String prodimage=request.getParameter("pim");
    st.executeUpdate("delete from customerproduct where username='"+uu+"' AND productimage='"+prodimage+"'");
    
    }}
response.sendRedirect("cart.jsp");%>
