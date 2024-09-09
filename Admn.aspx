<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admn.aspx.cs" Inherits="GroupProject4_Finalproject.Admn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>

.table-responsive {
    width: 100%;
    margin-bottom: 15px;
    overflow-x: auto;
    overflow-y: hidden;
    border: 1px solid #ddd;
    -webkit-overflow-scrolling: touch;
}

.table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 20px;
    background-color: #fff;
}

.table-bordered {
    border: 1px solid #ddd;
}

.table-hover > tbody > tr:hover {
    background-color: #f5f5f5;
}

.table-condensed > thead > tr > th, 
.table-condensed > tbody > tr > th, 
.table-condensed > tfoot > tr > th, 
.table-condensed > thead > tr > td, 
.table-condensed > tbody > tr > td, 
.table-condensed > tfoot > tr > td {
    padding: 5px;
}

.altRow {
    background-color: #f9f9f9;
}

.warning {
    background-color: #fcf8e3;
}

.table thead th {
    background-color: #4CAF50;
    color: #000000; 
    text-align: left;
    font-weight: bold; 
}

.table tfoot th {
    background-color: #4CAF50;
    color: white;
    text-align: left;
}

.pagerStyle {
    background-color: #4CAF50;
    color: white;
}

.selectedRow {
    background-color: #4CAF50;
    color: white;
    font-weight: bold;
}

