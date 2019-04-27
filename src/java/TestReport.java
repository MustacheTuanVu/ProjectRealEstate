
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Cuong
 */
public class TestReport {

    public static void main(String[] args) {
        try {
            JasperReport jasperReport = JasperCompileManager.compileReport("D:/Test GlassFish/ProjectRealEstate/web/page/report/file_report/reportContract.jrxml");

            Map<String, Object> parameters = new HashMap<String, Object>();

        // DataSource
            // Đây là báo cáo đơn giản, không kết nối vào DB
            // vì vậy không cần nguồn dữ liệu.
            JRDataSource dataSource = new JREmptyDataSource();

            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,
                    parameters, dataSource);

            // Đảm bảo thư mục đầu ra tồn tại.
            File outDir = new File("D:/Test GlassFish/ProjectRealEstate/web/page/report/file_report");
            outDir.mkdirs();

            // Chạy báo cáo và export ra file PDF.
            JasperExportManager.exportReportToPdfFile(jasperPrint,
                    "D:/Test GlassFish/ProjectRealEstate/web/page/report/file_report/reportContract.pdf");

            System.out.println("Done!");
        } catch (JRException ex) {
            Logger.getLogger(TestReport.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
