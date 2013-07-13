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

public partial class PagingSortingDataListRepeater_Sorting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ProductsDataSource_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        // Have the ObjectDataSource sort the results by the selected sort expression
        e.Arguments.SortExpression = SortBy.SelectedValue;
    }
}
