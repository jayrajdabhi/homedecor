
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroupProject4_Finalproject
{
    public partial class Cart : System.Web.UI.Page
    {
        private CartItemList cart;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        private void LoadCart()
        {
            cart = CartItemList.GetCart();
            DisplayCart();
        }

        private void DisplayCart()
        {
            lstCart.Items.Clear();
            foreach (CartItem item in cart)
            {
                lstCart.Items.Add(item.Display());
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            if (lstCart.SelectedIndex > -1)
            {
                cart.RemoveAt(lstCart.SelectedIndex);
                DisplayCart();
            }
            else
            {
                lblMessage.Text = "Please select the item you want to remove.";
            }
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            cart.Clear();
            DisplayCart();
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Products.aspx");
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Checkout.aspx");
        }
    }
}