<%-- 
    Document   : Calculator
    Created on : 11 Dec, 2023, 11:53:13 AM
    Author     : sruth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            int result=0;
             if(request.getParameter("btnsum")!=null)
             {
           
            int num1=Integer.parseInt(request.getParameter("number1"));
            int num2=Integer.parseInt(request.getParameter("number2"));
            result=num1+num2;
             }
             else if(request.getParameter("btnsub")!=null)
             {
               int num1=Integer.parseInt(request.getParameter("number1"));
               int num2=Integer.parseInt(request.getParameter("number2"));
               result=num1-num2;
             }
             else if(request.getParameter("btnmult")!=null)
             {
               int num1=Integer.parseInt(request.getParameter("number1"));
               int num2=Integer.parseInt(request.getParameter("number2"));
               result=num1*num2;   
             }
             else if(request.getParameter("btndiv")!=null)
             {
               int num1=Integer.parseInt(request.getParameter("number1"));
               int num2=Integer.parseInt(request.getParameter("number2"));
               result=num1/num2;   
             }
            %>
        <form action="" method="post">
            <table>
                <tr>
                    <td>Number1</td>
                    <td><input type="text" name="number1"></td>
                </tr>
                <tr>
                    <td>Number2</td>
                    <td><input type="text" name="number2"</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="btnsum" value="+">
                         <input type="submit" name="btnsub" value="-">
                          <input type="submit" name="btnmult" value="*">
                           <input type="submit" name="btndiv" value="/">
                        <input type="reset" name="reset" value="cancel">
                    </td>
                </tr>
                <tr>
                    <td>Result</td>
                    <td><input type="text" name="result" value="<%=result%>"></td>
                </tr>
            </table>
        </form>
        
    </body>
</html>
