<%-- 
    Document   : Feedback
    Created on : May 23, 2021, 6:36:10 PM
    Author     : Pro-TECH
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="Head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FeedBack</title>
    </head>
    <%        if (request.getParameter("btn_send") != null) {

            String insQry = "insert into tbl_feedback(feedback_content,feedback_date,user_id)"
                    + "values('" + request.getParameter("content") + "',curdate(),'" + session.getAttribute("uid") + "')";
            if(con.executeCommand(insQry))
            {
                %> 
       <script type="text/javascript">
             setTimeout(function(){window.location.href='index.jsp'},40);//40millisecend it go to next page
        </script>
     <%
 
            }

        }


    %>
    <body>
        <div id="tab" align="center">
            <h1>Feedback</h1>
            <form method="post">
                <table border="1">
                    <tr>
                        <td>Feedback</td>
                    </tr>
                    <tr>
                        <td><textarea name="content"></textarea></td>
                    </tr>
                    <tr>
                        <td align="center"><input type="submit" value="Send" name="btn_send"></td>
                    </tr>
                </table>
            </form>


        </div>
        <%@include file="Foot.jsp" %>
    </body>
</html>

