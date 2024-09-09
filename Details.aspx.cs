using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace GroupProject4_Finalproject
{
    public partial class Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProductDetails();
            }
        }

        private void LoadProductDetails()
        {
            string productId = Request.QueryString["ProductId"];
            if (string.IsNullOrEmpty(productId))
            {
                lblError.Text = "Product ID is missing";
                lblError.Visible = true;
                return;
            }

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string sql = "SELECT Name, Description, Price, Quantity, ImageFile FROM Products WHERE ProductId = @ProductId";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@ProductId", productId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    imgProductImage.ImageUrl = "~/Images/" + reader["ImageFile"].ToString();
                    lblProductName.Text = reader["Name"].ToString();
                    lblDescription.Text = reader["Description"].ToString();
                    lblPrice.Text = String.Format("Price: {0:C}", reader["Price"]);
                    lblQuantity.Text = String.Format("Quantity Available: {0}", reader["Quantity"]);
                }
                else
                {
                    lblError.Text = "Product not found";
                    lblError.Visible = true;
                }
                reader.Close();
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            try
            {
                string productName = lblProductName.Text;

                decimal price = Convert.ToDecimal(lblPrice.Text.Replace("Price: $", "").Trim());
                int buyItems = Convert.ToInt32(txtBuy.Text);

                int availableQuantity = int.Parse(lblQuantity.Text.Replace("Quantity Available: ", "").Trim());

                if (buyItems > availableQuantity)
                {
                    lblError.Text = "You cannot purchase more than the available quantity.";
                    lblError.Visible = true;
                    return;
                }

                CartItem newItem = new CartItem(productName, price, buyItems);
                CartItemList cart = CartItemList.GetCart();
                cart.AddItem(newItem);

                Response.Redirect("~/Cart.aspx");
            }
            catch (Exception ex)
            {
                lblError.Text = "An error occurred while adding the item to the cart: " + ex.Message;
                lblError.Visible = true;
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Checkout.aspx");
        }
    }
}
