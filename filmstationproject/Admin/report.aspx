<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="report.aspx.cs" Inherits="Admin_report" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
        AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="50px" 
        ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" 
        ToolPanelWidth="200px" Width="350px" />
    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
        <Report FileName="Admin\CrystalReport.rpt">
        </Report>
    </CR:CrystalReportSource>
    </div>
</asp:Content>

