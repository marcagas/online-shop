using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.Windows.Forms;
using System.Drawing;
using System.Text;

public partial class Front_End_views_mycart : System.Web.UI.Page
{   
    public DataTable products_table = new DataTable();
    public SqlDataReader dr;
    public SqlDataReader products;
    public SqlCommand cmd;
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NORTHWNDConnectionString"].ConnectionString);
    private string str = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logged_in_info"] == null)
        {
            Session["flash_message"] = "Login to view your cart.";
            Response.Redirect("login.aspx");
        }
        else if (HttpContext.Current.Request.Cookies.AllKeys.Contains("products") && Request.Cookies["products"].Value != "")
        {
            loadProducts();
        }

        
    }

    private void loadProducts()
    {
        HttpCookie cookie = Request.Cookies["products"];
        string cookieVal = cookie.Value.Replace("%26", "&").Replace("%3D", "=");
        string[] products = cookieVal.Split('&');
        string productId;
        string numOfItems;

        con.Open();
        products_table.Columns.Add("ProductId", typeof(string));
        products_table.Columns.Add("ProductName", typeof(string));
        products_table.Columns.Add("NumOfItems", typeof(string));
        products_table.Columns.Add("ProductPrice", typeof(float));
        products_table.Columns.Add("ProductImage", typeof(string));

        foreach (string product in products)
        {
            productId = product.Split('=')[0];
            numOfItems = product.Split('=')[1];

            //str = "Select * From Products where productID=" + productId;
            str = "Select Products.*, ProductImage.Picture From Products INNER JOIN ProductImage ON ProductImage.ProductName = Products.ProductName where ProductId=" + productId; 
            cmd = new SqlCommand(str, con);
            dr = cmd.ExecuteReader();
            //dr.Read();
            while (dr.Read())
            {
                DataRow row = products_table.NewRow();
                row["ProductId"] = productId;
                row["ProductName"] = dr[1].ToString();
                row["NumOfItems"] = numOfItems;
                row["ProductPrice"] = dr[5].ToString();
                row["ProductImage"] = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dr[10]);
                products_table.Rows.Add(row);
            }
            dr.Close();
        }
        
        cartGrid.DataSource = products_table;
        cartGrid.DataBind();

        con.Close();
    }

    public void test()
    {

    }
}