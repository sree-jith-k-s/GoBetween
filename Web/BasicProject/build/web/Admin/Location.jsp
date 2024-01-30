<%-- 
    Document   : Companyregistration
    Created on : 15 Jan, 2024, 10:45:36 AM
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
            String place=request.getParameter("txtplace");
            String district=request.getParameter("district");
            String insQry="insert into tbl_location(location_name,district_id)values('"+place+"','"+district+"')";
            con.executeCommand(insQry);
            response.sendRedirect("Location.jsp");
        }
        if(request.getParameter("pid")!=null)
        {
            String delQry="delete from tbl_location where location_id='"+request.getParameter("pid")+"'";
            con.executeCommand(delQry);
            response.sendRedirect("Location.jsp");
            
        }
        %>
         <h1 align="center">Add Location</h1>
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <td>State</td>
                    <td><select name="stid" onchange="getDistrict(this.value)">
                            <option>---Select---</option>
                            <%
                                String selectstate = "select*from tbl_state";
                                ResultSet ra = con.selectCommand(selectstate);
                                while (ra.next()) {
                            %>
                            <option value="<%=ra.getString("state_id")%>"><%=ra.getString("state_name")%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>District</td>
                    <td><select name="district" id="sel_district">
                            <option>---Select---</option>
                        </select>
                    </td>
                </tr> 
                <tr>
                    <td>Place</td>
                     <td><input type="text" name="txtplace"></td>
                </tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="Submit">
                        <input type="reset" name="reset" value="Cancel">
                    </td>
                </tr>
            </table>
        </form><br><br>
                        <form>
        <table border="1" align="center">
            <tr>
                <td>Sl.no</td>
                <td>State</td>
                <td>District</td>
                 <td>place</td>
                <td colspan="2">Action</td>
            </tr>  
           
            <% 
                               
            int i=0;
            String selQry="SELECT* FROM tbl_location l INNER JOIN tbl_district d on l.district_id=d.district_id inner join tbl_state s on d.state_id=s.state_id";
            ResultSet rs=con.selectCommand(selQry);
            while(rs.next())
            {
                i++;
               %> 
                <tr>
                   <td><%=i%></td>
                   <td><%=rs.getString("state_name")%></td>
                   <td><%=rs.getString("district_name")%></td>
                   <td><%=rs.getString("location_name")%></td>
                   <td><a href="Location.jsp?pid=<%=rs.getString("location_id")%>">Delete</a></td>
                </tr> 
           <%     
            }
          
            %>
         
        </table>
                </form>
                         <script src="../Assets/JQ/jQuery.js"></script>
        <script>
            function getDistrict(sid)
            {
                $.ajax({
                    url: "../Assets/AjaxPages/AjaxDistrict.jsp?sid=" + sid,
                    success: function(result) {
                        $("#sel_district").html(result);

                    }
                });
            }
        </script>
    </body>
</html>
