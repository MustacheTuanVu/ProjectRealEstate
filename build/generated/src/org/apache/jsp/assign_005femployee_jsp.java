package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class assign_005femployee_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>CalendarView — JavaScript Calendar Widget</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://code.jquery.com/jquery-3.2.1.min.js\"></script>\n");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"calendarview.css\">\n");
      out.write("        <style>\n");
      out.write("            body {\n");
      out.write("                font-family: Trebuchet MS;\n");
      out.write("            }\n");
      out.write("            div.calendar {\n");
      out.write("                max-width: 240px;\n");
      out.write("                margin-left: auto;\n");
      out.write("                margin-right: auto;\n");
      out.write("            }\n");
      out.write("            div.calendar table {\n");
      out.write("                width: 100%;\n");
      out.write("            }\n");
      out.write("            div.dateField {\n");
      out.write("                width: 140px;\n");
      out.write("                padding: 6px;\n");
      out.write("                -webkit-border-radius: 6px;\n");
      out.write("                -moz-border-radius: 6px;\n");
      out.write("                color: #555;\n");
      out.write("                background-color: white;\n");
      out.write("                margin-left: auto;\n");
      out.write("                margin-right: auto;\n");
      out.write("                text-align: center;\n");
      out.write("            }\n");
      out.write("            div#popupDateField:hover {\n");
      out.write("                background-color: #cde;\n");
      out.write("                cursor: pointer;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        <script src=\"prototype.js\"></script>\n");
      out.write("        <script src=\"calendarview.js\"></script>\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("            function setupCalendars() {\n");
      out.write("                // Embedded Calendar\n");
      out.write("                Calendar.setup(\n");
      out.write("                        {\n");
      out.write("                            dateField: 'embeddedDateField',\n");
      out.write("                            parentElement: 'embeddedCalendar'\n");
      out.write("                        }\n");
      out.write("                )\n");
      out.write("\n");
      out.write("                // Popup Calendar\n");
      out.write("                Calendar.setup(\n");
      out.write("                        {\n");
      out.write("                            dateField: 'popupDateField',\n");
      out.write("                            triggerElement: 'popupDateField'\n");
      out.write("                        }\n");
      out.write("                )\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            Event.observe(window, 'load', function () {\n");
      out.write("                setupCalendars()\n");
      out.write("            })\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div style=\"float: left; width: 50%\">\n");
      out.write("            <div style=\"height: 400px; background-color: #efefef; padding: 10px; -webkit-border-radius: 12px; -moz-border-radius: 12px; margin-right: 10px\">\n");
      out.write("                <h3 style=\"text-align: center; background-color: white; -webkit-border-radius: 10px; -moz-border-radius: 10px; margin-top: 0px; margin-bottom: 20px; padding: 8px\">\n");
      out.write("                    Embedded Calendar\n");
      out.write("                </h3>\n");
      out.write("\n");
      out.write("                <div id=\"embeddedExample\" style=\"\">\n");
      out.write("                    <div id=\"embeddedCalendar\" style=\"margin-left: auto; margin-right: auto\" >\n");
      out.write("                    </div>\n");
      out.write("                    <br />\n");
      out.write("                    <div id=\"embeddedDateField\" class=\"dateField\"  onchange=\"setDate()\">\n");
      out.write("\n");
      out.write("                        Select Date\n");
      out.write("                    </div>\n");
      out.write("                    <p  id=\"txtHint\" ></p>\n");
      out.write("                    <br />\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        <div style=\"float: right; width: 50%\">\n");
      out.write("            <div style=\"height: 400px; background-color: #efefef; padding: 10px; -webkit-border-radius: 12px; -moz-border-radius: 12px; margin-left: 10px\">\n");
      out.write("                <h3 style=\"text-align: center; background-color: white; -webkit-border-radius: 10px; -moz-border-radius: 10px; margin-top: 0px; margin-bottom: 20px; padding: 8px\">\n");
      out.write("                    Popup Calendar\n");
      out.write("                </h3>\n");
      out.write("                <div id=\"popupExample\">\n");
      out.write("                    <div id=\"popupDateField\" class=\"dateField\" style=\"margin-top: 160px\">\n");
      out.write("                        Show Calendar\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <script>\n");
      out.write("            function setDate() {\n");
      out.write("                var a = document.getElementById('embeddedDateField').innerHTML;\n");
      out.write("                var xhttp = new XMLHttpRequest();\n");
      out.write("                xhttp.onreadystatechange = function () {\n");
      out.write("                    if (this.readyState == 4 && this.status == 200) {\n");
      out.write("                        document.getElementById(\"txtHint\").innerHTML = this.responseText;\n");
      out.write("                       // myFunction(this);\n");
      out.write("                    }\n");
      out.write("                };\n");
      out.write("                xhttp.open(\"GET\", \"fetch.jsp?d=\" + a, true);\n");
      out.write("                xhttp.send();\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            // create table with xml\n");
      out.write("//            function myFunction(xml) {\n");
      out.write("//                var i;\n");
      out.write("//                var xmlDoc = xml.responseXML;\n");
      out.write("//                var table = \"<tr><th>Artist</th><th>Title</th></tr>\";\n");
      out.write("//                var x = xmlDoc.getElementsByTagName(\"assign\");\n");
      out.write("//                for (i = 0; i < x.length; i++) {\n");
      out.write("//                    table += \"<tr><td>\" +\n");
      out.write("//                            x[i].getElementsByTagName(\"firstname\")[0].childNodes[0].nodeValue +\n");
      out.write("//                            \"</td></tr>\";\n");
      out.write("//                }\n");
      out.write("//                document.getElementById(\"txtHint\").innerHTML = table;\n");
      out.write("//            }\n");
      out.write("\n");
      out.write("        </script>\n");
      out.write("\n");
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
