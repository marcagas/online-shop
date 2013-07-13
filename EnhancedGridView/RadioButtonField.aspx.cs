using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class EnhancedGridView_RadioButtonField : System.Web.UI.Page
{
    protected void Suppliers_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Grab a reference to the Literal control
            Literal output = (Literal)e.Row.FindControl("RadioButtonMarkup");

            // Output the markup except for the "checked" attribute
            output.Text = string.Format(@"<input type=""radio"" name=""SuppliersGroup"" id=""RowSelector{0}"" value=""{0}""", e.Row.RowIndex);

            // OPTIONAL: If you want to have the first radio button selected on the first
            // page load, use the following if statement instead of the one below
            //if (SuppliersSelectedIndex == e.Row.RowIndex || (!Page.IsPostBack && e.Row.RowIndex == 0))

            // See if we need to add the "checked" attribute
            if (SuppliersSelectedIndex == e.Row.RowIndex)
                output.Text += @" checked=""checked""";

            // Add the closing tag
            output.Text += " />";
        }
    }

    protected void SendToProducts_Click(object sender, EventArgs e)
    {
        // make sure one of the radio buttons has been selected
        if (SuppliersSelectedIndex < 0)
            ChooseSupplierMsg.Visible = true;
        else
        {
            // Send the user to ~/Filtering/ProductsForSupplierDetails.aspx
            int supplierID = Convert.ToInt32(Suppliers.DataKeys[SuppliersSelectedIndex].Value);
            Response.Redirect("~/Filtering/ProductsForSupplierDetails.aspx?SupplierID=" + supplierID);
        }
    }

    protected void ListProducts_Click(object sender, EventArgs e)
    {
        // make sure one of the radio buttons has been selected
        if (SuppliersSelectedIndex < 0)
        {
            ChooseSupplierMsg.Visible = true;
            ProductsBySupplierPanel.Visible = false;
        }
        else
        {
            // Set the GridView's SelectedIndex
            Suppliers.SelectedIndex = SuppliersSelectedIndex;

            // Show the ProductsBySupplierPanel panel
            ProductsBySupplierPanel.Visible = true;
        }
    }


    private int SuppliersSelectedIndex
    {
        get
        {
            if (string.IsNullOrEmpty(Request.Form["SuppliersGroup"]))
                return -1;
            else
                return Convert.ToInt32(Request.Form["SuppliersGroup"]);
        }
    }
}
