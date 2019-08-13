<%@page import="java.sql.*" %>
  <%@ page import="java.util.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import=" java.io.*"  %>
<%@page import=" java.nio.file.Files"  %>
<%@page import=" java.nio.file.*"  %>
<%!
                  Connection con;
                 Statement st;
                  ResultSet rs;
             String pname,pprice,pqty,pimg,pcat,pdesc,pbrand,id,pkeyword;
           %>
          <% id=request.getParameter("t2");   
             
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
    if ("save".equals (request.getParameter("bt1")))
               { pname=request.getParameter("tt1");
               pprice=request.getParameter("tt2");
               pqty=request.getParameter("tt3");
               pimg=request.getParameter("tt4");
               pcat=request.getParameter("tt5");
            pdesc=request.getParameter("tt6");
         pbrand=request.getParameter("tt7");
              pkeyword=request.getParameter("tt8");
         
         
            try {
                rs=st.executeQuery("select * from product where id='"+id+"'");
                if(rs.next())
                { 
                    
                    if(pimg=="")
                    {
                    pimg=rs.getString(5);}
                    else
                 
                    {
                    File f=new File("C:\\Users\\niles\\OneDrive\\Documents\\NetBeansProjects\\dxxxxx\\web\\realproject\\productimages\\"+rs.getString(5));
                  f.delete();
                 
       
            String source="D:\\New folder\\"+pimg; 
          String  destination="C:\\Users\\niles\\OneDrive\\Documents\\NetBeansProjects\\dxxxxx\\web\\realproject\\productimages\\"+pimg;         
           Path temp = Files.move
        (Paths.get(source), 
        Paths.get(destination));
                    
                    }
  
                                  
  
                }
            }
           catch(Exception ex)
              {
                  out.print(ex.getMessage());
              } 
            
           
               try
              {
            st.executeUpdate("update product set product_name='"+pname+"',product_price='"+pprice+"',product_qty='"+pqty+"',product_img='"+pimg+"',product_cat='"+pcat+"',product_desc='"+pdesc+"',product_brand='"+pbrand+"',keyword='"+pkeyword+"' where id='"+id+"'");
               %>
               <script>
                   alert("Successfully value updated ");
                
               </script>
              <%      response.sendRedirect("adminproduct.jsp");               }
              catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }
            
               } 
           
            
               
            %>
