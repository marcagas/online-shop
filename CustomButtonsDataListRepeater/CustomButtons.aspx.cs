using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class CustomButtonsDataListRepeater_CustomButtons : System.Web.UI.Page
{
    protected void Categories_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "ShowProducts")
        {
            // Determine the CategoryID
            int categoryID = Convert.ToInt32(e.CommandArgument);

            // Get the associated products from the ProudctsBLL and bind them to the BulletedList
            BulletedList products = (BulletedList)e.Item.FindControl("ProductsInCategory");
            ProductsBLL productsAPI = new ProductsBLL();
            products.DataSource = productsAPI.GetProductsByCategoryID(categoryID);
            products.DataBind();
        }
    }
}
