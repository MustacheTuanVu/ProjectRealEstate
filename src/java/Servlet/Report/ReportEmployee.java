/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Report;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

/**
 *
 * @author kiems
 */
public class ReportEmployee {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=RealEstate", "sa", "123456");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    public static void runReport() {
        String targetFolder = "D:/abc/ReportProjectSem4/src/ReportPDF/";
        Connection con = null;
        try {
            String query = "SELECT        TOP (100) PERCENT dbo.employee.employee_name, COUNT(dbo.contract.id) AS [Số lượng giao dịch], SUM(dbo.contract.payment_amount) AS [Doanh thu]\n" +
"FROM            dbo.contract INNER JOIN\n" +
"                         dbo.employee ON dbo.contract.employee_id = dbo.employee.id\n" +
"GROUP BY dbo.employee.employee_name\n" +
"ORDER BY [Doanh thu] DESC";
            con = getConnection();
            PreparedStatement stm = con.prepareStatement(query);
            ResultSet rs = stm.executeQuery();

            Map<String, Object> params = new HashMap<String, Object>();
            while (rs.next()) {
                String classId = rs.getString("employee_name");
                String type_name = rs.getString("Số lượng giao dịch");
                String district = rs.getString("Doanh thu");
                params.put("estate_name", classId);
                params.put("type_name", type_name);
                params.put("district", district);
            }
            String source = "D:/abc/ReportProjectSem4/src/ReportPDF/reportemployee.jrxml";
            JasperReport jr = JasperCompileManager.compileReport(source);
            JasperPrint jp = JasperFillManager.fillReport(jr, params, con);
            OutputStream os = new FileOutputStream(targetFolder + "reportemployee.pdf");
            JasperExportManager.exportReportToPdfStream(jp, os);
            
            os.flush();
            os.close();
            rs.close();
            stm.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null && !con.isClosed()) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
