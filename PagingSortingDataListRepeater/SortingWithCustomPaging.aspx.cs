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

public partial class PagingSortingDataListRepeater_SortingWithCustomPaging : System.Web.UI.Page
{
    #region Event Handlers for Paging Interface
    protected void FirstPage_Click(object sender, EventArgs e)
    {
        // Return to StartRowIndex of 0 and rebind data
        StartRowIndex = 0;
        Products.DataBind();
    }
    protected void PrevPage_Click(object sender, EventArgs e)
    {
        // Subtract MaximumRows from StartRowIndex and rebind data
        StartRowIndex -= MaximumRows;
        Products.DataBind();
    }
    protected void NextPage_Click(object sender, EventArgs e)
    {
        // Add MaximumRows to StartRowIndex and rebind data
        StartRowIndex += MaximumRows;
        Products.DataBind();
    }
    protected void LastPage_Click(object sender, EventArgs e)
    {
        // Set StartRowIndex to last page's starting row index and rebind data
        StartRowIndex = ((TotalRowCount - 1) / MaximumRows) * MaximumRows;
        Products.DataBind();
    }
    #endregion

    #region Event Handlers for Sorting Interface
    protected void SortByProductName_Click(object sender, EventArgs e)
    {
        StartRowIndex = 0;
        SortExpression = "ProductName";
        Products.DataBind();
    }
    protected void SortByCategoryName_Click(object sender, EventArgs e)
    {
        StartRowIndex = 0;
        SortExpression = "CategoryName";
        Products.DataBind();
    }
    protected void SortBySupplierName_Click(object sender, EventArgs e)
    {
        StartRowIndex = 0;
        SortExpression = "CompanyName";
        Products.DataBind();
    }
    #endregion
    
    protected void ProductsDataSource_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
    {
        e.InputParameters["sortExpression"] = SortExpression;
        e.InputParameters["startRowIndex"] = StartRowIndex;
        e.InputParameters["maximumRows"] = MaximumRows;

        // Disable the paging interface buttons, if needed
        FirstPage.Enabled = StartRowIndex != 0;
        PrevPage.Enabled = StartRowIndex != 0;

        int LastPageStartRowIndex = ((TotalRowCount - 1) / MaximumRows) * MaximumRows;
        NextPage.Enabled = StartRowIndex < LastPageStartRowIndex;
        LastPage.Enabled = StartRowIndex < LastPageStartRowIndex;
    }

    #region Page-Level, Paging- and Sorting-Related properties
    private int StartRowIndex
    {
        get
        {
            object o = ViewState["StartRowIndex"];
            if (o == null)
                return 0;
            else
                return (int)o;
        }
        set
        {
            ViewState["StartRowIndex"] = value;
        }
    }

    private int MaximumRows
    {
        get
        {
            object o = ViewState["MaximumRows"];
            if (o == null)
                return 5;
            else
                return (int)o;
        }
        set
        {
            ViewState["MaximumRows"] = value;
        }
    }

    private int TotalRowCount
    {
        get
        {
            // Return the value from the TotalNumberOfProducts() method
            ProductsBLL productsAPI = new ProductsBLL();
            return productsAPI.TotalNumberOfProducts();
        }
    }

    private string SortExpression
    {
        get
        {
            object o = ViewState["SortExpression"];
            if (o == null)
                return "ProductName";
            else
                return o.ToString();
        }
        set
        {
            ViewState["SortExpression"] = value;
        }
    }
    #endregion
}
