<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="editproduct.aspx.cs" Inherits="editproduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <asp:GridView CssClass="table table-responsive" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="p_id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
                <asp:BoundField DataField="p_id" HeaderText="p_id" ReadOnly="True" SortExpression="p_id"></asp:BoundField>
                <asp:BoundField DataField="p_name" HeaderText="p_name" SortExpression="p_name"></asp:BoundField>
                <asp:BoundField DataField="p_description" HeaderText="p_description" SortExpression="p_description"></asp:BoundField>
                <asp:BoundField DataField="p_price" HeaderText="p_price" SortExpression="p_price"></asp:BoundField>

                <asp:BoundField DataField="cat_id" HeaderText="cat_id" SortExpression="cat_id"></asp:BoundField>
                <asp:BoundField DataField="p_brand" HeaderText="p_brand" SortExpression="p_brand"></asp:BoundField>
                <asp:BoundField DataField="p_image" HeaderText="p_image" SortExpression="p_image"></asp:BoundField>
            </Columns>
        </asp:GridView>

    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:FilmStationConnectionString %>' DeleteCommand="DELETE FROM [product] WHERE [p_id] = @p_id" InsertCommand="INSERT INTO [product] ([p_id], [p_name], [p_description], [p_price], [cat_id], [p_brand], [p_image]) VALUES (@p_id, @p_name, @p_description, @p_price, @cat_id, @p_brand, @p_image)" SelectCommand="SELECT * FROM [product] ORDER BY [p_id]" UpdateCommand="UPDATE [product] SET [p_name] = @p_name, [p_description] = @p_description, [p_price] = @p_price, [p_quantity] = @p_quantity, [cat_id] = @cat_id, [p_brand] = @p_brand, [p_image] = @p_image WHERE [p_id] = @p_id">
        <DeleteParameters>
            <asp:Parameter Name="p_id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="p_id" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="p_name" Type="String"></asp:Parameter>
            <asp:Parameter Name="p_description" Type="String"></asp:Parameter>
            <asp:Parameter Name="p_price" Type="Decimal"></asp:Parameter>
            
            <asp:Parameter Name="cat_id" Type="String"></asp:Parameter>
            <asp:Parameter Name="p_brand" Type="String"></asp:Parameter>
            <asp:Parameter Name="p_image" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="p_name" Type="String"></asp:Parameter>
            <asp:Parameter Name="p_description" Type="String"></asp:Parameter>
            <asp:Parameter Name="p_price" Type="Decimal"></asp:Parameter>
           
            <asp:Parameter Name="cat_id" Type="String"></asp:Parameter>
            <asp:Parameter Name="p_brand" Type="String"></asp:Parameter>
            <asp:Parameter Name="p_image" Type="String"></asp:Parameter>
            <asp:Parameter Name="p_id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
        </div>
</asp:Content>

