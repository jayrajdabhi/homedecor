<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="GroupProject2_Finalproject.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="gvProducts" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ProductId" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="ProductId" HeaderText="ProductId" ReadOnly="True" SortExpression="ProductId" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="CategoryID" HeaderText="CategoryID" SortExpression="CategoryID" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM Products WHERE (ProductId = @ProductId)" InsertCommand="INSERT INTO Products(ProductId, Name, Description, Price, CategoryID, Quantity) VALUES (@ProductId, @Name, @Description, @Price, @CategoryID, @Quantity)" SelectCommand="SELECT ProductId, Name, Description, Price, CategoryID, Quantity FROM Products" UpdateCommand="UPDATE Products
SET Name = @Name, Description = @Description, Price = @Price, CategoryID = @CategoryID,
    Quantity = @Quantity WHERE ProductID = @ProductID;
">
        <DeleteParameters>
            <asp:Parameter Name="ProductId" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductId" />
            <asp:Parameter Name="Name" />
            <asp:Parameter Name="Description" />
            <asp:Parameter Name="Price" />
            <asp:Parameter Name="CategoryID" />
            <asp:Parameter Name="Quantity" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" />
            <asp:Parameter Name="Description" />
            <asp:Parameter Name="Price" />
            <asp:Parameter Name="CategoryID" />
            <asp:Parameter Name="Quantity" />
            <asp:Parameter Name="ProductID" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
