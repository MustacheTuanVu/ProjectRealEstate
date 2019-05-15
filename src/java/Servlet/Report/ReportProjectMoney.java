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
public class ReportProjectMoney {
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
            String query = "SELECT        dbo.project.project_name AS [Chung cư], dbo.project.project_address AS [Địa chỉ],\n" +
"                             (SELECT        COUNT(estate_id) AS Expr1\n" +
"                               FROM            dbo.project_details) AS [Tổng số lượng], COUNT(dbo.estate.id) AS [Đã bán],\n" +
"                             (SELECT        COUNT(estate_id) AS Expr1\n" +
"                               FROM            dbo.project_details AS project_details_2) - COUNT(dbo.estate.id) AS [Chưa bán], SUM(dbo.contract.payment_amount) AS [Doanh thu]\n" +
"FROM            dbo.contract INNER JOIN\n" +
"                         dbo.contract_details ON dbo.contract.id = dbo.contract_details.contract_id INNER JOIN\n" +
"                         dbo.estate ON dbo.contract_details.estate_id = dbo.estate.id INNER JOIN\n" +
"                         dbo.project_details AS project_details_1 ON dbo.estate.id = project_details_1.estate_id INNER JOIN\n" +
"                         dbo.project ON project_details_1.prject_id = dbo.project.project_id\n" +
"WHERE        (dbo.contract.status = 'done')  \n" +
"GROUP BY dbo.project.project_name, dbo.project.project_address";
            con = getConnection();
            PreparedStatement stm = con.prepareStatement(query);
            ResultSet rs = stm.executeQuery();

            Map<String, Object> params = new HashMap<String, Object>();
            while (rs.next()) {
                String classId = rs.getString("Chung cư");
                String type_name = rs.getString("Địa chỉ");
                String district = rs.getString("Tổng số lượng");
                String id = rs.getString("Đã bán");
                String payment_amount = rs.getString("Chưa bán");
                params.put("estate_name", classId);
                params.put("type_name", type_name);
                params.put("district", district);
                params.put("id", id);
                params.put("payment_amount", payment_amount);
            }
            String source = "D:/abc/ReportProjectSem4/src/ReportPDF/reportprojectmoney.jrxml";
            JasperReport jr = JasperCompileManager.compileReport(source);
            JasperPrint jp = JasperFillManager.fillReport(jr, params, con);
            OutputStream os = new FileOutputStream(targetFolder + "reportprojectmoney.pdf");
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
