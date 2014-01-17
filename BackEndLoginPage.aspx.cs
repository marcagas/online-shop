using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class BACKEND_BackEndLoginPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        
        
        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\NORTHWND.MDF;Integrated Security=True;User Instance=True");
        con.Open();
        SqlDataReader rdr = null;
        SqlCommand sqlQuery = new SqlCommand("SELECT * from empAccount where UserName='" + Login1.UserName + "' and Password='" + Login1.Password + "'", con);

        rdr = sqlQuery.ExecuteReader();

        if (rdr.HasRows)
        {
            while (rdr.Read())
            {
                Response.Write(rdr[3].ToString());
                Response.Cookies["FirstName"].Value = rdr[3].ToString();
            }
            Response.Redirect("Default.aspx");
        }
    }
    }
