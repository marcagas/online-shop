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

public partial class Register : System.Web.UI.Page
{
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {

        if (Page.IsValid)
        {
            MessageBox.Show("Account succesfully Registered!",
              "Account Confirmation");
            string Email, UserId;
            Email = TextBox3.Text;
            UserId = TextBox7.Text;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NORTHWNDConnectionString"].ConnectionString);
            string valCmd = "select UserId,Email from UDetail";
            SqlCommand CMD = new SqlCommand(valCmd, con);
            con.Open();
            string cmd = "insert into UDetail values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox7.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox3.Text + "') ";
            
            
            SqlCommand Cmd = new SqlCommand(cmd, con);

            Cmd.ExecuteNonQuery();
            Cmd.CommandText = "insert into login values('" + TextBox7.Text + "','" + TextBox4.Text + "','user')";

            Cmd.ExecuteNonQuery();
            Response.Cookies["UserId"].Value = TextBox7.Text;
            Response.Cookies["Pwd"].Value = TextBox4.Text;
            //Response.Cookies["role"].Value = "user";
            FormsAuthentication.RedirectFromLoginPage(TextBox1.Text, true);
            con.Close();
            Response.Redirect("Login.aspx");

           
        }


    }

    private void If(bool p)
    {
        throw new NotImplementedException();
    }

    protected void val(object source, ServerValidateEventArgs args)
    {
        SqlConnection valcon = new SqlConnection(ConfigurationManager.ConnectionStrings["NORTHWNDConnectionString"].ConnectionString);
        string valcom = "select * from UDetail";
        SqlCommand ValCOM = new SqlCommand(valcom, valcon);
        valcon.Open();
        if (valcon.State == ConnectionState.Open)
        {
            SqlDataReader valrd = ValCOM.ExecuteReader();
            while (valrd.Read())
            {
                if (valrd[2].ToString().Equals(TextBox7.Text))
                { args.IsValid = false; }
                else { args.IsValid = true; }
            }



        }

        valcon.Close();
    }
    }
