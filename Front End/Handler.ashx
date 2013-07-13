<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

public class Handler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        string PicID = context.Request.QueryString["PicID"];
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["NORTHWNDConnectionString"].ConnectionString);
        connection.Open();
        SqlCommand command = new SqlCommand("select Picture from ProductImage where PicID=" + PicID, connection);
        SqlDataReader dr = command.ExecuteReader();
        dr.Read();
        context.Response.BinaryWrite((Byte[])dr[0]);
        connection.Close();
        context.Response.End();
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}