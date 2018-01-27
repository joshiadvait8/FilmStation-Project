<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="yourorders.aspx.cs" Inherits="yourorders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div class="container">
    <asp:GridView CssClass="table table-responsive" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="p_name" HeaderText=" Name " SortExpression="p_name"></asp:BoundField>
            <asp:TemplateField>
                <HeaderTemplate>
                    Product
                </HeaderTemplate>
                <ItemTemplate>
                    <img width="60px" height="60px" src="imagess/<%#Eval("p_image") %>">
                </ItemTemplate>
               
            </asp:TemplateField>
            <asp:BoundField DataField="amount" HeaderText=" Amount " SortExpression="amount"></asp:BoundField>

            <asp:HyperLinkField HeaderText="Track" DataNavigateUrlFields="p_id" DataNavigateUrlFormatString="Details.aspx?p_id={0}"
                 Text="Track"/>

        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Right" BackColor="White" ForeColor="Black"></PagerStyle>

        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
    </asp:GridView>
       </center>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:FilmStationConnectionString %>' SelectCommand="SELECT [p_name], [amount], [p_image],[p_id] FROM [your] WHERE ([user_id] = @user_id)">
        <SelectParameters>
            <asp:SessionParameter SessionField="uid" Name="user_id" Type="String"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
       </div>
</asp:Content>

