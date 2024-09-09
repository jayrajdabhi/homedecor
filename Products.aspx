<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.master" CodeBehind="Products.aspx.cs" Inherits="GroupProject4_Finalproject.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
       
.products-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    gap: 20px;
    padding: 20px;
    background-color: #F8EDE3; 
}


.product-item {
    background-color: #ffffff; 
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 15px;
    width: 250px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s;
}


.product-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    background-color: #f1f8e9;
}


.product-item h3 {
    font-size: 18px;
    color: #333;
    margin-bottom: 10px;
    font-weight: bold;
}


.product-item p {
    font-size: 14px;
    color: #555;
    margin-bottom: 10px;
}


.product-item p strong {
    color: #333;
    font-weight: bold;
}


.product-item img {
    display: block;
    margin: 0 auto 10px;
    border-radius: 5px;
}


.product-item .aspNetButton {
    display: inline-block;
    padding: 8px 15px;
    background-color: #C5705D;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    text-decoration: none;
    font-size: 14px;
    font-weight: bold; 
}

.product-item .aspNetButton:hover {
    background-color: #a14a41;
}



h2 {
    font-size: 24px;
    color: #333;
    text-align: center;
    margin-bottom: 20px;
}
        p {
            align-content:center;

        }

    </style>
  
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div>
    <h2>Our Products</h2>
        <p>Here you can showcase your products.</p>
         <div class="products-container">
    <asp:ListView ID="lvProducts" runat="server" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="lvProducts_SelectedIndexChanged" DataKeyNames="ProductId">
        <ItemTemplate>
            <div class="product-item">
                <h3><%# Eval("Name") %></h3>
                <p><%# Eval("Description") %></p>
                <p><strong>Price:</strong> <%# Eval("Price", "{0:C}") %></p>
    <p><strong>Quantity:</strong> <%# Eval("Quantity") %></p>
                <p>Category ID: <%# Eval("CategoryID") %></p>
                <asp:Image ID="ImageProduct" runat="server" ImageUrl='<%# "~/Images/" + Eval("ImageFile") %>' 
                       AlternateText="Product Image" Height="100px" />
                <asp:Button runat="server" Text="View Details" CommandName="Select" CommandArgument='<%# Eval("ProductId") %>' />
               
            </div>
        </ItemTemplate>
    </asp:ListView>
</div>
         
         </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ProductId], [Name], [Description], [Price], [CategoryID], [Quantity] ,[ImageFile] FROM [Products] ORDER BY [Name]"></asp:SqlDataSource>
</asp:Content>