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


public partial class Front_End_views_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submitButton_Click(object sender, EventArgs e)
    {
        int flag = 0;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NORTHWNDConnectionString"].ConnectionString);
        string s = "select * from UDetail";
        SqlCommand com = new SqlCommand(s, con);
        con.Open();
        if (con.State == ConnectionState.Open)
        {
            SqlDataReader dtr;
            dtr = com.ExecuteReader();
            while (dtr.Read())
            {
                if (dtr[2].ToString().Equals(username.Text) && dtr[3].ToString().Equals(password.Text))
                {


                    Response.Cookies["UserId"].Value = username.Text;
                    Response.Cookies["Pwd"].Value = password.Text;
                    //Response.Cookies["role"].Value = dtr[2].ToString();
                    FormsAuthentication.RedirectFromLoginPage(username.Text, false);
                    Session["logged_in_info"] = username.Text + " " + password.Text;
                    Response.Redirect("LoginHome.aspx");

                }
                else
                {
                    alertLabel.Text = "your credential are incorrect";
                }


            }
        }
    }
}