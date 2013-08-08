using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using System.Data.SqlClient;
using System.Configuration;


public partial class Front_End_views_products_show : System.Web.UI.Page
{
    public List<KeyValuePair<string, string>> products_list = new List<KeyValuePair<string,string>>();
    public string category_name;
    public SqlDataReader dr;
    public SqlDataReader products;
    public SqlCommand cmd;
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NORTHWNDConnectionString"].ConnectionString);
    private string str = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Params["category"] == null)
        {
            Response.Redirect("products.aspx");
        }
        string paramInfo = "";
        string[] pValues;
        NameValueCollection pColl = Request.Params;

        for (int i = 0; i <= pColl.Count - 1; i++)
        {
            paramInfo += "Key: " + pColl.GetKey(i) + "<br />";

            // Create a string array that contains
            // the values associated with each key.
            pValues = pColl.GetValues(i);

            // Iterate through the array and add
            // each value to the string variable.
            for (int j = 0; j <= pValues.Length - 1; j++)
            {
                paramInfo += "Value:" + pValues[j] + "<br /><br />";

            }
        }
        
        loadCategory(Convert.ToInt32(Request.Params["category"]));
        loadProducts(Convert.ToInt32(Request.Params["category"]));
    }

    private void loadCategory(int category)
    {
        con.Open();
        str = "Select * From categories where CATEGORYID=" + category;
        cmd = new SqlCommand(str, con);
        dr = cmd.ExecuteReader();
        dr.Read();
        category_name = dr.GetString(1);
        cmd.Dispose();
        
        con.Close();
    }

    private void loadProducts(int category)
    {
        con.Open();
        str = "Select * From Products where CATEGORYID=" + category;
        cmd= new SqlCommand(str, con);
        products = cmd.ExecuteReader();
    }
}