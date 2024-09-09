<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="GroupProject4_Finalproject.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       
.checkout-container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.checkout-container h1,
.checkout-container h3 {
    color: #333;
    font-weight: bold;
    margin-bottom: 20px;
    text-align:center;
}

.checkout-container .form-group {
    margin-bottom: 15px;
    display: flex;
    align-items: center;
}

.checkout-container label {
    font-size: 16px;
    width: 30%;
    font-weight: 600;
    color: #555;
    margin-right: 10px;
}

.checkout-container .form-control {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 14px;
}

.checkout-container .form-group .text-danger {
    margin-top: 5px;
    font-size: 12px;
    color: #e74c3c;
}

.checkout-container .btn {
    width: 100%;
    padding: 12px;
    background-color: #C5705D;
    color: white;
    font-size: 16px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.checkout-container .btn:hover {
    background-color: #ab5a52;
}

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <main class="checkout-container">
        <h1>Check Out Page</h1>
        <h3>Contact Information</h3>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="summary text-danger" HeaderText="Please correct these entries:" />

        <div class="form-group">
            <label>Email Address:</label>
            <asp:TextBox ID="txtEmail1" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail1" runat="server" ErrorMessage="Email is required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtEmail1"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label>Email Re-entry:</label>
            <asp:TextBox ID="txtEmail2" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
            <asp:CompareValidator ID="cvEmail2" runat="server" ControlToValidate="txtEmail2" CssClass="text-danger" ControlToCompare="txtEmail1" Display="Dynamic" ErrorMessage="Email re-entry must match the first email"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="rfvEmail2" runat="server" ErrorMessage="Email is required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtEmail2"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label>First Name:</label>
            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="First name is required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label>Last Name:</label>
            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="Last name is required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtLastName"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label>Phone Number:</label>
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPhoneNumber" runat="server" ErrorMessage="Phone number is required." CssClass="text-danger" Display="Dynamic" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
        </div>

        <h3>Billing Address</h3>
        <div class="form-group">
            <label>Address:</label>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvStreetAddress" runat="server" ErrorMessage="Street Address is required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label>City:</label>
            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="City is required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label>Zip code:</label>
            <asp:TextBox ID="txtZip" runat="server" CssClass="form-control" MaxLength="5"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvZip" runat="server" ErrorMessage="Zip is required" CssClass="text-danger" Display="Dynamic" ControlToValidate="txtZip"></asp:RequiredFieldValidator>
        </div>

        <h3>Optional Data</h3>
        <div class="form-group">
            <label>Please let me know about:</label>
            <asp:CheckBoxList ID="cblAboutList" runat="server" RepeatColumns="2">
                <asp:ListItem Value="New" Selected="True">New products</asp:ListItem>
                <asp:ListItem Value="Special">Special offers</asp:ListItem>
                <asp:ListItem Value="Revisions">New editions</asp:ListItem>
                <asp:ListItem Value="Local">Local events</asp:ListItem>
            </asp:CheckBoxList>
        </div>

        <div class="form-group">
            <label>Please contact me via:</label>
            <asp:RadioButtonList ID="rblContactVia" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Selected="true">Twitter</asp:ListItem>
                <asp:ListItem>Facebook</asp:ListItem>
                <asp:ListItem Value="text">Text message</asp:ListItem>
                <asp:ListItem>Email</asp:ListItem>
            </asp:RadioButtonList>
        </div>

        <div class="form-group">
            <asp:Button ID="btnCheckOut" runat="server" Text="Place Order" CssClass="btn btn-primary" OnClick="btnCheckOut_Click" />
        </div>
    </main>

</asp:Content>
