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
            String category=request.getParameter("txtcategory");
            if(request.getParameter("hiddenid")=="")
            {
            String insQry="insert into tbl_category(category_name)value('"+category+"')";
             con.executeCommand(insQry);
            response.sendRedirect("Category.jsp");
          }
            else
            {
               String upQry="update tbl_category set category_name='"+category+"' where category_id='"+request.getParameter("hiddenid")+"'";
                con.executeCommand(upQry);
                response.sendRedirect("Category.jsp"); 
            }
        }
         if(request.getParameter("cid")!=null)
        {
            String delQry="delete from tbl_category where category_id='"+request.getParameter("cid")+"'";
            con.executeCommand(delQry);
            response.sendRedirect("Category.jsp");
            
        }
         String catid="",catname="";
         if(request.getParameter("eid")!=null)
         {
             String SelQ="select * from tbl_category where category_id='"+request.getParameter("eid")+"'";
            ResultSet rs1=con.selectCommand(SelQ);
            rs1.next();
            catid=rs1.getString("category_id");
            catname=rs1.getString("category_name");
         }
        %>
        <form method="post">
            <table>
                <tr>
                    <td>Category</td>
                    <td><input type="text" name="txtcategory" value="<%=catname%>">
                    <input type="hidden" name="hiddenid" value="<%=catid%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="Save">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
            </table>
        </form>
        <table border="1">
            <tr>
                <th>SL.NO</th>
                <th>Category name</th>
                <th>Action</th>
            </tr>
            <%
            int i=0;
            String selQry="select * from tbl_category";
            ResultSet r=con.selectCommand(selQry);
            while(r.next())
            {
                  i++;
               %> 
               <tr>
                   <td><%=i%></td>
                   <td><%=r.getString("category_name")%></td>
                   <td><a href="Category.jsp?cid=<%=r.getString("category_id")%>">Delete</a>
                   <a href="Category.jsp?eid=<%=r.getString("category_id")%>">Edit</a></td>
               </tr>
           <%     
            }
            %>
        </table>
    </body>
</html>
