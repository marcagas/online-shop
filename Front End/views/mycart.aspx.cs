using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Front_End_views_mycart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logged_in_info"] == null)
        {
            Session["flash_message"] = "Login to view your cart.";
            Response.Redirect("login.aspx");
        }
    }
}