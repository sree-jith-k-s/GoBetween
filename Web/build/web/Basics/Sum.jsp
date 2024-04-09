<%-- 
    Document   : Sum
    Created on : 11 Dec, 2023, 10:59:11 AM
    Author     : sruth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            int sum=0;
        if(request.getParameter("btnsave")!=null)
        {
           
            int num1=Integer.parseInt(request.getParameter("number1"));
            int num2=Integer.parseInt(request.getParameter("number2"));
            sum=num1+num2;
        }
        
        
        
        %>
        <form action="" method="POST">
            <table>
                <tr>
                    <td>Number1</td>
                    <td><input type="text" name="number1"></td>
                </tr>
                <tr>
                    <td>Number2</td>
                    <td><input type="text" name="number2"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center" >
                        <input type="submit" name="btnsave" value="sum">
                        <input type="reset" name="reset" value="cancel"
                    </td>
                </tr>
                <tr>
                    <td>Sum</td>
                    <td><input type="text" name="sum" value="<%=sum%>"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
