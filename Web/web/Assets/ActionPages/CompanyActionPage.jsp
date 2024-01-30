
<jsp:useBean class="DB.ConnectionClass" id="obj"></jsp:useBean>
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
        <title></title>
    </head>
    <body>

        <%

            FileItem f_item = null;
            File savedFile = null;

            String field_name = "";
            String logo = "", proof = "";
            String file_name = "";

            String field[] = new String[20];
            String value[] = new String[20];

            //checking if request cotains multipart data
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);//true/false

            if (isMultipart) {

                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                //declaring a list of form fields.everything on form adding t itemlist
                List items_list = null;

                //assigning fields to list 'items_list'
                try {
                    items_list = upload.parseRequest(request);//requeat contains evrything on form this is parsed and stored to item_list
                } catch (FileUploadException ex) {
                    out.println(ex);
                }

                //declaring iterator used to iterate through all positions in item_lists
                Iterator itr = items_list.iterator();
                int k = 0;
                //iterating through the list 'items_list'
                while (itr.hasNext())//checking if there is any value in the position like rs.next()
                {

                    //typecasting next element in items_list as fileitem
                    f_item = (FileItem) itr.next();// value to which the iterator points  and is coverted to fileitem format

                    //checking if 'f_item' contains a formfield(common controls like textbox,dropdown,radio buttonetc) or multipath
                    if (f_item.isFormField()) {

                        //getting fieldname and value
                        field[k] = f_item.getFieldName();//field
                        value[k] = f_item.getString();//user typing value

                        k++;//
                    } else//when it is an image or multipart
                    {

                        //f_item=(FileItem)itr.next();
                        file_name = f_item.getName();
                        field_name = f_item.getFieldName();

                        if (field_name.equals("txtlogo"))//write the name of image here it is img_product
                        {
                            String ext = file_name.substring(file_name.lastIndexOf("."));//means the extension is stored to variable ext
                            //setting path to store image
                            File proj_path = new File(config.getServletContext().getRealPath("/"));
                            String file_path = proj_path.getParentFile().getParentFile().getPath() + "\\Web\\Assets\\Files\\Company\\Company Logo\\";//path for storing image
                            Random r = new Random();//to generate random number
                            int r_num = r.nextInt(1111) + 999;//values between this are generated

                            logo = "CompanyLogo_" + r_num + ext;//generating random number for images so this name and format of imagewil be stored inside the server
                            //creating a file object
                            savedFile = new File(file_path + logo);//fn contains name of file
                            try {
                                //writing the file object
                                f_item.write(savedFile);  //writing to server means the folder             

                            } catch (Exception ex) {
                                out.println(ex);
                            }
                        }
                         if (field_name.equals("txtproof"))//write the name of image here it is img_product
                        {
                            String ext = file_name.substring(file_name.lastIndexOf("."));//means the extension is stored to variable ext
                            //setting path to store image
                            File proj_path = new File(config.getServletContext().getRealPath("/"));
                            String file_path = proj_path.getParentFile().getParentFile().getPath() + "\\Web\\Assets\\Files\\Company\\Company Proof\\";//path for storing image
                            Random r = new Random();//to generate random number
                            int r_num = r.nextInt(1111) + 999;//values between this are generated

                            proof = "CompanyProof_" + r_num + ext;//generating random number for images so this name and format of imagewil be stored inside the server
                            //creating a file object
                            savedFile = new File(file_path + proof);//fn contains name of file
                            try {
                                //writing the file object
                                f_item.write(savedFile);  //writing to server means the folder             

                            } catch (Exception ex) {
                                out.println(ex);
                            }
                        }
                        
                        
                    }

                }
                if(value[11].equals(value[12]))
                {
                String InsQry = "insert into tbl_company(company_name,company_contact,company_email,company_address,company_since,company_proof,company_logo,location_id,owner_name,owner_email,owner_contact,owner_password,company_doj)"
                        + "values('" + value[0] + "','" + value[1] + "','" + value[2] + "','" + value[3] + "','" + value[4] + "','" + proof + "','" + logo + "','" + value[7] + "','" + value[8] + "','" + value[9] + "','" + value[10] + "','" + value[11] + "',curdate())";

                boolean status = obj.executeCommand(InsQry);

                if (status == true) {
        %> 
        <script type="text/javascript">
            alert("Upload Successfully..");
            setTimeout(function() {
                window.location.href = '../../Guest/Companyregistration.jsp'
            }, 40);
        </script>
        <%
                }
            }
                else 
                {
                    %>
                   <script type="text/javascript">
            alert("Passwords doesn't match");
            setTimeout(function() {
                window.location.href = '../../Guest/Companyregistration.jsp'
            }, 40);
        </script>
        <%
                }
            }
       
%>
    </body>
</html>