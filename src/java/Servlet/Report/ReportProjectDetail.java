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
public class ReportProjectDetail {
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
            String query = "SELECT        dbo.project.project_name AS [Chung cư], dbo.project.project_address AS [Địa chỉ], dbo.estate.id AS [Mã căn hộ], dbo.estate_status.estate_status_name AS [Tình trạng]\n" +
"FROM            dbo.estate INNER JOIN\n" +
"                         dbo.project_details ON dbo.estate.id = dbo.project_details.estate_id INNER JOIN\n" +
"                         dbo.project ON dbo.project_details.prject_id = dbo.project.project_id INNER JOIN\n" +
"                         dbo.estate_status ON dbo.estate.estate_status_id = dbo.estate_status.id";
            con = getConnection();
            PreparedStatement stm = con.prepareStatement(query);
            ResultSet rs = stm.executeQuery();

            Map<String, Object> params = new HashMap<String, Object>();
            while (rs.next()) {
                String classId = rs.getString("Chung cư");
                String type_name = rs.getString("Địa chỉ");
                String district = rs.getString("Mã căn hộ");
                String id = rs.getString("Tình trạng");
                params.put("estate_name", classId);
                params.put("type_name", type_name);
                params.put("district", district);
                params.put("id", id);
            }
            String source = "D:/abc/ReportProjectSem4/src/ReportPDF/reportprojectdetail.jrxml";
            JasperReport jr = JasperCompileManager.compileReport(source);
            JasperPrint jp = JasperFillManager.fillReport(jr, params, con);
            OutputStream os = new FileOutputStream(targetFolder + "reportprojectdetail.pdf");
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
