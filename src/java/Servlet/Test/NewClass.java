/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Test;

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
 * @author Tuan
 */
public class NewClass {

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
        String targetFolder = "D:/abc/";
        Connection con = null;
        try {
            String query = "SELECT * FROM estate";
            con = getConnection();
            PreparedStatement stm = con.prepareStatement(query);
            ResultSet rs = stm.executeQuery();

            Map<String, Object> params = new HashMap<String, Object>();
            while (rs.next()) {
                String classId = rs.getString("estate_name");
                String className = rs.getString("price");
                params.put("estate_name", classId);
                params.put("price", className);
            }
            String source = "D:/abc/ProjectRealEstate/src/java/Servlet/Test/report2.jrxml";
            JasperReport jr = JasperCompileManager.compileReport(source);
            JasperPrint jp = JasperFillManager.fillReport(jr, params, con);
            OutputStream os = new FileOutputStream(targetFolder + "STUDENT_MARK_.pdf");
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

    public static void exportStudentMarkToPdf(String classId, String className, String targetFolder) {
        Connection con = null;
        try {
            String source = "D:/abc/ProjectRealEstate/src/java/Servlet/Test/report2.jrxml";
            JasperReport jr = JasperCompileManager.compileReport(source);

            Map<String, Object> params = new HashMap<String, Object>();
            params.put("estate_name", classId);
            params.put("price", className);

            con = getConnection();
            JasperPrint jp = JasperFillManager.fillReport(jr, params, con);
            OutputStream os = new FileOutputStream(targetFolder + "STUDENT_MARK_" + classId + ".pdf");
            JasperExportManager.exportReportToPdfStream(jp, os);

            os.flush();
            os.close();
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
