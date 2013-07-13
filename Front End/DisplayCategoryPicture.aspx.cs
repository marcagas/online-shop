using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class Front_End_DisplayCategoryPicture : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int categoryID = Convert.ToInt32(Request.QueryString["CategoryID"]);

        // Get information about the specified category
        CategoriesBLL categoryAPI = new CategoriesBLL();
        Northwind.CategoriesDataTable categories = categoryAPI.GetCategoryWithBinaryDataByCategoryID(categoryID);
        Northwind.CategoriesRow category = categories[0];

        // For new categories, images are JPGs...
        
        // Output HTTP headers providing information about the binary data
        Response.ContentType = "image/jpeg";

        // Output the binary data
        Response.BinaryWrite(category.Picture);
    }
}
