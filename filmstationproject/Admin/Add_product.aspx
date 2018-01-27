<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Add_product.aspx.cs" Inherits="Admin_Add_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
   <div class="container">
       <div class="row">
       <div class="col-xs-4">
          <label class="form-group">  Product Category :</label>
        
            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="cat_name" 
                DataValueField="cat_name">
            </asp:DropDownList>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server"
               ConnectionString="<%$ ConnectionStrings:FilmStationConnectionString %>"
               SelectCommand="SELECT [cat_name] FROM [category] ORDER BY [cat_id]"></asp:SqlDataSource>
       </div>
           </div>

       <div class="row">
       <div class="col-xs-4">
          <label class="form-group"> Product Name :</label>   
            <asp:TextBox ID="name" runat="server" CssClass="form-control"></asp:TextBox>
        
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="name" ErrorMessage="RequiredFieldValidator" 
                ValidationGroup="a"></asp:RequiredFieldValidator>
       </div>
           </div>

       <div class="row">
       <div class="col-xs-4">
            <label class="form-group"> Product Description :</label>   
            <asp:TextBox ID="desc" runat="server" CssClass="form-control"></asp:TextBox>
        
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="desc" ErrorMessage="RequiredFieldValidator" 
                ValidationGroup="a"></asp:RequiredFieldValidator>
           </div>
           </div>

       <div class="row">
       <div class="col-xs-4">
       
            <label class="form-group"> Product image :</label>   
            <asp:FileUpload ID="FileUpload1" runat="server"  CssClass="form-control"/>
           </div>
           </div>
       
       <div class="row">
       <div class="col-xs-4">
             <label class="form-group"> Product price :</label>   
            <asp:TextBox ID="price" runat="server" CssClass="form-control"></asp:TextBox>

       
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="price" ErrorMessage="RequiredFieldValidator" 
                ValidationGroup="a"></asp:RequiredFieldValidator>
           </div>
           </div>
        
       <div class="row">
       <div class="col-xs-4">
            <label class="form-group"> Product brand :</label>   
            <asp:TextBox ID="brand" runat="server" CssClass="form-control"></asp:TextBox>
        
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="brand" ErrorMessage="RequiredFieldValidator" 
                ValidationGroup="a"></asp:RequiredFieldValidator>
           </div>
           </div>
       
        
       <div class="row">
       <div class="col-xs-4">
            <asp:Label Text="" ID="nofile" runat="server" CssClass="form-group" />
            <asp:Button ID="Button1" runat="server" Text="Add" onclick="Button1_Click" 
                ValidationGroup="a" CssClass="btn btn-success" />
           </div>
           </div>
   </div>     
</asp:Content>

