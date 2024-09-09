<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="GroupProject4_Finalproject.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
     
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f4;
    color: #333;
    margin: 0;
    padding: 20px;
}


h1 {
    font-size: 32px;
    color: saddlebrown;
    text-align: center;
    margin-bottom: 30px;
}


.form-group {
    margin-bottom: 20px;
}


.form-control {
    height: 300px;
    font-size: 16px;
    background-color: #ffffff;
    border: 1px solid #cccccc;
    border-radius: 4px;
    padding: 10px;
    color: #333;
}


.btn {
    display: block;
    width: 100%;
    padding: 10px;
    font-size: 16px;
    color: #fff;
    background-color: #C5705D; 
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin-bottom: 10px;
}

.btn:hover {
    background-color: #a14a41; 
}


.text-info {
    font-size: 18px;
    color: #5bc0de;
    text-align: center;
    margin-bottom: 20px;
}


.row {
    margin-bottom: 20px;
}

.col-sm-6, .col-sm-12 {
    padding-left: 15px;
    padding-right: 15px;
}

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <h1>Your shopping cart</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-6">
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:ListBox ID="lstCart" runat="server" CssClass="form-control"></asp:ListBox>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Button ID="btnRemove" runat="server" Text="Remove Item" OnClick="btnRemove_Click" CssClass="btn" />
                </div>
                <div class="col-sm-12">
                    <asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" OnClick="btnEmpty_Click" CssClass="btn" />
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <div class="form-group">
                <asp:Label ID="lblMessage" runat="server" EnableViewState="False" CssClass="text-info col-sm-12"></asp:Label>
            </div>
            <div class="form-group">
                <div class="col-sm-12">
                    <asp:Button ID="btnContinue" runat="server" PostBackUrl="~/Products.aspx" Text="Continue Shopping" CssClass="btn" OnClick="btnContinue_Click" />
                    <asp:Button ID="btnCheckout" runat="server" Text="Check Out" OnClick="btnCheckout_Click" CssClass="btn" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
