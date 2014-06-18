using System;
using System.IO;
using System.Text;
using System.Net;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Windows.Forms;
using System.Drawing;
using System.Globalization;
using System.Net.Mail;
using System.Net;
public partial class Front_End_views_total_reset : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int prod_count, total;
        string productId, branch, reset;
        string sql_str;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NORTHWNDConnectionString"].ConnectionString);        

        productId = Request.Params["id"].ToString();
        // branch = Request.Params["branch"].ToString();
        total = Convert.ToInt16(Request.Params["total"]);

        sql_str = "Select * from TotalInventory where ProductID = " + productId;
        //WriteLogs(sql_str);

        SqlCommand cmd = new SqlCommand(sql_str, con);
        con.Open();

        prod_count = Convert.ToInt16(cmd.ExecuteScalar());
        //WriteLogs("prod_count >>>>" + prod_count.ToString());

        if (prod_count > 0)
        {
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                total += Convert.ToInt16(dr["Total"]);
                //WriteLogs(total.ToString());
            }
            dr.Close();

            //WriteLogs("update query");
            //product exist, update count
            sql_str = "Update TotalInventory SET Total=" + 0 + " WHERE ProductID=" + productId;
        }
        else
        {
            //product don't exist, insert count
            sql_str = "Insert into TotalInventory(ProductID, Total) values (" +
                        productId + ", " + 0 + ")";
            //WriteLogs("insert query");
        }

        //WriteLogs(sql_str);
        cmd = new SqlCommand(sql_str, con);
        cmd.ExecuteNonQuery();

        con.Close();

        Response.Write(Request.QueryString);
        Response.Write("Ok");
        Response.End();
    }
}