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
            String district=request.getParameter("txtdistrict");
            String sid=request.getParameter("sid");
            String insQry="insert into tbl_district(district_name,state_id)values('"+district+"','"+sid+"')";
            con.executeCommand(insQry);
            response.sendRedirect("District.jsp");
        }
        if(request.getParameter("did")!=null)
        {
            String delQry="delete from tbl_district where district_id='"+request.getParameter("did")+"'";
            con.executeCommand(delQry);
            response.sendRedirect("District.jsp");
            
        }
        %>
        <h1 align="center">Add District</h1>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>State</td>
                    <td><select name="sid">
                            <option>---select---</option>
                            <%
                               String selectdistrict="select*from tbl_state"; 
                               ResultSet ra=con.selectCommand(selectdistrict);
                               while(ra.next())
                               { 
                                    %>
                                    <option value="<%=ra.getString("state_id")%>"><%=ra.getString("state_name")%></option>
                           <%
                               }

                                %>
                        </select></td>
                </tr>
                <tr>
                    <td>District</td>
                    <td><input type="text" name="txtdistrict"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Submit"></td>
                </tr>
            </table>
        </form> 
                        <br>
                   <form>
        <table border="1" align="center">
            <tr>
                <td>Sl.no</td>
                <td>State</td>
                 <td>District</td>
                <td colspan="2">Action</td>
            </tr>  
           
            <% 
                               
            int i=0;
            String selQry="SELECT* FROM tbl_district d INNER JOIN tbl_state s on d.state_id=s.state_id";
            ResultSet rs=con.selectCommand(selQry);
            while(rs.next())
            {
                i++;
               %> 
                <tr>
                   <td><%=i%></td>
                   <td><%=rs.getString("state_name")%></td>
                   <td><%=rs.getString("district_name")%></td>
                   <td><a href="District.jsp?did=<%=rs.getString("district_id")%>">Delete</a></td>
                </tr> 
           <%     
            }
          
            %>
         
        </table>
                </form>
    </body>
</html>
