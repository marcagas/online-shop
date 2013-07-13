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

public partial class Front_End_PaymentCREDITCARD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("PaymentMode.aspx");
    
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\NORTHWND.MDF;Integrated Security=True;User Instance=True");
        con.Open();
        SqlCommand sqlQuery = new SqlCommand("Insert into Creditcard(Name, Address, City, Region, PostalCode, Creditcard, Bank, BankNo, ValidationNo, Date) Values('" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox9.Text + "','" + TextBox10.Text + "','" + TextBox11.Text + "','" + DropDownList1.Text + "','" + TextBox3.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox12.Text + "')", con);
        sqlQuery.ExecuteReader();
        con.Close();

        Response.Redirect("PayCreditCardRECEIPT.aspx");

    }
}