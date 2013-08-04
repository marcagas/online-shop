using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Windows.Forms;
using System.Drawing;
using System.Text;
using System.Web.Security;

public partial class Front_End_views_register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logged_in_info"] != null)
        {
            Response.Redirect("home.aspx");
        }
    }
    protected void registerBtn_Click(object sender, EventArgs e)
    {
        string firstName, lastName, email, username, password, address, mobileNum;
        firstName = firstNameTxt.Text;
        lastName = lastNameTxt.Text;
        email = emailTxt.Text;
        username = usernameTxt.Text;
        password = passwordTxt.Text;
        address = addressTxt.Text;
        mobileNum = mobileNumTxt.Text;

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NORTHWNDConnectionString"].ConnectionString);
        string valCmd = "select UserId,Email from UDetail";
        SqlCommand CMD = new SqlCommand(valCmd, con);
        con.Open();
        string cmd = "insert into UDetail values('" + firstName + "','" + lastName + "','" + username + "','" + password + "','" + address + "','" + mobileNum + "','" + email + "') ";
        SqlCommand Cmd = new SqlCommand(cmd, con);

        Cmd.ExecuteNonQuery();
        Cmd.CommandText = "insert into login values('" + username + "','" + password + "','user')";

        Cmd.ExecuteNonQuery();
        Response.Cookies["UserId"].Value = username;
        Response.Cookies["Pwd"].Value = password;
        //Response.Cookies["role"].Value = "user";
        FormsAuthentication.RedirectFromLoginPage(firstName, true);
        con.Close();
        Response.Redirect("register_succss.aspx");
    }
}