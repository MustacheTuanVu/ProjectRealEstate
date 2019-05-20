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
import javax.servlet.ServletOutputStream;

/**
 *
 * @author kiems
 */
public class ReportEstateTypePDF {
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
            String query = "SELECT        dbo.estate_status.estate_status_name AS [Tình Trạng], dbo.estate_type.type_name AS [Danh mục], dbo.estate.district AS Quận, COUNT(dbo.estate.id) AS [Số lượng], SUM(dbo.contract.payment_amount) AS [Doanh thu]\n" +
"FROM            dbo.contract INNER JOIN\n" +
"                         dbo.contract_details ON dbo.contract.id = dbo.contract_details.contract_id INNER JOIN\n" +
"                         dbo.estate ON dbo.contract_details.estate_id = dbo.estate.id INNER JOIN\n" +
"                         dbo.estate_type ON dbo.estate.estate_type_id = dbo.estate_type.id INNER JOIN\n" +
"                         dbo.estate_status ON dbo.estate.estate_status_id = dbo.estate_status.id\n" +
"WHERE        (dbo.contract.status = 'done')\n" +
"GROUP BY dbo.estate_type.type_name, dbo.estate.district, dbo.estate_status.estate_status_name";
            con = getConnection();
            PreparedStatement stm = con.prepareStatement(query);
            ResultSet rs = stm.executeQuery();

            Map<String, Object> params = new HashMap<String, Object>();
            while (rs.next()) {
                String classId = rs.getString("Tình Trạng");
                String type_name = rs.getString("Danh mục");
                String district = rs.getString("Quận");
                String id = rs.getString("Số lượng");
                String payment_amount = rs.getString("Doanh thu");
                params.put("estate_name", classId);
                params.put("type_name", type_name);
                params.put("district", district);
                params.put("id", id);
                params.put("payment_amount", payment_amount);
            }
            String source = "D:/abc/ReportProjectSem4/src/ReportPDF/reportestatetype1.jrxml";
            JasperReport jr = JasperCompileManager.compileReport(source);
            JasperPrint jp = JasperFillManager.fillReport(jr, params, con);
            OutputStream os = new FileOutputStream(targetFolder + "reportestatetype.pdf");
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
