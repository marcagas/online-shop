using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Front_End_views_thank_you : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // if params status == success
        // delete products cookies        
        // TODO investigate on why server does not delete cookies
        // research on proper way to delete cookies in server
        Response.Cookies["products"].Expires = DateTime.Now.AddDays(-1);
        Response.Cookies["products"].Value = null;
        Request.Cookies["products"].Expires = DateTime.Now.AddDays(-1);

    }
}