.form-control1 {
    width: 100%;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.btn-primary {
    color: #fff;
    background-color:#C5705D;
    border-color: #007bff;
}

.text-danger {
    color: #dc3545;
}

.col-xs-12, .col-sm-6 {
    width: 100%;
}

.col-sm-offset-2, .col-sm-offset-3, .col-sm-4 {
    margin-left: 0;
    margin-right: 0;
}

label {
    font-weight: bold;
    color: #333;
    margin-bottom: 5px;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="col-xs-12 table-responsive">
    <h2>Category Maintenance</h2>
    <asp:GridView ID="grdCategory" runat="server" 
    AutoGenerateColumns="False"
    DataKeyNames="CategoryId"
    DataSourceID="SqlDataSource1"
    CssClass="table table-bordered table-condensed
    table-hover"
    OnPreRender="grdCategory_PreRender"
    OnRowDeleted="grdCategory_RowDeleted"
    OnRowUpdated="grdCategory_RowUpdated">
        <Columns>
            <asp:BoundField DataField="CategoryId"
            HeaderText="ID" ReadOnly="True">
            <ItemStyle CssClass="col-xs-1" />
            </asp:BoundField>
            <asp:BoundField DataField="Name"
            HeaderText="Name"
            SortExpression="Name">
            <ItemStyle CssClass="col-xs-2" />
            </asp:BoundField>
            <asp:BoundField DataField="Orders"
HeaderText="Ordes"
SortExpression="Orders">
<ItemStyle CssClass="col-xs-2" />
</asp:BoundField>
            <asp:CommandField CausesValidation="False"
            ShowEditButton="True">
            <ItemStyle
            CssClass="col-xs-1 text-danger" />
            </asp:CommandField>
            <asp:CommandField CausesValidation="False"
            ShowDeleteButton="True">
            <ItemStyle CssClass="col-xs-1" />
            </asp:CommandField>
        </Columns>
        <AlternatingRowStyle CssClass="altRow" />
        <EditRowStyle CssClass="warning" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    ConflictDetection="CompareAllValues"
    OldValuesParameterFormatString="original_{0}"
    SelectCommand="SELECT [CategoryId], [Name],[Orders]
    FROM [Category]"
    DeleteCommand="DELETE FROM [Category]
    WHERE [CategoryIds] = @original_CategoryId
    AND [Name] = @original_Name"
    InsertCommand="INSERT INTO [Category]
    ([CategoryId], [Name],[Orders])
    VALUES (@CategoryId, @Name,@Orders)"
    UpdateCommand="UPDATE [Category]
    SET [Name] = @Name
    WHERE [CategoryId] = @original_CategoryId
    AND [Name] = @original_Name
        AND [Orders]= @original_Orders"
         >
        <DeleteParameters>
            <asp:Parameter Name="original_CategoryId" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Orders" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CategoryId" Type="String" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Orders" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="original_CategoryId" Type="String" />
            <asp:Parameter Name="original_Name" Type="String" />
             <asp:Parameter Name="original_Orders" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    </div>
        <div class="col-xs-12">
        <p>To create a new Genre, enter the Category
        information and click Add New Category</p>
        <p><asp:Label ID="lblError" runat="server"
        EnableViewState="false" CssClass="text-danger">
        </asp:Label>
        </p>
        <div class="form-group1">
            <label for="txtID" class="col-sm-2">CategoryId</label>
            <div class="col-sm-3">
                <asp:TextBox ID="txtID" runat="server"
                MaxLength="10" CssClass="form-control1">
                </asp:TextBox>
            </div>
            <div class="col-sm-offset-3 col-sm-4">
                <asp:RequiredFieldValidator ID="rfvID"
                runat="server" ControlToValidate="txtID"
                CssClass="text-danger"
                ErrorMessage="ID is a required field" ValidationGroup="AddCategory">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group1">
            <label for="txtName" class="col-sm-2">
            Name</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtName" runat="server"
                MaxLength="15" CssClass="form-control1">
                </asp:TextBox>
            </div>
            <div class="col-sm-offset-2 col-sm-4">
                <asp:RequiredFieldValidator ID="rfvShortName"
                runat="server" CssClass="text-danger"
                ControlToValidate="txtName"
                ErrorMessage="Name is a required field" ValidationGroup="AddCategory">
                </asp:RequiredFieldValidator>
            </div>
            <div class="form-group1">
    <label for="txtOrders" class="col-sm-2">
    Orders</label>
    <div class="col-sm-4">
        <asp:TextBox ID="txtOrders" runat="server"
        MaxLength="15" CssClass="form-control1">
        </asp:TextBox>
    </div>
            <div class="col-sm-offset-2 col-sm-4">
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
    runat="server" CssClass="text-danger"
    ControlToValidate="txtOrders"
    ErrorMessage="Orders is a required field" ValidationGroup="AddCategory">
    </asp:RequiredFieldValidator>
</div>
         </div>
        <asp:Button ID="btnAdd" runat="server"
        Text="Add New Category"
        CssClass="btn btn-primary add" ValidationGroup="AddCategory" OnClick="btnAdd_Click" />
    </div>
</div>
               <h2>Product Details</h2>

<div class="col-sm-6 table-responsive">
    <asp:GridView ID="grdProducts" runat="server"
    SelectedIndex="0" AutoGenerateColumns="False"
    DataKeyNames="ProductId" DataSourceID="SqlDataSource2"
    AllowPaging="True" AllowSorting="True" CssClass="table table-bordered
    table-striped table-condensed"
    OnPreRender="GridView1_PreRender" CellPadding="4" GridLines="None" ForeColor="#333333">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ProductId" HeaderText="ID"
            ReadOnly="True" SortExpression="ProductId">
                <ItemStyle CssClass="col-xs-2" />
            </asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                <ItemStyle CssClass="col-xs-6" />
            </asp:BoundField>
            <asp:BoundField DataField="CategoryId"
            HeaderText="Category" SortExpression="CategoryId">
                <ItemStyle CssClass="col-xs-2" />
            </asp:BoundField>
                       
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description">
    <ItemStyle CssClass="col-xs-6" />
</asp:BoundField>
               
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price">
    <ItemStyle CssClass="col-xs-6" />
</asp:BoundField>
                                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity">
    <ItemStyle CssClass="col-xs-6" />
</asp:BoundField>
            <asp:CommandField ButtonType="Link" ShowDeleteButton="True" ShowEditButton="True">
                <ItemStyle CssClass="col-xs-1" />
             </asp:CommandField>
        </Columns>
        
        <EditRowStyle BackColor="#2461BF" />
        
        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle CssClass="pagerStyle"
        BackColor="#2461BF" HorizontalAlign="Center" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle CssClass="warning" BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE"  Width="100%" />
    </asp:GridView>
   <asp:SqlDataSource ID="SqlDataSource2" runat="server"
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT [ProductId], [Name], [CategoryId], [Description], [Price], [Quantity] FROM [Products]"
    DeleteCommand="DELETE FROM [Products] WHERE [ProductId] = @ProductId"
    UpdateCommand="UPDATE [Products] SET [ProductId] = @ProductId,[Name] = @Name, [CategoryId] = @CategoryId, [Description] = @Description, [Price] = @Price, [Quantity] = @Quantity WHERE [ProductId] = @ProductId"
    InsertCommand="INSERT INTO [Products] ([ProductId],[Name], [CategoryId], [Description], [Price], [Quantity]) VALUES (@ProductId,@Name, @CategoryId, @Description, @Price, @Quantity)"
    OldValuesParameterFormatString="original_{0}">
    <DeleteParameters>
     <asp:Parameter Name="original_ProductId" Type="String" />
     <asp:Parameter Name="original_Name" Type="String" />
     <asp:Parameter Name="original_Description" Type="String" />
     
     <asp:Parameter Name="original_CategoryId" Type="String" />
     <asp:Parameter Name="original_Price" Type="Decimal" />
     <asp:Parameter Name="original_Quantity" Type="Int32" />
 </DeleteParameters>
 <UpdateParameters>
     <asp:Parameter Name="Name" Type="String" />
   
     <asp:Parameter Name="Description" Type="String" />
     <asp:Parameter Name="CategoryId" Type="String" />
     <asp:Parameter Name="Price" Type="Decimal" />
     <asp:Parameter Name="Quantity" Type="Int32" />
     <asp:Parameter Name="original_ProductId" Type="String" />
     <asp:Parameter Name="original_Name" Type="String" />
     
     <asp:Parameter Name="original_Description" Type="String" />
     <asp:Parameter Name="original_CategoryId" Type="String" />
     <asp:Parameter Name="original_Price" Type="Decimal" />
     <asp:Parameter Name="original_Quantity" Type="Int32" />
 </UpdateParameters>
   
</asp:SqlDataSource>

</div>
</asp:Content>
