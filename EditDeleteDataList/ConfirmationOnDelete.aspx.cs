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

public partial class EditDeleteDataList_ConfirmationOnDelete : System.Web.UI.Page
{
    protected void Products_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        // Read in the ProductID from the DataKeys collection
        int productID = Convert.ToInt32(Products.DataKeys[e.Item.ItemIndex]);

        // Delete the data
        ProductsBLL productsAPI = new ProductsBLL();
        productsAPI.DeleteProduct(productID);

        // Rebind the data to the DataList
        Products.DataBind();
    }

    // OPTIONAL: You could instead use the declarative approach (see ConfirmationOnDelete.aspx)
    protected void Products_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            // Reference the data bound to the DataListItem
            Northwind.ProductsRow product = (Northwind.ProductsRow)((System.Data.DataRowView)e.Item.DataItem).Row;

            // Reference the Delete button
            Button db = (Button)e.Item.FindControl("DeleteButton");

            // Assign the Delete button's OnClientClick property
            db.OnClientClick = string.Format("return confirm('Are you sure that you want to delete the product {0}?');", product.ProductName.Replace("'", @"\'"));
        }
    }
}
