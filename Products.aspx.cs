using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroupProject4_Finalproject
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lvProducts.DataBind();
            }
        }

        protected void lvProducts_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                string productId = e.CommandArgument.ToString();
                Response.Redirect($"Details.aspx?productId={productId}");
            }

        }

        protected void lvProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            int productId = Convert.ToInt32(lvProducts.SelectedDataKey.Value);
            Response.Redirect($"Details.aspx?ProductId={productId}");
        }
    }
}