package org.apache.jsp.WEB_002dINF.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class edit_005fcustomer_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("    ");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <script src=\"http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js\"></script>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <script type=\"text/javascript\" src=\"");
      out.print(request.getContextPath());
      out.write("/ckfinder/ckfinder.js\"></script>\n");
      out.write("\t<script type=\"text/javascript\">\n");
      out.write("\n");
      out.write("function BrowseServer()\n");
      out.write("{\n");
      out.write("\t// You can use the \"CKFinder\" class to render CKFinder in a page:\n");
      out.write("\tvar finder = new CKFinder();\n");
      out.write("\tfinder.basePath = '../';\t// The path for the installation of CKFinder (default = \"/ckfinder/\").\n");
      out.write("\tfinder.selectActionFunction = SetFileField;\n");
      out.write("\tfinder.popup();\n");
      out.write("}\n");
      out.write("function SetFileField( fileUrl )\n");
      out.write("{\n");
      out.write("\tdocument.getElementById( 'xFilePath' ).value = fileUrl;\n");
      out.write("}\n");
      out.write("\n");
      out.write("\t</script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Add Information Customer:</h1>\n");
      out.write("        \n");
      out.write("        <img alt=\"Image\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${list.customerImg}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" width=\"100\" height=\"100\" id=\"profile-img-tag\" />\n");
      out.write("            <form action=\"Edit_Customer_Servlet\" method=\"POST\"   >\n");
      out.write("            <table>\n");
      out.write("                <tr>\n");
      out.write("                    <td>ID</td>\n");
      out.write("                    <td><input type=\"text\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${list.id}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"txtID\"  ><span id=\"errID\"></span></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Name</td>\n");
      out.write("                    <td><input type=\"text\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${list.customerName}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"txtName\" ><span id=\"errName\"></span></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Address</td>\n");
      out.write("                    <td><input type=\"text\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${list.customerAddress}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"txtAddress\"  ><span id=\"errAddress\"></span></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Indentity Card</td>\n");
      out.write("                    <td><input type=\"text\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${list.customerIndentityCard}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"txtCard\" value=\"card\"><span id=\"errCard\"></span></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Phone</td>\n");
      out.write("                    <td><input type=\"text\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${list.phone}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"txtPhone\"  value=\"phone\"><span id=\"errPhone\"></span></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Mail</td>\n");
      out.write("                    <td><input type=\"text\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${list.mail}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"txtMail\"  value=\"mail\"><span id=\"errMail\"></span></td>\n");
      out.write("                </tr>\n");
      out.write("                \n");
      out.write("                <tr>\n");
      out.write("                    <td>Content</td>\n");
      out.write("                    <td><input type=\"text\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${list.customerContent}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"txtContent\"  value=\"content\"><span id=\"errContent\"></span></td>\n");
      out.write("                </tr> \n");
      out.write("                <tr>\n");
      out.write("                    <td>Image</td>\n");
      out.write("                    <td><input id=\"xFilePath\" type=\"hidden\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${list.customerImg}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"txtImg\"><span id=\"errContent\"></span></td>\n");
      out.write("                    <td><input type=\"button\" value=\"Browse Server\" onclick=\"BrowseServer();\" /></td>\n");
      out.write("                    \n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("            <input type=\"submit\" value=\"Edit\" />\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
