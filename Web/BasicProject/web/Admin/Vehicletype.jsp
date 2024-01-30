 <%-- 
    Document   : Category
    Created Son : 12 Dec, 2023, 11:37:01 AM
    Author     : sruth
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        if(request.getParameter("btnsave")!=null)
        {
            String vehicletype=request.getParameter("txtvtype");
            if(request.getParameter("hiddenid")=="")
            {
            String insQry="insert into tbl_vehicletype(vehicletype_name)value('"+vehicletype+"')";
             con.executeCommand(insQry);
            response.sendRedirect("Vehicletype.jsp");
          }
            else
            {
               String upQry="update tbl_vehicletype set vehicletype_name='"+vehicletype+"' where vehicletype_id='"+request.getParameter("hiddenid")+"'";
                con.executeCommand(upQry);
                response.sendRedirect("Vehicletype.jsp"); 
            }
        }
         if(request.getParameter("did")!=null)
        {
            String delQry="delete from tbl_vehicletype where vehicletype_id='"+request.getParameter("did")+"'";
            con.executeCommand(delQry);
            response.sendRedirect("Vehicletype.jsp");
            
        }
         String vtypeid="",vtypename="";
         if(request.getParameter("eid")!=null)
         {
             String SelQ="select * from tbl_vehicletype where vehicletype_id='"+request.getParameter("eid")+"'";
            ResultSet rs1=con.selectCommand(SelQ);
            rs1.next();
            vtypeid=rs1.getString("vehicletype_id");
            vtypename=rs1.getString("vehicletype_name");
         }
        %>
        <h1 align="center">Add Vehicletype</h1>
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <td>Vehicletype</td>
                    <td><input type="text" name="txtvtype" value="<%=vtypename%>">
                    <input type="hidden" name="hiddenid" value="<%=vtypeid%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="Save">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
            </table>
                <br>
                <br>
        </form>
         <table align="center" border="1">
            <tr>
                <td>SL.NO</td>
                <td>Vehicletype name</td>
                <td>Action</td>
            </tr>
            <%
            int i=0;
            String selQry="select * from tbl_vehicletype";
            ResultSet r=con.selectCommand(selQry);
            while(r.next())
            {
                  i++;
               %> 
               <tr>
                   <td><%=i%></td>
                   <td><%=r.getString("vehicletype_name")%></td>
                   <td><a href="Vehicletype.jsp?did=<%=r.getString("vehicletype_id")%>">Delete</a>
                   <a href="Vehicletype.jsp?eid=<%=r.getString("vehicletype_id")%>">Edit</a></td>
               </tr>
           <%     
            }
            %>
        </table>
    </body>
</html>
