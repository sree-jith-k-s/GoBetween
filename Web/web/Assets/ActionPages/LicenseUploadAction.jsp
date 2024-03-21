<%-- 
    Document   : LicenseUploadAction
    Created on : May 24, 2021, 8:56:47 PM
    Author     : Pro-TECH
--%>

<%@page import="java.sql.ResultSet"%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%

            File savedFile = null;
            FileItem f_item = null;

            String field_name = "";
            String file_name = "";
            String fn = "", fm = "";

            String field[] = new String[20];
            String value[] = new String[20];

//checking if request cotains multipart data
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            if (isMultipart) {

                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                //declaring a list of form fields
                List items_list = null;

                //assigning fields to list 'items_list'
                try {
                    items_list = upload.parseRequest(request);
                } catch (FileUploadException ex) {
                    out.println(ex);
                }

                //declaring iterator
                Iterator itr = items_list.iterator();
                int k = 0;
                //iterating through the list 'items_list'
                while (itr.hasNext()) {

                    //typecasting next element in items_list as fileitem
                    f_item = (FileItem) itr.next();

                    //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc)
                    if (f_item.isFormField()) {

                        //getting fieldname and value
                        field[k] = f_item.getFieldName();
                        value[k] = f_item.getString();

                        k++;
                    } else {

                        //f_item=(FileItem)itr.next();
                        file_name = f_item.getName();
                        field_name = f_item.getFieldName();
                        if (field_name.equals("file_front")) {
                            String ext = file_name.substring(file_name.lastIndexOf("."));
                            //setting path to store image
                            File proj_path = new File(config.getServletContext().getRealPath("/"));
                            String file_path = proj_path.getParentFile().getParentFile().getPath() + "\\web\\Assets\\Files\\LicenseFront\\";
                            Random r = new Random();
                            int r_num = r.nextInt(1111) + 999;

                            fn = "front_" + r_num + ext;
                            //creating a file object
                            savedFile = new File(file_path + fn);
                            try {
                                //writing the file object
                                f_item.write(savedFile);

                            } catch (Exception ex) {
                                out.println(ex);
                            }
                        }
                        if (field_name.equals("file_back")) {
                            String ext = file_name.substring(file_name.lastIndexOf("."));
                            //setting path to store image
                            File proj_path = new File(config.getServletContext().getRealPath("/"));
                            String file_path = proj_path.getParentFile().getParentFile().getPath() + "\\web\\Assets\\Files\\LicenseBack\\";
                            Random r = new Random();
                            int r_num = r.nextInt(1111) + 999;

                            fm = "back_" + r_num + ext;
                            //creating a file object
                            savedFile = new File(file_path + fm);
                            try {
                                //writing the file object
                                f_item.write(savedFile);

                            } catch (Exception ex) {
                                out.println(ex);
                            }
                        }

                    }

                }

                String stime = value[2];
                int a = Integer.parseInt(stime.substring(0, stime.length() - 6));
                String b = stime.substring(4, stime.length());
                String exp = String.valueOf(a + 20) + b ;
                String bexp = String.valueOf(a + 5) + b ;

                String selQry = "select * from tbl_driver_license where driver_id='" + session.getAttribute("did") + "'";

                ResultSet rs = con.selectCommand(selQry);
                if (rs.next()) {
                    String del = "delete from tbl_driver_license where driver_id='" + session.getAttribute("did") + "'";
                    System.out.println(del);
                    if (con.executeCommand(del)) {
                        String str2 = "insert into tbl_driver_license(driver_license_front_photo,driver_license_back_photo,driver_license_number,driver_license_class,driver_license_date,driver_license_exp_date,driver_license_badge_exp_date,driver_id)"
                                + "values('" + fn + "','" + fm + "','" + value[0] + "','" + value[1] + "','" + value[2] + "','" + exp + "','" + bexp + "','" + session.getAttribute("did") + "')";

                        boolean status1 = con.executeCommand(str2);

                        if (status1 == true) {
        %> 
        <script type="text/javascript">
            alert("Updated Successfully..");
            setTimeout(function() {
                window.location.href = '../../Driver/ViewLicence.jsp'
            }, 20);
        </script>
        <%
                }
            }
        } else {
            String str1 = "insert into tbl_driver_license(driver_license_front_photo,driver_license_back_photo,driver_license_number,driver_license_class,driver_license_date,driver_license_exp_date,driver_license_badge_exp_date,driver_id)"
                    + "values('" + fn + "','" + fm + "','" + value[0] + "','" + value[1] + "','" + value[2] + "','" + exp + "','" + bexp + "','" + session.getAttribute("did") + "')";
            System.out.println();
            boolean status = con.executeCommand(str1);

            if (status == true) {
        %> 
        <script type="text/javascript">
            alert("Upload Successfully..");
            setTimeout(function() {
                window.location.href = '../../Driver/ViewLicence.jsp'
            }, 20);
        </script>
        <%
                    }
                }

            }


        %>
    </body>
</html>
