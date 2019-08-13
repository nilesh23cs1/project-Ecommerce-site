<% 
Cookie pook=null;
 Cookie pk[]=request.getCookies();
      if (pk!=null)
      { for (int i = 0; i < pk.length-1; i++)      
          {
           pook = pk[i];
         String[] pokens = pook.getValue( ).split("_");

 try
              {
                 img=pokens[0];
                 name=pokens[1];
                 price=pokens[2];
                 qty=pokens[3];
             String totalvalue=pokens[4];
            st.executeUpdate("insert into customerproduct values('"+img+"','"+name+"','"+price+"','"+qty+"','"+totalvalue+"','"+username+"')");
         
              } catch(Exception ex)
              {
                  out.print(ex.getMessage());
              }
      
  
}
      }

}    
%>