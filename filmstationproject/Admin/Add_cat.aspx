<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Add_cat.aspx.cs" Inherits="Admin_Add_cat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="row">

        <div class="col-xs-4">
            <label class="form-group"> Name</label>
            <asp:TextBox CssClass="form-control" placeholder="Category name" ID="cat_name" runat="server"></asp:TextBox>
        </div>
        
        </div>
        <div class="row"><br /> </div>
        <div class="row"> 
        <div class="col-xs-4">
            <label class="form-group"> Details</label>
            <asp:TextBox ID="cat_details" runat="server" CssClass="form-control" placeholder="Category details"></asp:TextBox><br />
        </div>

        </div>
                <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" CssClass="btn btn-success" />

    </div>
</asp:Content>

