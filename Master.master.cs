using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.Data;
using System.Windows.Forms;
using System.Drawing;
using System.Text;

public partial class Master : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logged_in_info"] == null)
        {
            //Response.Cookies["UserId"].Expires = DateTime.Now.AddDays(-1);
            //Response.Cookies["FirstName"].Expires = DateTime.Now.AddDays(-1);
        }
    }
}
