<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeBehind="ProductDetails.aspx.cs" Inherits="GroupProject2_Finalproject.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Page-specific head content goes here -->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
            <h2>Product Details</h2>
            <div>
                <asp:Image ID="imgProductImage" runat="server" Height="200px" />
            </div>
            <div>
                <asp:Label ID="lblProductName" runat="server" Text=""></asp:Label>
            </div>
            <div>
                <asp:Label ID="lblDescription" runat="server" Text=""></asp:Label>
            </div>
            <div>
                <asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>
            </div>
            <div>
                <asp:Label ID="lblQuantity" runat="server" Text=""></asp:Label>
            </div>
            <!-- Add more labels for other product details if needed -->
        </div>
    


    </asp:Content>