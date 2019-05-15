/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet.Report;

import java.io.File;

/**
 *
 * @author kiems
 */
public class ReportProjectSem4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
//         ReportEstateTypePDF.runReport();
//         String file = "D:/abc/ReportProjectSem4/src/ReportPDF/reportestatetype.pdf";

//         ReportProjectMoney.runReport();
//         String file = "D:/abc/ReportProjectSem4/src/ReportPDF/reportprojectmoney.pdf";
         
//         ReportProjectDetail.runReport();
//         String file = "D:/abc/ReportProjectSem4/src/ReportPDF/reportprojectdetail.pdf";
         
         ReportEmployee.runReport();
         String file = "D:/abc/ReportProjectSem4/src/ReportPDF/reportemployee.pdf";
        
        try {
            if ((new File(file)).exists()) {
                Process p = Runtime
                        .getRuntime()
                        .exec("rundll32 url.dll,FileProtocolHandler "+file);
                p.waitFor();
            } else {
                System.out.println("File does not exist");

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}
