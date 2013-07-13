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

public partial class EditDeleteDataList_OptimisticConcurrency : System.Web.UI.Page
{
    protected void Products_EditCommand(object source, DataListCommandEventArgs e)
    {
        Products.EditItemIndex = e.Item.ItemIndex;
        Products.DataBind();
    }

    protected void Products_CancelCommand(object source, DataListCommandEventArgs e)
    {
        Products.EditItemIndex = -1;
        Products.DataBind();
    }

    protected void Products_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        // Make sure the validators on the page are valid
        if (!Page.IsValid)
            return;


        // Read in the ProductID
        int productID = Convert.ToInt32(Products.DataKeys[e.Item.ItemIndex]);


        // Read in the original values
        string original_productName = null;
        decimal? original_unitPrice = null;

        if (!string.IsNullOrEmpty((string)ViewState["original_productName"]))
            original_productName = (string)ViewState["original_productName"];
        if (!string.IsNullOrEmpty((string)ViewState["original_unitPrice"]))
            original_unitPrice = decimal.Parse((string)ViewState["original_unitPrice"], System.Globalization.NumberStyles.Currency);

        
        // Read in the new values
        string new_productName = null;
        decimal? new_unitPrice = null;

        TextBox ProductName = (TextBox)e.Item.FindControl("ProductName");
        TextBox UnitPrice = (TextBox)e.Item.FindControl("UnitPrice");

        if (ProductName.Text.Trim().Length > 0)
            new_productName = ProductName.Text.Trim();
        if (UnitPrice.Text.Trim().Length > 0)
            new_unitPrice = decimal.Parse(UnitPrice.Text.Trim(), System.Globalization.NumberStyles.Currency);

        try
        {
            // Call the UpdateProduct method in ProductsOptimisticConcurrencyBLL
            ProductsOptimisticConcurrencyBLL optimisticProductsAPI = new ProductsOptimisticConcurrencyBLL();
            optimisticProductsAPI.UpdateProduct(new_productName, new_unitPrice, productID, original_productName, original_unitPrice, productID);

            // Return the DataList to its pre-editing state
            Products.EditItemIndex = -1;
            Products.DataBind();
        }
        catch (DBConcurrencyException)
        {
            // Display the UpdateConcurrencyViolationMessage Label
            UpdateConcurrencyViolationMessage.Visible = true;

            // Re-read the values from the database
            Products.DataBind();
        }
        catch
        {
            // Some other kind of exception occurred
            throw;
        }
    }
    
    
    protected void Products_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        // Read in the ProductID
        int productID = Convert.ToInt32(Products.DataKeys[e.Item.ItemIndex]);
        

        // Read in the current name and price values for the product being deleted
        Label ProductNameLabel = (Label)e.Item.FindControl("ProductNameLabel");
        Label UnitPriceLabel = (Label)e.Item.FindControl("UnitPriceLabel");

        string original_productName = ProductNameLabel.Text;
        decimal? original_unitPrice = null;
        if (!string.IsNullOrEmpty(UnitPriceLabel.Text))
            original_unitPrice = decimal.Parse(UnitPriceLabel.Text, System.Globalization.NumberStyles.Currency);


        // Delete the product using the ProductsOptimisticConcurrencyBLL class
        ProductsOptimisticConcurrencyBLL optimisticProductsAPI = new ProductsOptimisticConcurrencyBLL();
        bool deleteSucceeded = optimisticProductsAPI.DeleteProduct(productID, original_productName, original_unitPrice);


        // If the delete failed, display the DeleteConcurrencyViolationMessage Label
        if (!deleteSucceeded)
            DeleteConcurrencyViolationMessage.Visible = true;


        // Rebind the data to the GridView
        Products.DataBind();
    }


    protected void Products_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.EditItem)
        {
            // Read the edited item's original values into the Page's view state
            TextBox ProductName = (TextBox)e.Item.FindControl("ProductName");
            TextBox UnitPrice = (TextBox)e.Item.FindControl("UnitPrice");

            ViewState["original_productName"] = ProductName.Text;
            ViewState["original_unitPrice"] = UnitPrice.Text;
        }
    }
}
