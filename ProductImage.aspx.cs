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


public partial class ProductImage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
            BindGrid();

    }

    SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDBFIleName=|DataDirectory|\\NORTHWND.MDF;Integrated Security=True;User Instance=True");

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            byte[] img = new byte[FileUpload1.PostedFile.ContentLength];
            HttpPostedFile myimg = FileUpload1.PostedFile;
            myimg.InputStream.Read(img, 0, FileUpload1.PostedFile.ContentLength);

            SqlCommand Cmd = new SqlCommand("Insert into ProductImage(Picture,ProductName,CategoryName) values (@Picture,@productname,@categoryname )", con);

            SqlParameter prodname = new SqlParameter("@productname", SqlDbType.NVarChar, 40);
            prodname.Value = TextBox1.Text;
            Cmd.Parameters.Add(prodname);

            SqlParameter prodcategory = new SqlParameter("@categoryname", SqlDbType.NVarChar, 15);
            prodcategory.Value = DropDownList1.Text;
            Cmd.Parameters.Add(prodcategory);

            SqlParameter uploading = new SqlParameter("Picture", SqlDbType.Image);
            uploading.Value = img;
            Cmd.Parameters.Add(uploading);
            con.Open();
            Cmd.ExecuteNonQuery();
            con.Close();
            Label18.Text = "";
            BindGrid();

        }
        else

            Label18.Text = "Can't upload file......";
    }


    void BindGrid()
    {

        SqlDataAdapter Da = new SqlDataAdapter("Select * from ProductImage", con);
        DataSet Ds = new DataSet();
        Da.Fill(Ds);
        GridView1.DataSource = Ds;
        GridView1.DataBind();

    }

  
    protected void Button2_Click1(object sender, EventArgs e)
    {

    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}