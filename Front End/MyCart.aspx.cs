using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.Data;
using System.Windows.Forms;
using System.Drawing;
using System.Text;


    public partial class Front_End_MyCart : System.Web.UI.Page
    {
        string url;
        decimal grandTotal = 0; string s2 = System.Web.HttpContext.Current.User.Identity.Name;
        public global gd = new global();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["logged_in_info"] == null)
            {
                Response.Redirect("Login.aspx");
            }
                        
            Response.Cookies["UserId"].Value = s2;
            grandTotal = 0;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal rowTotal = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "price")) * Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "quantity"));
                grandTotal = grandTotal + rowTotal;


            }
            Response.Cookies["price"].Value = grandTotal.ToString();
            TextBox2.Text = grandTotal.ToString();
            HyperLink1.ImageUrl = "~/Front End/img/checkout.jpg";
            //HyperLink1.NavigateUrl = "PaypalHome.aspx" + "&item_name=Total of Cart&item_number=132&amount=" + grandTotal;

        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            Response.Redirect("MyCart.aspx");
        }
        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
}
    
