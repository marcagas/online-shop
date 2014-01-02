using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Front_End_views_search : System.Web.UI.Page
{
    public string category_name;
    public SqlDataReader products;
    public SqlCommand cmd;
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NORTHWNDConnectionString"].ConnectionString);
    private string str = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write(Request.Params["product"]);
        loadProducts(Request.Params["product"]);
    }

    private void loadProducts(string name)
    {
        con.Open();
        str = "Select Products.*, ProductImage.Picture From Products INNER JOIN ProductImage ON ProductImage.ProductName = Products.ProductName where Products.ProductName LIKE '%" + name + "%'";
        cmd = new SqlCommand(str, con);
        products = cmd.ExecuteReader();
    }
}