<%@page import="java.sql.*" %>
  <%@ page import="java.util.*" %>

<%!
                  Connection con;
                 Statement st,stt,sttt,stttt;
                  ResultSet rs,rs1;
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
                                    {      
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











<%  String date= new java.util.Date().toString();
               String result=String.valueOf(final1);
              String ptype="Paypal " ;                 
                String   uname=session.getAttribute("customer").toString();  
                   
                 
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
     
                }
catch(Exception ex)
              {
                  out.print("ERROR  "+ex.getMessage());
              } 

             

%>

              <script> setTimeout(function(){window.location="shop.jsp"},2000); </script>
<%    out.print("<h1>your items are successfully ordered.we will deleiver your product soon</h1>");        %>







