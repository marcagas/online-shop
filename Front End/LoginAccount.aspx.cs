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



public partial class Front_End_LoginAccount : System.Web.UI.Page
{
     protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NORTHWNDConnectionString"].ConnectionString);
        string usr = Request.Cookies["UserId"].Value;
        string cmd = "select * from UDetail ";
        SqlCommand command = new SqlCommand(cmd, con);
        con.Open();
        if (con.State == ConnectionState.Open)
        {
            SqlDataReader dtr = command.ExecuteReader();
            while (dtr.Read())
            {
                if (dtr[2].ToString().Equals(usr))
                {
                    //TextBox1.Text = dtr[0].ToString();
                    //TextBox2.Text = dtr[1].ToString();
                    //TextBox7.Text = dtr[2].ToString();
                    //TextBox4.Text = dtr[3].ToString();
                    //TextBox5.Text = dtr[4].ToString();
                    //TextBox6.Text = dtr[5].ToString();
                    //TextBox3.Text = dtr[6].ToString();
                    TextBox8.Text = dtr[7].ToString();

                }
                else continue;
            }
            
        }

    }

    protected void TextBox8_TextChanged(object sender, EventArgs e)
    {     
    }

    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["NORTHWNDConnectionString"].ConnectionString);
    //con1.Open();
    //SqlCommand sqlQuery = new SqlCommand("Select * from UDetail where ID ='" + TextBox8.Text.ToString() + "'", con1);
    //SqlDataReader dr = sqlQuery.ExecuteReader();
    //while (dr.Read())
    //{
    //    TextBox1.Text = dr["FirstName"].ToString();
    //    TextBox2.Text = dr["LastName"].ToString();
    //    TextBox7.Text = dr["UserId"].ToString();
    //    TextBox4.Text = dr["Pwd"].ToString();
    //    TextBox5.Text = dr["Adress"].ToString();
    //    TextBox6.Text = dr["Mob"].ToString();
    //    TextBox3.Text = dr["Email"].ToString();
    //}
    //dr.Close();
    //con1.Close();
    //    }


    protected void Button1_Click(object sender, EventArgs e)
    {

        MessageBox.Show("Account succesfully Updated!",
              "Account Confirmation");
        SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["NORTHWNDConnectionString"].ConnectionString);
        con2.Open();
        SqlCommand sqlQuery1 = new SqlCommand("UPDATE UDetail set FirstName='" + TextBox1.Text + "', LastName='" + TextBox2.Text + "', UserId='" + TextBox7.Text + "', Pwd='" + TextBox4.Text + "', Adress='" + TextBox5.Text + "', Mob='" + TextBox6.Text + "', Email='" + TextBox3.Text + "' where ID='" + TextBox8.Text + "'", con2);
        sqlQuery1.ExecuteNonQuery();
        con2.Close();
        Response.Redirect("LoginAccount.aspx");


    }

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox1.Text = GridView2.SelectedRow.Cells[0].Text;
        TextBox2.Text = GridView2.SelectedRow.Cells[1].Text;
        TextBox3.Text = GridView2.SelectedRow.Cells[6].Text;
        TextBox4.Text = GridView2.SelectedRow.Cells[3].Text;
        TextBox5.Text = GridView2.SelectedRow.Cells[4].Text;
        TextBox6.Text = GridView2.SelectedRow.Cells[5].Text;
        TextBox7.Text = GridView2.SelectedRow.Cells[2].Text;
        TextBox8.Text = GridView2.SelectedRow.Cells[7].Text;
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox1.Text = GridView2.SelectedRow.Cells[0].Text;
        TextBox2.Text = GridView2.SelectedRow.Cells[1].Text;
        TextBox3.Text = GridView2.SelectedRow.Cells[6].Text;
        TextBox4.Text = GridView2.SelectedRow.Cells[3].Text;
        TextBox5.Text = GridView2.SelectedRow.Cells[4].Text;
        TextBox6.Text = GridView2.SelectedRow.Cells[5].Text;
        TextBox7.Text = GridView2.SelectedRow.Cells[2].Text;
        TextBox8.Text = GridView2.SelectedRow.Cells[7].Text;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        TextBox7.Text = "";
        TextBox8.Text = "";
    }
}


