using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
public partial class Admin_report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      ReportDocument cryRpt = new ReportDocument();
            cryRpt.Load(Server.MapPath("CrystalReport.rpt"));
           CrystalReportViewer1.ReportSource = cryRpt;
            CrystalReportViewer1.RefreshReport();      
    }
}