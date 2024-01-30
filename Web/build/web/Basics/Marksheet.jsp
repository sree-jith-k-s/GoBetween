<%-- 
    Document   : Marksheet
    Created on : 11 Dec, 2023, 12:28:29 PM
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
          String name="",dept="",course="";
        int m1=0,m2=0,m3=0,tot=0,avg=0;
        if(request.getParameter("btnsave")!=null)
        {
            m1=Integer.parseInt(request.getParameter("mark1"));
            m2=Integer.parseInt(request.getParameter("mark2"));
            m3=Integer.parseInt(request.getParameter("mark3"));
            tot=m1+m2+m3;
            avg=tot/3;
            name=request.getParameter("name");
            dept=request.getParameter("dept");
            course=request.getParameter("course");
        }
        else
        {
            out.print("add values");
        }
         %>
        <form>
            <table
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name"></td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td><select name="dept">
                            <option>---select---</option>
                            <option>Computer Science</option>
                            <option>Commerce</option>
                            <option>Management</option>
                      </select>
        </td>
                </tr>
                <tr>
                    <td>course</td>
                    <td><input type="text" name="course"</td>
                </tr>
                <tr>
                    <td>Mark1</td>
                    <td><input type="text" name="mark1"</td>
                </tr>
                 <tr>
                    <td>Mark2</td>
                    <td><input type="text" name="mark2"</td>
                </tr>
                 <tr>
                    <td>Mark3</td>
                    <td><input type="text" name="mark3"</td>
                </tr>
                <tr>
                    <td colspan="2" align="center" >
                        <input type="submit" name="btnsave" value="save">
                        <input type="reset" name="reset" value="cancel"
                    </td>
                </tr>
            </table>
        </form>
        <form>
            <table>
             <tr>
                    <td>Name</td>
                    <td><%out.print(name);%></td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td><%out.print(dept);%></td>
                </tr>
                <tr>
                    <td>Course</td>
                    <td><%out.print(course);%></td>
                </tr>
                <tr>
                    <td>Mark1</td>
                    <td><%out.print(m1);%></td>
                </tr>
                 <tr>
                    <td>Mark2</td>
                    <td><%out.print(m2);%></td>
                </tr>
                 <tr>
                    <td>Mark3</td>
                    <td><%out.print(m3);%></td>
                </tr>
                <tr>
                    <td>Total</td>
                    <td><%out.print(tot);%></td>
                </tr>
                <tr>
                    <td>Average</td>
                    <td><%out.print(avg);%></td>
                </tr>
                <tr>
                    <td>Grade</td>
                    <td><%
                    if(avg>=75)
                    {
                        out.print("A");
                    }
                    else if(avg>=50&avg<=75)
                    {
                        out.print("B");
                    }
                     else if(avg>=25&avg<=50)
                    {
                        out.print("C");
                    }
                     else if(avg>=10&avg<=25)
                    {
                        out.print("D");
                    }
                     else if(avg<10)
                    {
                        out.print("Failed");
                    }
                    %></td>
                </tr>
            </table>
        </form>
    </body>
</html>
 