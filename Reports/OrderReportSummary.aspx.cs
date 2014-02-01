using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Microsoft.Reporting.WebForms;
using System.Collections.Specialized;
using System.Data.SqlClient;
using System.Data.Entity;
using System.Data.Objects;
using System.Data;
using System.Configuration;

public partial class Reports_OrderReportSummary : System.Web.UI.Page
{    
    public SqlCommand cmd;
    public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["NORTHWNDConnectionString"].ConnectionString);
    private string str = "";

    
    protected void Page_Load(object sender, EventArgs e)
    {
        orderdetailssource.SelectParameters["emp"].DefaultValue = Request.Cookies["FirstName"].Value;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();

        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter();
        str = "SELECT Orders.OrderID, Orders.PaypalTransactionId, UDetail.FirstName, UDetail.LastName, "+
              "UDetail.Email, Products.ProductName, Products.ProductID, OrderDetails.UnitPrice, OrderDetails.Quantity, " +
              "Orders.PaypalGross, Orders.OrderDate, @emp AS employee FROM Orders INNER JOIN OrderDetails ON " +
              "Orders.OrderID = OrderDetails.OrderID INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID "+
              "INNER JOIN UDetail ON Orders.UserId = UDetail.ID where orderdate between @start_date and DateAdd(d, 1, @end_date)";

        cmd = new SqlCommand(str, con);
        string user = Request.Cookies["FirstName"].Value;
        cmd.Parameters.Add("emp", user);
        cmd.Parameters.Add("start_date", TextBox1.Text);
        cmd.Parameters.Add("end_date", TextBox2.Text);
        da.SelectCommand = cmd;
        da.Fill(ds, "DataSet1");

        ReportViewer1.LocalReport.DataSources.Clear();
        ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", ds.Tables[0]));
        ReportViewer1.LocalReport.Refresh();
        
        con.Close();
    }
}