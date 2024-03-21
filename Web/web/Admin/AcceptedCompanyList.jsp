<%-- 
    Document   : AcceptedCompanyList
    Created on : May 16, 2021, 3:06:30 PM
    Author     : Pro-TECH
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >
    <head>
        <meta charset="UTF-8">
        <title>Go - Between</title>
        <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css'>
        <link rel='stylesheet' href='https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css'>
        <link rel='stylesheet' href='https://cdn.datatables.net/buttons/1.2.2/css/buttons.bootstrap.min.css'>
        <style>
            body {
                margin:2em;
                
            }
        </style>
        <%
        if(request.getParameter("rcid")!=null)
        {
            String upQry = "update tbl_company set company_status='2' where company_id='"+request.getParameter("rcid")+"'";
            con.executeCommand(upQry);
            response.sendRedirect("NewCompanyList.jsp");
        }
        
        
        %>
    </head>
    <body>
        <h1 align="center" id="heading">Accepted Company List</h1>
        <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Sl.no</th>
                    <th>Logo</th>
                    <th>Name</th>
                    <th>Proof</th>
                    <th>State</th>
                    <th>District</th>
                    <th>Location</th>
                    <th>Owner</th>
                    <th>Contact</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%                   int i = 0;
                    String selQry = "select * from tbl_company c inner join tbl_location l on l.location_id=c.location_id inner join tbl_district d on d.district_id=l.district_id inner join tbl_state s on s.state_id=d.state_id where company_status='1'";
                    ResultSet rs = con.selectCommand(selQry);

                    while (rs.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><img style="border-radius: 50%" src="../Assets/Files/CompanyLogo/<%=rs.getString("company_logo")%>" width="80" height="80"></td>
                    <td><%=rs.getString("company_name")%></td>
                    <td><a href="../Assets/Files/CompanyProof/<%=rs.getString("company_proof")%>" download>Download</a></td>
                    <td><%=rs.getString("state_name")%></td>
                    <td><%=rs.getString("district_name")%></td>
                    <td><%=rs.getString("location_name")%></td>
                    <td><%=rs.getString("owner_name")%></td>
                    <td><%=rs.getString("owner_contact")%></td>
                    <td><a href="NewCompanyList.jsp?rcid=<%=rs.getString("company_id")%>">Reject</a></td>
                </tr>
                <%
                    }

                %>
            </tbody>
        </table>
        <!-- partial -->
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
        <script src='https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js'></script>
        <script src='https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js'></script>
        <script src='https://cdn.datatables.net/buttons/1.2.2/js/buttons.colVis.min.js'></script>
        <script src='https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js'></script>
        <script src='https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js'></script>
        <script src='https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js'></script>
        <script src='https://cdn.datatables.net/buttons/1.2.2/js/buttons.bootstrap.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.18/pdfmake.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.18/vfs_fonts.js'></script>
        <script>
            $(document).ready(function() {
                // Function to convert an img URL to data URL
                function getBase64FromImageUrl(url) {
                    var img = new Image();
                    img.crossOrigin = "anonymous";
                    img.onload = function() {
                        var canvas = document.createElement("canvas");
                        canvas.width = this.width;
                        canvas.height = this.height;
                        var ctx = canvas.getContext("2d");
                        ctx.drawImage(this, 0, 0);
                        var dataURL = canvas.toDataURL("image/png");
                        return dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
                    };
                    img.src = url;
                }
                // DataTable initialisation
                $('#example').DataTable(
                        {
                            "dom": '<"dt-buttons"Bf><"clear">lirtp',
                            "paging": true,
                            "autoWidth": true,
                            "buttons": [
                                {
                                    text: 'Custom PDF',
                                    extend: 'pdfHtml5',
                                    filename: 'pdf',
                                    orientation: 'portrait', //portrait or landscape
                                    pageSize: 'A4', //A3 , A4 , A5 , A6 , legal , letter
                                    exportOptions: {
                                        columns: ':visible',
                                        search: 'applied',
                                        order: 'applied'
                                    },
                                    customize: function(doc) {
                                        //Remove the title created by datatTables
                                        doc.content.splice(0, 1);
                                        var heading = document.getElementById("heading").innerHTML;
                                        //Create a date string that we use in the footer. Format is dd-mm-yyyy
                                        var now = new Date();
                                        var jsDate = now.getDate() + '-' + (now.getMonth() + 1) + '-' + now.getFullYear();
                                        // Logo converted to base64
                                        // var logo = getBase64FromImageUrl('https://datatables.net/media/images/logo.png');
                                        // The above call should work, but not when called from codepen.io
                                        // So we use a online converter and paste the string in.
                                        // Done on http://codebeautify.org/image-to-base64-converter
                                        // It's a LONG string scroll down to see the rest of the code !!!
                                        var logo = 'data:image/jpg;base64,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';
                                        // A documentation reference can be found at
                                        // https://github.com/bpampuch/pdfmake#getting-started
                                        // Set page margins [left,top,right,bottom] or [horizontal,vertical]
                                        // or one number for equal spread
                                        // It's important to create enough space at the top for a header !!!
                                        doc.pageMargins = [20, 60, 20, 30];
                                        // Set the font size fot the entire document
                                        doc.defaultStyle.fontSize = 7;
                                        // Set the fontsize for the table header
                                        doc.styles.tableHeader.fontSize = 7;
                                        // Create a header object with 3 columns
                                        // Left side: Logo
                                        // Middle: brandname
                                        // Right side: A document title
                                        doc['header'] = (function() {
                                            return {
                                                columns: [
//                                                    {
//                                                        image: logo,
//                                                        width: 100
//                                                    },
                                                    {
                                                        alignment: 'center',
                                                        italics: true,
                                                        text: heading,
                                                        fontSize: 18,
                                                        margin: [10, 0]
                                                    }
//                                                    ,
//                                                    {
//                                                        alignment: 'right',
//                                                        fontSize: 14,
//                                                        text: 'Custom PDF'
//                                                    }
                                                ],
                                                margin: 20
                                            };
                                        });
                                        // Create a footer object with 2 columns
                                        // Left side: report creation date
                                        // Right side: current page and total pages
                                        doc['footer'] = (function(page, pages) {
                                            return {
                                                columns: [
                                                    {
                                                        alignment: 'left',
                                                        text: ['Created on: ', {text: jsDate.toString()}]
                                                    },
                                                    {
                                                        alignment: 'right',
                                                        text: ['page ', {text: page.toString()}, ' of ', {text: pages.toString()}]
                                                    }
                                                ],
                                                margin: 20
                                            };
                                        });
                                        // Change dataTable layout (Table styling)
                                        // To use predefined layouts uncomment the line below and comment the custom lines below
                                         //doc.content[0].layout = 'lightHorizontalLines'; // noBorders , headerLineOnly ,lightHorizontalLines
                                        var objLayout = {};
                                        objLayout['hLineWidth'] = function(i) {
                                            return .5;
                                        };
                                        objLayout['vLineWidth'] = function(i) {
                                            return .5;
                                        };
                                        objLayout['hLineColor'] = function(i) {
                                            return '#aaa';
                                        };
                                        objLayout['vLineColor'] = function(i) {
                                            return '#aaa';
                                        };
                                        objLayout['paddingLeft'] = function(i) {
                                            return 4;
                                        };
                                        objLayout['paddingRight'] = function(i) {
                                            return 4;
                                        };
                                        doc.content[0].layout = objLayout;
                                    }
                                }]
                        });
            });
        </script>
    </body>
</html>




