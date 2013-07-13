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

public partial class SqlDataSource_ParameterizedQueries : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Get the data from the SqlDataSource as a DataView
        DataView randomCategoryView = (DataView)RandomCategoryDataSource.Select(DataSourceSelectArguments.Empty);

        if (randomCategoryView.Count > 0)
        {
            // Assign the CategoryName value to the Label
            CategoryNameLabel.Text = string.Format("Here are Products in the {0} Category...", randomCategoryView[0]["CategoryName"].ToString());

            // Assign the ProductsByCategoryDataSource's CategoryID parameter's DefaultValue property
            ProductsByCategoryDataSource.SelectParameters["CategoryID"].DefaultValue = randomCategoryView[0]["CategoryID"].ToString();
        }
    }
}
