using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Configuration;

public partial class Front_End_views_products : System.Web.UI.Page
{
    public SqlDataReader categories;
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NORTHWNDConnectionString"].ConnectionString);
    private string str = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        loadCategories();
    }

    private void loadCategories() 
    {
        str = "Select * From Categories";
        SqlCommand cmd = new SqlCommand(str, con);
        categories = cmd.ExecuteReader();
    }

    public string Get_Image(object img)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])img);
    }
}