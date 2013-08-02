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


    public partial class Login : System.Web.UI.Page
    {
        public global gd = new global();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            //MessageBox.Show("Account succesfully Logged In!",
            //  "Account Confirmation");

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
                    if (dtr[2].ToString().Equals(TextBox1.Text) && dtr[3].ToString().Equals(TextBox2.Text))
                    {


                        Response.Cookies["UserId"].Value = TextBox1.Text;
                        Response.Cookies["Pwd"].Value = TextBox2.Text;
                        //Response.Cookies["role"].Value = dtr[2].ToString();
                        FormsAuthentication.RedirectFromLoginPage(TextBox1.Text, false);
                        gd.loggedIn = true;
                        Session["logged_in_info"] = TextBox1.Text + " " + TextBox2.Text;
                        Response.Redirect("LoginHome.aspx");

                    }
                    else
                    {
                        Label1.Text = "your credential are incorrect";
                    }


                }
            }
        }
    }

