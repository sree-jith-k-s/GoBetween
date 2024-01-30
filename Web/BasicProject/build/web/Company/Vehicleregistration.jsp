<%-- 
    Document   : Vehicleregistration
    Created on : 22 Jan, 2024, 10:50:40 AM
    Author     : sruth
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vehicle Registration</title>
    </head>
    <body>
          <%
        if(request.getParameter("btnsave")!=null)
        {
            String name=request.getParameter("txtname");
            String rno=request.getParameter("txtrno");
            String cno=request.getParameter("txtcno");
            String idate=request.getParameter("txtidate");
            String iedate=request.getParameter("txtiedate");
            String subvtype=request.getParameter("txtvsubtype");
            String details=request.getParameter("txtdetails");
            String amount=request.getParameter("txtamount");
            String insQry="insert into tbl_vehicle(vehicle_name,vehicle_reg_no,vehicle_chase_no,vehicle_insurance_date,vehicle_insurance_exp,vehicle_details,vehicle_amount,vehiclesubtype_id,company_id)values('"+name+"','"+rno+"','"+cno+"','"+idate+"','"+iedate+"','"+details+"','"+amount+"','"+subvtype+"','"+session.getAttribute("companyid")+"')";
            if(con.executeCommand(insQry))
            {
            response.sendRedirect("Vehicleregistration.jsp");
            }
        }
        %>
        <h1 align="center">Vehicle Registration</h1>
        <form method="post">
            <table align="center" border="1">
                <tr>
                    <td>Vehicle Name</td>
                    <td><input type="text" name="txtname"></td>
                </tr>
                 <tr>
                    <td>Vehicle Registration Number</td>
                    <td><input type="text" name="txtrno"></td>
                </tr>
                 <tr>
                    <td>Vehicle Chase Number</td>
                    <td><input type="text" name="txtcno"></td>
                </tr>
                 <tr>
                    <td>Insurance Date</td>
                    <td><input type="date" name="txtidate"></td>
                </tr>
                 <tr>
                    <td>Insurance Expiration Date</td>
                    <td><input type="date" name="txtiedate"></td>
                </tr>
                <tr>
                    <td>Vehicle Type</td>
                    <td><select name="vtypeid" onchange="getVtype(this.value)">
                            <option>---Select---</option>
                            <%
                                String selectvtpe = "select*from tbl_vehicletype";
                                ResultSet ra = con.selectCommand(selectvtpe);
                                while (ra.next()) {
                            %>
                            <option value="<%=ra.getString("vehicletype_id")%>"><%=ra.getString("vehicletype_name")%></option>
                            <%
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Vehicle Subtype</td>
                    <td><select name="txtvsubtype" id="sel_vsubtype">
                            <option>---Select---</option>
                        </select>
                    </td>
                </tr>
                 <tr>
                    <td>Vehicle Details</td>
                    <td><input type="text" name="txtdetails"></td>
                </tr>
                 <tr>
                    <td>Vehicle Amount</td>
                    <td><input type="text" name="txtamount"></td>
                </tr>
                 <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsave" value="Submit">
                        <input type="reset" name="reset" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
                        <script src="../Assets/JQ/jQuery.js"></script>
        <script>
            function getVtype(vid)
            {
                $.ajax({
                    url: "../Assets/AjaxPages/Ajaxvehiclesubtype.jsp?vid=" + vid,
                    success: function(result) {
                        $("#sel_vsubtype").html(result);

                    }
                });
            }
        </script>
    </body>
</html>
