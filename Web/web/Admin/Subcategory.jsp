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
            String subcat=request.getParameter("txtsubcat");
            String cat=request.getParameter("cat");
            String insQry="insert into tbl_subcategory(subcategory_name,category_id)values('"+subcat+"','"+cat+"')";
            con.executeCommand(insQry);
            response.sendRedirect("Subcategory.jsp");
        }
        if(request.getParameter("sid")!=null)
        {
            String delQry="delete from tbl_subcategory where subcategory_id='"+request.getParameter("sid")+"'";
            con.executeCommand(delQry);
            response.sendRedirect("Subcategory.jsp");
            
        }
        %>
        <form method="post">
            <table>
                <tr>
                    <td>Category</td>
                    <td><select name="cat">
                            <option>---select---</option>
                            <%
                               String selectcategory="select*from tbl_category"; 
                               ResultSet ra=con.selectCommand(selectcategory);
                               while(ra.next())
                               { 
                                    %>
                                    <option value="<%=ra.getString("category_id")%>"><%=ra.getString("category_name")%></option>
                           <%
                               }
                           %>
                        </select></td>
                </tr>
                <tr>
                    <td>Sub Category</td>
                    <td><input type="text" name="txtsubcat"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" name="btnsave" value="Submit"></td>
                </tr>
            </table>
        </form> 
                   <form>
        <table border="1">
            <tr>
                <td>Sl.no</td>
                <td>Category</td>
                 <td>Sub Category</td>
                <td colspan="2">Action</td>
            </tr>  
           
            <% 
                               
            int i=0;
            String selQry="SELECT* FROM tbl_subcategory s INNER JOIN tbl_category c on s.category_id=c.category_id";
            ResultSet rs=con.selectCommand(selQry);
            while(rs.next())
            {
                i++;
               %> 
                <tr>
                   <td><%=i%></td>
                   <td><%=rs.getString("category_name")%></td>
                   <td><%=rs.getString("subcategory_name")%></td>
                   <td><a href="Subcategory.jsp?sid=<%=rs.getString("subcategory_id")%>">Delete</a></td>
                </tr> 
           <%     
            }
          
            %>
         
        </table>
                </form>
    </body>
</html>
