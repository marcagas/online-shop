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

public partial class Front_End_views_consolidate_branch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int prod_count, total, branch1, branch2, branch3;
        string productId, branch, reset;
        string sql_str;
        
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NORTHWNDConnectionString"].ConnectionString);
        
        productId = Request.Params["id"].ToString();
        // branch = Request.Params["branch"].ToString();
        total = Convert.ToInt16(Request.Params["total"]);
        branch1 = Convert.ToInt16(Request.Params["branch1"]);
        branch2 = Convert.ToInt16(Request.Params["branch2"]);
        branch3 = Convert.ToInt16(Request.Params["branch3"]);
        
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
            sql_str = "Update TotalInventory SET Total=" + total + ", branch1=" + branch1 + ", branch2=" + branch2 + ", branch3=" + branch3 + " WHERE ProductID=" + productId;            
        }
        else
        {
            //product don't exist, insert count
            sql_str = "Insert into TotalInventory(ProductID, Total) values (" +
                        productId + ", " + total +")";
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

    public static void WriteLogs(string message)
    {
        using (StreamWriter w = File.AppendText("C:\\Users\\marc\\Desktop\\log.txt")) { Log(message, w); }
    }

    public static void Log(string logMessage, TextWriter w)
    {
        //w.Write("\r\nLog Entry : ");
        //w.WriteLine("{0} {1}", DateTime.Now.ToLongTimeString(),
            //DateTime.Now.ToLongDateString());
        //w.WriteLine("  :");
        w.WriteLine(logMessage);
        w.WriteLine("-------------------------------");
    }
}