<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ManageOrder.aspx.cs" Inherits="Admin_ManageOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <asp:GridView CssClass="table table-responsive" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="order_id" DataSourceID="SqlDataSource1" AllowSorting="True" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="user_id" HeaderText="user_id" SortExpression="user_id"></asp:BoundField>
                <asp:BoundField DataField="order_id" HeaderText="order_id" ReadOnly="True" SortExpression="order_id"></asp:BoundField>
                <asp:BoundField DataField="order_date" HeaderText="order_date" SortExpression="order_date"></asp:BoundField>
                <asp:BoundField DataField="order_famt" HeaderText="order_famt" SortExpression="order_famt"></asp:BoundField>
                <asp:BoundField DataField="order_shipping_address" HeaderText="order_shipping_address" SortExpression="order_shipping_address"></asp:BoundField>
                <asp:BoundField DataField="order_shipping_date" HeaderText="order_shipping_date" SortExpression="order_shipping_date"></asp:BoundField>
            </Columns>
        </asp:GridView>


        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:FilmStationConnectionString %>' DeleteCommand="DELETE FROM [order] WHERE [order_id] = @order_id" InsertCommand="INSERT INTO [order] ([user_id], [order_id], [order_date], [order_famt], [order_shipping_address], [order_shipping_date]) VALUES (@user_id, @order_id, @order_date, @order_famt, @order_shipping_address, @order_shipping_date)" SelectCommand="SELECT * FROM [order]" UpdateCommand="UPDATE [order] SET [user_id] = @user_id, [order_date] = @order_date, [order_famt] = @order_famt, [order_shipping_address] = @order_shipping_address, [order_shipping_date] = @order_shipping_date WHERE [order_id] = @order_id">
            <DeleteParameters>
                <asp:Parameter Name="order_id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="user_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="order_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="order_date" Type="String"></asp:Parameter>
                <asp:Parameter Name="order_famt" Type="String"></asp:Parameter>
                <asp:Parameter Name="order_shipping_address" Type="String"></asp:Parameter>
                <asp:Parameter Name="order_shipping_date" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="user_id" Type="Int32"></asp:Parameter>
                <asp:Parameter Name="order_date" Type="String"></asp:Parameter>
                <asp:Parameter Name="order_famt" Type="String"></asp:Parameter>
                <asp:Parameter Name="order_shipping_address" Type="String"></asp:Parameter>
                <asp:Parameter Name="order_shipping_date" Type="String"></asp:Parameter>
                <asp:Parameter Name="order_id" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>

