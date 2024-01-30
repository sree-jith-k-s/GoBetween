<%-- 
    Document   : Salarycalculator
    Created on : 11 Dec, 2023, 3:04:26 PM
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
        String fname="",lname="",gender="",marital="",dept="",name="";
        double bs=0,ta=0,da=0,hra=0,lic=0,pf=0,d=0,net=0;
       
        if(request.getParameter("btnsave")!=null)
        {
             bs=Integer.parseInt(request.getParameter("salary"));
            fname=request.getParameter("fname");
            lname=request.getParameter("lname");
            gender=request.getParameter("gender");
            marital=request.getParameter("marital");
            dept=request.getParameter("dept");
            if(bs>=10000)
            {
               
                   ta=0.40*bs;
                   da=0.35*bs;
                   hra=0.30*bs;
                   lic=0.25*bs;
                   pf=0.20*bs;
            }
            else if(bs>=5000&bs<=10000)
            {
               
                   ta=0.35*bs;
                   da=0.30*bs;
                   hra=0.25*bs;
                   lic=0.20*bs;
                   pf=0.15*bs;
            }
             else if(bs<5000)
            {
               
                   ta=0.30*bs;
                   da=0.25*bs;
                   hra=0.20*bs;
                   lic=0.15*bs;
                   pf=0.10*bs;
            }
            d=lic+pf;
            net=bs+ta+da+hra-d;
             
               if (gender.equals("female") & marital.equals("single"))
               {
                   name="Miss"+"  "+fname+"  "+lname;
               }
                 else if (gender.equals("female")&marital.equals("married"))
               {
                   name="Mrs."+"  "+fname+"  "+lname;
               }
              else
                        {
                       name="Mr."+fname+"  "+lname;
                        }
                     
        }
        %>
        <form method="post">
            <table>
                <tr>
                    <td>First Name</td>
                    <td><input type="text" name="fname"></td>
                </tr>
                  <tr>
                    <td>Last Name</td>
                    <td><input type="text" name="lname"></td>
                </tr>
                  <tr>
                    <td>Gender</td>
                    <td><input type="radio" name="gender" value="male">Male
                    <input type="radio" name="gender" value="female">Female
                    </td>
                </tr>
                 <tr>
                    <td>Marital</td>
                    <td><input type="radio" name="marital" value="single">Single
                    <input type="radio" name="marital" value="married">Married
                    </td>
                </tr>
                 <tr>
                    <td>Department</td>
                    <td><select name="dept">
                            <option>---select---</option>
                            <option>Sales</option>
                            <option>Marketing</option>
                            <option>Management</option>
                      </select>
        </td>
                </tr>
                <tr>
                    <td>Basic Salary</td>
                    <td><input type="text" name="salary"></td>
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
                    <td><%=name%>
                    </td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><%out.print(gender); %></td>
                </tr>
                <tr>
                    <td>Marital</td>
                    <td><%out.print(marital); %></td>
                </tr>
                <tr>
                    <td>Department</td>
                    <td><%out.print(dept); %></td>
                </tr>
                <tr>
                    <td>Basic Salary</td>
                    <td><%out.print(bs); %></td>
                </tr>
                 <tr>
                    <td>TA</td>
                    <td><%out.print(ta); %></td>
                </tr>
                 <tr>
                    <td>DA</td>
                    <td><%out.print(da); %></td>
                </tr>
                <tr>
                    <td>HRA</td>
                    <td><%out.print(hra); %></td>
                </tr>
                <tr>
                    <td>LIC</td>
                    <td><%out.print(lic); %></td>
                </tr>
                <tr>
                    <td>PF</td>
                    <td><%out.print(pf); %></td>
                </tr>
                <tr>
                    <td>Deduction</td>
                    <td><%out.print(d); %></td>
                </tr>
                <tr>
                    <td>NET</td>
                    <td><%out.print(net); %></td>
                </tr>
            </table>
        </form>
    </body>
</html>
