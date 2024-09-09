<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="GroupProject4_Finalproject.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-details-container">
        <h2>Product Details</h2>

        <div>
            <asp:Image ID="imgProductImage" runat="server" Height="200px" Width="200px" />
        </div>

        <div class="product-detail">
            <h3><asp:Label ID="lblProductName" runat="server" Text=""></asp:Label></h3>
        </div>

        <div class="product-detail">
            <asp:Label ID="lblDescription" runat="server" Text=""></asp:Label>
        </div>

        <div class="product-detail">
            <asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>
        </div>

        <div class="product-detail">
            <asp:Label ID="lblQuantity" runat="server" Text=""></asp:Label>
        </div>

        <div>
            <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="false"></asp:Label>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <label class="col-sm-2">Buy Items:</label>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtBuy" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-8">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBuy" CssClass="text-danger" Display="Dynamic" ErrorMessage="Quantity is a required field."></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtBuy" CssClass="text-danger" Display="Dynamic" ErrorMessage="Quantity must range from 1 to 500." MaximumValue="500" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-12">
                <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="btn btn-primary" OnClick="btnAddToCart_Click" />
                <asp:Button ID="btnCheckout" runat="server" Text="Checkout" CssClass="btn btn-success" OnClick="btnCheckout_Click" />
            </div>
        </div>
    </div>
</asp:Content>
