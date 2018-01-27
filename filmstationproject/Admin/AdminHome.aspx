<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="Admin_AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class="container">
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="order_id" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id"></asp:BoundField>
            <asp:BoundField DataField="order_id" HeaderText="order_id" ReadOnly="True" SortExpression="order_id"></asp:BoundField>
           
            <asp:BoundField DataField="order_date" HeaderText="order_date" SortExpression="order_date"></asp:BoundField>
            <asp:BoundField DataField="order_famt" HeaderText="order_famt" SortExpression="order_famt"></asp:BoundField>

            <asp:BoundField DataField="order_shipping_address" HeaderText="order_shipping_address" SortExpression="order_shipping_address"></asp:BoundField>
            <asp:BoundField DataField="order_shipping_date" HeaderText="order_shipping_date" SortExpression="order_shipping_date"></asp:BoundField>
            <asp:BoundField DataField="user_email" HeaderText="user_email" SortExpression="user_email"></asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC"></FooterStyle>

        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="#999999" ForeColor="Black"></PagerStyle>

        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#F1F1F1"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#808080"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#CAC9C9"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#383838"></SortedDescendingHeaderStyle>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:FilmStationConnectionString %>' SelectCommand="SELECT [order].user_id, [order].order_id, [order].order_date, [order].order_famt, [order].order_shipping_address, [order].order_shipping_date, user_master.user_email FROM [order] INNER JOIN user_master ON [order].user_id = user_master.user_id"></asp:SqlDataSource>
      <br />
      <br />
      
    
  </div>
</asp:Content>

