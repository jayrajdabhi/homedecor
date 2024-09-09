using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroupProject2_Finalproject
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string productId = Request.QueryString["ProductId"];
                if (!string.IsNullOrEmpty(productId))
                {
                    // Assuming GetProductDetails is a method to retrieve product details from the database based on productId
                    var productDetails = GetProductDetails(productId);
                    if (productDetails != null)
                    {
                        lblProductName.Text = productDetails.Name;
                        lblDescription.Text = productDetails.Description;
                        lblPrice.Text = string.Format("Price: {0:C}", productDetails.Price);
                        lblQuantity.Text = string.Format("Quantity: {0}", productDetails.Quantity);

                        // Assuming productDetails.ImageFileName contains the image file name
                        // Set the ImageUrl to display the product image
                        imgProductImage.ImageUrl = "~/Images/" + productDetails.ImageFile;
                    }
                    else
                    {
                        // Handle the case where product details are not found
                        // For example, redirect to an error page or display a message
                        Response.Redirect("~/ErrorPage.aspx");
                    }
                }
            }
        }

        // Method to retrieve product details based on productId
        private Products GetProductDetails(string productId)
        {
            
            return null; // Placeholder return value
        }
    }
}