<%-- 
    Document   : Place
    Created on : 19 Dec, 2023, 10:36:37 AM
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
            String subvtype=request.getParameter("txtsubvtype");
            String vtype=request.getParameter("txtvtype");
            String insQry="insert into tbl_vehiclesubtype(vehiclesubtype_name,vehicletype_id)values('"+subvtype+"','"+vtype+"')";
            con.executeCommand(insQry);
            response.sendRedirect("Vehiclesubtype.jsp");
        }
        if(request.getParameter("sid")!=null)
        {
            String delQry="delete from tbl_vehiclesubtype where vehiclesubtype_id='"+request.getParameter("sid")+"'";
            con.executeCommand(delQry);
            response.sendRedirect("Vehiclesubtype.jsp");
            
        }
        %>
        <h1 align="center">Add Vehicle sub-type</h1>
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <td>Vehicle type</td>
                    <td><select name="txtvtype">
                            <option>---select---</option>
                            <%
                               String selectvehicletype="select*from tbl_vehicletype"; 
                               ResultSet ra=con.selectCommand(selectvehicletype);
                               while(ra.next())
                               { 
                                    %>
                                    <option value="<%=ra.getString("vehicletype_id")%>"><%=ra.getString("vehicletype_name")%></option>
                           <%
                               }
                           %>
                        </select></td>
                </tr>
                <tr>
                    <td>Vehicle sub-type</td>
                    <td><input type="text" name="txtsubvtype"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Submit"></td>
                </tr>
            </table>
        </form> 
                   <form>
        <table align="center" border="1">
            <tr>
                <td>Sl.no</td>
                <td>Vehicle type</td>
                 <td>Vehicle sub-type</td>
                <td colspan="2">Action</td>
            </tr>  
           
            <% 
                               
            int i=0;
            String selQry="SELECT* FROM tbl_vehiclesubtype s INNER JOIN tbl_vehicletype v on s.vehicletype_id=v.vehicletype_id";
            ResultSet rs=con.selectCommand(selQry);
            while(rs.next())
            {
                i++;
               %> 
                <tr>
                   <td><%=i%></td>
                   <td><%=rs.getString("vehicletype_name")%></td>
                   <td><%=rs.getString("vehiclesubtype_name")%></td>
                   <td><a href="Vehiclesubtype.jsp?sid=<%=rs.getString("vehiclesubtype_id")%>">Delete</a></td>
                </tr> 
           <%     
            }
          
            %>
         
        </table>
                </form>
    </body>
</html>
