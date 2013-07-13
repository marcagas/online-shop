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

public partial class EditDeleteDataList_UIValidation : System.Web.UI.Page
{
    protected void Products_EditCommand(object source, DataListCommandEventArgs e)
    {
        // Set the DataList's EditItemIndex property to the
        // index of the DataListItem that was clicked
        Products.EditItemIndex = e.Item.ItemIndex;

        // Rebind the data to the DataList
        Products.DataBind();
    }

    protected void Products_CancelCommand(object source, DataListCommandEventArgs e)
    {
        // Set the DataList's EditItemIndex property to -1
        Products.EditItemIndex = -1;

        // Rebind the data to the DataList
        Products.DataBind();
    }

    protected void Products_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        if (!Page.IsValid)
            return;

        // Handle any exceptions raised during the editing process
        try
        {
            // Read in the ProductID from the DataKeys collection
            int productID = Convert.ToInt32(Products.DataKeys[e.Item.ItemIndex]);

            // Read in the product name and price values
            TextBox productName = (TextBox)e.Item.FindControl("ProductName");
            TextBox unitPrice = (TextBox)e.Item.FindControl("UnitPrice");

            string productNameValue = null;
            if (productName.Text.Trim().Length > 0)
                productNameValue = productName.Text.Trim();

            decimal? unitPriceValue = null;
            if (unitPrice.Text.Trim().Length > 0)
                unitPriceValue = Decimal.Parse(unitPrice.Text.Trim(), System.Globalization.NumberStyles.Currency);

            // Call the ProductsBLL's UpdateProduct method...
            ProductsBLL productsAPI = new ProductsBLL();
            productsAPI.UpdateProduct(productNameValue, unitPriceValue, productID);

            // Revert the DataList back to its pre-editing state
            Products.EditItemIndex = -1;
            Products.DataBind();
        }
        catch (Exception ex)
        {
            DisplayExceptionDetails(ex);
        }
    }

    private void DisplayExceptionDetails(Exception ex)
    {
        // Display a user-friendly message
        ExceptionDetails.Text = "There was a problem updating the product. ";

        if (ex is System.Data.Common.DbException)
            ExceptionDetails.Text += "Our database is currently experiencing problems. Please try again later.";
        else if (ex is NoNullAllowedException)
            ExceptionDetails.Text += "There are one or more required fields that are missing.";
        else if (ex is ArgumentException)
        {
            string paramName = ((ArgumentException)ex).ParamName;
            ExceptionDetails.Text += string.Concat("The ", paramName, " value is illegal.");
        }
        else if (ex is ApplicationException)
            ExceptionDetails.Text += ex.Message;
    }
}
