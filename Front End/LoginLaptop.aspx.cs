using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Data.OleDb;

public partial class Front_End_LoginLaptop : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
            BindGrid();

    }

    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDBFIleName=|DataDirectory|\\NORTHWND.MDF;Integrated Security=True;User Instance=True");


    void BindGrid()
    {

        SqlDataAdapter Da = new SqlDataAdapter("Select * from ProductImage", con);
        DataSet Ds = new DataSet();
        Da.Fill(Ds);
        GridView3.DataSource = Ds;
        GridView3.DataBind();

    }


    protected void Button2_Click1(object sender, EventArgs e)
    {

    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected string url(int i)
    {
        return "Details.aspx?pName=" + i;
    }
}