<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="View_Cart.aspx.cs" Inherits="View_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        
.img-cart {
    display: block;
    max-width: 50px;
    height: auto;
    margin-left: auto;
    margin-right: auto;
}
table tr td{
    border:1px solid #FFFFFF;    
}

table tr th {
    background:#eee;    
}

.panel-shadow {
    box-shadow: rgba(0, 0, 0, 0.3) 7px 7px 7px;
}

        .panel-body {
       color:black;
             }
    </style>

    
    <link href="css/font-awesome.css" rel="stylesheet" />
 
    
    <div class="container">
    <asp:GridView CssClass="table table-responsive" ID="GridView1" runat="server" AllowPaging="True"
        AutoGenerateColumns="False" CellPadding="10" DataSourceID="SqlDataSource1"
        ForeColor="White" BackColor="Black">
        <AlternatingRowStyle BackColor="Black"></AlternatingRowStyle>
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:Label ID="Label1" Text="product_id" Visible="false" runat="server" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:TextBox runat="server" ID="pidu" Text='<%#Eval("p_id") %>' Visible="false" />
                </ItemTemplate>
            </asp:TemplateField>

           <asp:BoundField Visible="false" DataField="p_name" HeaderText="Name"
                SortExpression="p_name" />
             
            
            <asp:TemplateField>
                <HeaderTemplate>
                    Product
                </HeaderTemplate>
                <ItemTemplate>
                    <img class="img-cart" src="imagess/<%#Eval("p_image") %>">
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField>
                <HeaderTemplate>
                    Quantity
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:TextBox runat="server" ID="quanty" Text='<%#Eval("p_quantity") %>' MaxLength="2" />
                </ItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField>
                <HeaderTemplate>
                    price
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" ID="proprice" Text='<%#Eval("p_price") %>' />
                </ItemTemplate>
            </asp:TemplateField>

             <asp:TemplateField>
                <HeaderTemplate>
                    Amount
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" ID="amtprice" Text='<%#Eval("amount") %>' />
                </ItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField>
                <HeaderTemplate>
                    perform actions
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox runat="server" ID="chb" />
                </ItemTemplate>
            </asp:TemplateField>
            
        </Columns>

        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="Black" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />

        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:FilmStationConnectionString%>" 
       UpdateCommand="UPDATE cart SET [amount]=[p_quantity]*[p_price]"
        SelectCommand="SELECT [p_id],[p_name], [p_quantity], [p_price], [amount],[p_image] FROM [cart] WHERE ([user_id] = @user_id)">
        <SelectParameters>
            <asp:SessionParameter Name="user_id" SessionField="uid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button CssClass="btn btn-success" Text="Payment" ID="Payment" runat="server" onclick="update_Click" />
    <asp:Button CssClass="btn btn-danger"  Text="Remove" ID="Remove" runat="server" onclick="remove_Click" />
       
   <center> <asp:Label Text="Please check the checkbox before placing order." ID="lbl_total" runat="server"/></center>
        </div>
   <center><asp:Label ID="Label2" runat="server" Text=""></asp:Label></center> 
</asp:Content>

