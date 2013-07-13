<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

public class Handler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {

        SqlConnection con = new SqlConnection();

        con.ConnectionString = ConfigurationManager.ConnectionStrings

                              ["NORTHWNDConnectionString"].ConnectionString;





        SqlCommand cmd = new SqlCommand();

        cmd.CommandText = "Select ProductName,CategoryName,Picture from ProductImage" +

                          " where PicID =@ID";

        cmd.CommandType = System.Data.CommandType.Text;

        cmd.Connection = con;

        SqlParameter ImageID = new SqlParameter

                            ("@ID", System.Data.SqlDbType.Int);

        ImageID.Value = context.Request.QueryString["ID"];

        cmd.Parameters.Add(ImageID);

        con.Open();

        SqlDataReader dReader = cmd.ExecuteReader();

        dReader.Read();

        context.Response.BinaryWrite((byte[])dReader["Picture"]);

        dReader.Close();

        con.Close();

    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}