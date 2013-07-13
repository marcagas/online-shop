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

public partial class SqlDataSource_OptimisticConcurrency : System.Web.UI.Page
{
    protected void Products_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.AffectedRows == 0)
        {
            ConcurrencyViolationMessage.Visible = true;
            e.KeepInEditMode = true;

            // Rebind the data to the GridView to show the latest changes
            Products.DataBind();
        }
    }

    protected void Products_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.AffectedRows == 0)
            ConcurrencyViolationMessage.Visible = true;
    }
}
