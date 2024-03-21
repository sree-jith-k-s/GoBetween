package org.apache.jsp.Guest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <!-- Required meta tags -->\n");
      out.write("        ");
      DB.ConnectionClass con = null;
      synchronized (_jspx_page_context) {
        con = (DB.ConnectionClass) _jspx_page_context.getAttribute("con", PageContext.PAGE_SCOPE);
        if (con == null){
          con = new DB.ConnectionClass();
          _jspx_page_context.setAttribute("con", con, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("\n");
      out.write("            <meta charset=\"utf-8\">\n");
      out.write("            <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("            <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n");
      out.write("\n");
      out.write("            <title>Login</title>\n");
      out.write("\n");
      out.write("            <!-- Core CSS -->\n");
      out.write("            <link rel=\"stylesheet\" href=\"../Assets/Templates/Templates/friendskit/assets/css/bulma.css\">\n");
      out.write("            <link rel=\"stylesheet\" href=\"../Assets/Templates/friendskit/assets/css/app.css\">\n");
      out.write("            <link rel=\"stylesheet\" href=\"../Assets/Templates/friendskit/assets/css/core.css\">\n");
      out.write("\n");
      out.write("            <title>Go-Between</title>\n");
      out.write("        </head>\n");
      out.write("    ");

        if (request.getParameter("btn_login") != null) {

            String email = request.getParameter("txt_email");
            String password = request.getParameter("txt_password");

            String seladmin = "select * from tbl_admin where admin_email='" + email + "' and admin_password='" + password + "'";
            ResultSet rsadmin = con.selectCommand(seladmin);

            String selcompany = "select * from tbl_company where company_status='1' and owner_email='" + email + "' and owner_password='" + password + "'";
            ResultSet rscompany = con.selectCommand(selcompany);

            String seldriver = "select * from tbl_driver where driver_status='1' and driver_email='" + email + "' and driver_password='" + password + "'";
            ResultSet rsdriver = con.selectCommand(seldriver);

            String seluser = "select * from tbl_user where user_status='1' and user_email='" + email + "' and user_password='" + password + "'";
            ResultSet rsuser = con.selectCommand(seluser);

            if (rsadmin.next()) {

                response.sendRedirect("../Admin/index.jsp");

            } else if (rscompany.next()) {

                session.setAttribute("cid", rscompany.getString("company_id"));
                session.setAttribute("cname", rscompany.getString("company_name"));
                response.sendRedirect("../Company/index.jsp");

            } else if (rsdriver.next()) {

                session.setAttribute("did", rsdriver.getString("driver_id"));
                session.setAttribute("dname", rsdriver.getString("driver_name"));
                response.sendRedirect("../Driver/index.jsp");

            } else if (rsuser.next()) {

                session.setAttribute("uid", rsuser.getString("user_id"));
                session.setAttribute("uname", rsuser.getString("user_name"));
                response.sendRedirect("../User/index.jsp");

            } else {
    
      out.write("\n");
      out.write("    <script type=\"text/javascript\">\n");
      out.write("        alert(\"Invalid Login Credentials\");\n");
      out.write("        setTimeout(function() {\n");
      out.write("            window.location.href = 'Login.jsp'\n");
      out.write("        }, 100);\n");
      out.write("    </script>\n");
      out.write("    ");

            }
        }
    
      out.write("\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <!--         Pageloader \n");
      out.write("                <div class=\"pageloader\"></div>\n");
      out.write("                <div class=\"infraloader is-active\"></div>-->\n");
      out.write("        <div class=\"signup-wrapper\">\n");
      out.write("\n");
      out.write("            <!--        Fake navigation\n");
      out.write("                    <div class=\"fake-nav\">\n");
      out.write("                        <a href=\"/\" class=\"logo\" style=\"font-weight:bolder;font-size: xx-large;color: dimgray;\" >\n");
      out.write("                         College-Connect\n");
      out.write("                            \n");
      out.write("                        </a>\n");
      out.write("                    </div>-->\n");
      out.write("\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <!--Container-->\n");
      out.write("                <div class=\"login-container\">\n");
      out.write("                    <div class=\"columns is-vcentered\">\n");
      out.write("                        <div class=\"column is-6 image-column\">\n");
      out.write("                            <!--Illustration-->\n");
      out.write("                            <img class=\"light-image login-image\" src=\"../Assets/Templates/friendskit/assets/img/illustrations/login.svg\" alt=\"\">\n");
      out.write("                            <img class=\"dark-image login-image\" src=\"../Assets/Templates/friendskit/assets/img/illustrations/login-dark.svg\" alt=\"\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"column is-6\">\n");
      out.write("\n");
      out.write("                            <h2 class=\"form-title\">Welcome </h2>\n");
      out.write("                            <h3 class=\"form-subtitle\">Enter your credentials to sign in.</h3>\n");
      out.write("\n");
      out.write("                            <!--Form-->\n");
      out.write("\n");
      out.write("                            <form method=\"post\">\n");
      out.write("                                <div class=\"login-form\">\n");
      out.write("                                    <div class=\"form-panel\">\n");
      out.write("                                        <div class=\"field\">\n");
      out.write("                                            <label>Email</label>\n");
      out.write("                                            <div class=\"control\">\n");
      out.write("                                                <input type=\"email\" id=\"input\" pattern=\"[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,}$\"\n");
      out.write("                                                       class=\"input\" autocomplete=\"off\"  name=\"txt_email\" placeholder=\"Enter your Email\" required=\"required\"/>\n");
      out.write("                                            </div>\n");
      out.write("                                        </div>\n");
      out.write("                                        <div class=\"field\">\n");
      out.write("                                            <label>Password</label>\n");
      out.write("                                            <div class=\"control\">\n");
      out.write("                                                <input type=\"password\" class=\"input\" pattern=\"(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}\"\n");
      out.write("                                                       title=\"Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters\" \n");
      out.write("                                                       name=\"txt_password\" placeholder=\"Enter your password\" required=\"required\"/>\n");
      out.write("                                            </div>\n");
      out.write("\n");
      out.write("                                        </div>\n");
      out.write("                                        <br><br>\n");
      out.write("\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"buttons\">\n");
      out.write("                                        <button class=\"button is-solid primary-button is-fullwidth raised\" type=\"submit\"  name=\"btn_login\"><span>Login</span></button>                    \n");
      out.write("                                    </div>\n");
      out.write("                                    <div align=\"right\" style=\"font-size: 10dp;\">\n");
      out.write("                                        <a href=\"index.html\" >return to home</a>    \n");
      out.write("                                    </div>\n");
      out.write("\n");
      out.write("\n");
      out.write("                                </div>\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <!-- Concatenated js plugins and jQuery -->\n");
      out.write("        <script src=\"../Assets/Templates/friendskit/assets/js/app.js\"></script>\n");
      out.write("\n");
      out.write("        <!-- Core js -->\n");
      out.write("        <script src=\"../Assets/Templates/friendskit/assets/data/tipuedrop_content.js\"></script>\n");
      out.write("        <script src=\"../Assets/Templates/friendskit/assets/js/global.js\"></script>\n");
      out.write("        <script src=\"../Assets/Templates/friendskit/assets/js/main.js\"></script>\n");
      out.write("\n");
      out.write("        <!-- Page and UI related js -->\n");
      out.write("        <script src=\"../Assets/Templates/friendskit/assets/js/signup.js\"></script>\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
