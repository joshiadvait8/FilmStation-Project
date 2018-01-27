<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="prepay.aspx.cs" Inherits="prepay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
       <%-- <h2>
            Make Your Payment</h2>
        </br>
        <h4>
            Please Verify User Detail</h4>
        </br>--%>
        <table>
        <tr>
         <td>
         <h2>
        
            Make Your Payment</h2></td>
        </tr>
        <tr>
        <td>
        <h4>
            Please Verify User Detail</h4></td></tr>
        
        
            <tr>
                <td><asp:Label ID="lblid" runat="server" Text="Order ID:"/>
                </td>
                <td><asp:TextBox ID="txtid" runat="server"/></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblcid" runat="server" Text="Customer ID:"/>
                </td>
                <td><asp:TextBox ID="txtcid" runat="server"/></td>
            </tr>
            <tr>
                <td>-<asp:Label ID="lblamount" runat="server" Text="Amount"/>
                </td>
                <td><asp:TextBox ID="txtamount" runat="server" /></td>
            </tr>
             <tr>
                <td>-<asp:Label ID="lbladd" runat="server" Text="Shipping Address"/>
                </td>
                <td><asp:TextBox ID="txtadd" runat="server" /></td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Shipping address required" Display="Dynamic" ControlToValidate="txtadd"></asp:RequiredFieldValidator>
            </tr>
            <tr>
                <td><asp:Label ID="lblpmode" runat="server" Text="Payment Mode:"/>
                </td>
                <td><asp:RadioButton GroupName="CR_Bank" ID="cc" runat="server" Text="Credit Card" 
                        oncheckedchanged="cc_CheckedChanged" AutoPostBack="True"  />
                    <asp:RadioButton GroupName="CR_Bank" ID="dc" runat="server" Text="Debit Card" AutoPostBack="True" 
                        oncheckedchanged="dc_CheckedChanged" />
                    
                </td>
            </tr>

            <tr>
            <td colspan="2" align="center">
                <asp:PlaceHolder ID="creditcard" runat="server" Visible="False">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatLayout="Table" RepeatDirection="Vertical" Visible="True">
                    <asp:ListItem Text="AmericanExpress" Value="1"></asp:ListItem>
                    <asp:ListItem Text="Master" Value="2"></asp:ListItem>
                    <asp:ListItem Text="Visa" Value="3"></asp:ListItem>
                    </asp:RadioButtonList>
      
                        
                </asp:PlaceHolder>


                <asp:PlaceHolder ID="PlaceHolder1" runat="server" Visible="False">
                    <asp:RadioButtonList ID="RadioButtonList2" runat="server" RepeatLayout="Table" RepeatDirection="Vertical">
                    <asp:ListItem Text="Yes Bank" Value="1"></asp:ListItem>
                    <asp:ListItem Text="IDBI Bank " Value="2"></asp:ListItem>
                    <asp:ListItem Text="SBI" Value="3"></asp:ListItem>
                    </asp:RadioButtonList>
                        
                        
                </asp:PlaceHolder>
            </td>
            </tr>

            <tr>
            <td colspan="2" align="center"><asp:Button Text="Submit" runat="server" 
                    ID="btnsubmit" onclick="btnsubmit_Click"/>
                <br />
                <img alt="credit card " src="Images/credit-cards.jpg" 
                    style="width: 311px; height: 72px" /></td>
            </tr>
            </table>
                    <center>
                </center>
    </div>

</asp:Content>

