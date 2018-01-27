<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Details" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <title></title>
</head>
<body style="background-color:Black">
    <form id="form1" runat="server">
    <div>
    <div class=container>
        <asp:GridView CssClass="table table-responsive" ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
            GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="status" HeaderText="status" 
                    SortExpression="status" />
                <asp:BoundField DataField="amount" HeaderText="amount" 
                    SortExpression="amount" />
             
                <asp:BoundField DataField="p_name" HeaderText="p_name" 
                    SortExpression="p_name" />
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:FilmStationConnectionString %>" 
            SelectCommand="SELECT [status], [amount], [p_image], [p_name] FROM [your] WHERE ([p_id] = @p_id) AND ([user_id] = @user_id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="p_id" QueryStringField="p_id" Type="String" />
                 <asp:SessionParameter SessionField="uid" Name="user_id" Type="String"></asp:SessionParameter>
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
    </div>
    </form>
</body>
</html>
