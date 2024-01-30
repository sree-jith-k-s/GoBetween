<%-- 
    Document   : District
    Created on : 12 Dec, 2023, 11:17:25 AM
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
             String state=request.getParameter("txtstate");
            if(request.getParameter("hiddenid")=="")
            {
                
            String insQry="insert into tbl_state(state_name)value('"+state+"')";
            con.executeCommand(insQry);
            response.sendRedirect("State.jsp");
                
                
            }else{
               
                String upQry="update tbl_state set state_name='"+state+"' where state_id='"+request.getParameter("hiddenid")+"'";
                con.executeCommand(upQry);
                response.sendRedirect("State.jsp");
            }
             
        }
        if(request.getParameter("did")!=null)
        {
            String delQry="delete from tbl_state where state_id='"+request.getParameter("sid")+"'";
            con.executeCommand(delQry);
            response.sendRedirect("State.jsp");
            
        }
        String sid="",sname="";
        if(request.getParameter("eid")!=null)
        {
            String SelQ="select * from tbl_state where state_id='"+request.getParameter("eid")+"'";
            ResultSet rs1=con.selectCommand(SelQ);
            rs1.next();
            sid=rs1.getString("state_id");
            sname=rs1.getString("state_id");
            
            
        }
        
        
        %>
        <h1 align="center">Add State</h1>
        <form action="" method="POST">
            <table border="1" align="center"> 
                <tr>
                    <td>State</td>
                    <td><input type="text" name="txtstate" value="<%=sname%>">
                        <input type="hidden" name="hiddenid" value="<%=sid%>" ></td>
                </tr>
               
                <tr>
                    <td colspan="2" align="center" >
                        <input type="submit" name="btnsave" value="Save">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
               
            </table>
        </form>
                <br>
                <form>
        <table border="1" align="center">
            <tr>
                <td>Sl.no</td>
                <td>State</td>
                <td colspan="2">Action</td>
            </tr>   
            <%  
            int i=0;
            String selQry="select * from tbl_state";
            ResultSet rs=con.selectCommand(selQry);
            while(rs.next())
            {
                i++;
               %> 
               <tr>
                   <td><%=i%></td>
                   <td><%=rs.getString("state_name")%></td>
                   <td><a href="State.jsp?did=<%=rs.getString("state_id")%>">Delete</a></td>
                   <td><a href="State.jsp?eid=<%=rs.getString("state_id")%>">Edit</a></td>
              </tr>
                <%     
            }  
            %>
            
        </table>
                </form>
    </body>
</html>
