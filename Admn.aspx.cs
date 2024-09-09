using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroupProject4_Finalproject
{
    public partial class Admn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters =
                SqlDataSource1.InsertParameters;
                parameters["CategoryId"].DefaultValue =
                txtID.Text;
                parameters["Name"].DefaultValue =
                txtName.Text;
                parameters["Orders"].DefaultValue =
                txtOrders.Text;
                try
                {
                    SqlDataSource1.Insert();
                    txtID.Text = "";
                    txtName.Text = "";
                    txtOrders.Text = "";
                }
                catch (Exception ex)
                {
                    lblError.Text =
                    DatabaseErrorMessage(ex.Message);
                }
            }
        }
        private string DatabaseErrorMessage(string errorMsg)
        {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }
        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated that category. " +
            "Please try again";
        }
        protected void grdCategory_PreRender(object sender, EventArgs e)
        {
        }
        protected void grdCategory_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
        }
        protected void grdCategory_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
        }
        protected void GridView1_PreRender(object sender, EventArgs e)
        {
        }


    }
}