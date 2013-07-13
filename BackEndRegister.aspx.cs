using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data;
using System.Drawing;
using System.Text;

public partial class BACKEND_BackEndRegister : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        MessageBox.Show("Account succesfully Registered!",
              "Account Confirmation");
        
        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\NORTHWND.MDF;Integrated Security=True;User Instance=True");
        con.Open();
        SqlCommand sqlQuery = new SqlCommand("Insert into empAccount(EmpTitle,TitleOfCourtesy,FirstName,LastName,BirthDate,HireDate,EmailAddress,UserName,Password,Address,HomePhone) Values('" + DropDownList2.Text + "','" + DropDownList1.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox8.Text + "','" + TextBox9.Text + "','" + TextBox3.Text + "','" + TextBox7.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "')", con);
        sqlQuery.ExecuteReader();
        con.Close();

        Response.Redirect("BackEndLoginPage.aspx");

        
    }


}