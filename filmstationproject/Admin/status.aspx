<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="status.aspx.cs" Inherits="Admin_status" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <div class=container>
    <asp:GridView CssClass="table table-responsive" ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="yourid" 
        DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="yourid" HeaderText="yourid" InsertVisible="False" 
                ReadOnly="True" SortExpression="yourid" />
            <asp:BoundField DataField="user_id" HeaderText="user_id" 
                SortExpression="user_id" />
            <asp:BoundField DataField="p_name" HeaderText="p_name" 
                SortExpression="p_name" />
            <asp:BoundField DataField="p_image" HeaderText="p_image" 
                SortExpression="p_image" />
            <asp:BoundField DataField="amount" HeaderText="amount" 
                SortExpression="amount" />
            <asp:BoundField DataField="p_id" HeaderText="p_id" SortExpression="p_id" />
            <asp:BoundField DataField="status" HeaderText="status" 
                SortExpression="status" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FilmStationConnectionString %>" 
        DeleteCommand="DELETE FROM [your] WHERE [yourid] = @yourid" 
        InsertCommand="INSERT INTO [your] ([user_id], [p_name], [p_image], [amount], [p_id], [status]) VALUES (@user_id, @p_name, @p_image, @amount, @p_id, @status)" 
        SelectCommand="SELECT * FROM [your]" 
        UpdateCommand="UPDATE [your] SET [user_id] = @user_id, [p_name] = @p_name, [p_image] = @p_image, [amount] = @amount, [p_id] = @p_id, [status] = @status WHERE [yourid] = @yourid">
        <DeleteParameters>
            <asp:Parameter Name="yourid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="user_id" Type="Int32" />
            <asp:Parameter Name="p_name" Type="String" />
            <asp:Parameter Name="p_image" Type="String" />
            <asp:Parameter Name="amount" Type="String" />
            <asp:Parameter Name="p_id" Type="String" />
            <asp:Parameter Name="status" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="user_id" Type="Int32" />
            <asp:Parameter Name="p_name" Type="String" />
            <asp:Parameter Name="p_image" Type="String" />
            <asp:Parameter Name="amount" Type="String" />
            <asp:Parameter Name="p_id" Type="String" />
            <asp:Parameter Name="status" Type="String" />
            <asp:Parameter Name="yourid" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </div>
</asp:Content>

