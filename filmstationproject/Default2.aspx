<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
 
    <link href="css/font-awesome.css" rel="stylesheet" />
<script src="//code.jquery.com/jquery-2.2.4.min.js"></script>
   
  
   
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div style="padding-top: 50px">
                <div class="col-md-5">
                    <div>
	
                       <img  style="max-width:512px; max-height:512px; min-width:512px; min-height:512px;"  src="imagess/<%#Eval("p_image") %>" />
                            
                    </div>

	

    

                </div>
                <div class="col-md-7">
                    <div class="divDet1">
                        <h1><%#Eval("p_name") %></h1>
                       
                       <span style="font-size:medium;" class="badge"><%#Eval("p_brand") %></span>

                        <br />
                        <br />
                       <span style="font-size:large; font-family:'Comic Sans MS';font-weight:bolder;"> <i class="fa fa-rupee"></i> <%#Eval("p_price") %></span>

                    </div>
                    <div>
                        
                        
                     
                        <hr />

                    </div>

                    <div class="divDet1">
                        <span style="border-bottom:solid; font-size:medium;">Description</span>
                        <br />
                        <p>
                            <%#Eval("p_description") %>
                          
               
                        </p>
                        <h5 class="h5Size"></h5>
                        <p>
                           
               
                        </p>
                        <h5 class="h5Size"></h5>
                        <p>
                            
               
                        </p>
                    </div>

                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:FilmStationConnectionString %>' SelectCommand="SELECT * FROM [product] WHERE ([p_id] = @p_id)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="id" Name="p_id" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="divDet1">
             
                <asp:Button ID="btnAddToCart" CssClass="btn btn-success btn-lg" runat="server" Text="ADD TO CART" OnClick="btnAddToCart_Click"/>
                <br />
      <asp:Label ID="Label1" BackColor="#ff0000" Font-Bold="true" Font-Size="Medium" runat="server" Text=""></asp:Label>
      
    </div>
    
   
            </div>
       
</asp:Content>

