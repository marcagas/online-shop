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

public partial class PagingSortingDataListRepeater_SortingWithDefaultPaging : System.Web.UI.Page
{
    #region Event Handlers for Paging Interface
    protected void FirstPage_Click(object sender, EventArgs e)
    {
        // Send the user to the first page
        RedirectUser(0);
    }
    protected void PrevPage_Click(object sender, EventArgs e)
    {
        // Send the user to the previous page
        RedirectUser(PageIndex - 1);
    }
    protected void NextPage_Click(object sender, EventArgs e)
    {
        // Send the user to the next page
        RedirectUser(PageIndex + 1);
    }
    protected void LastPage_Click(object sender, EventArgs e)
    {
        // Send the user to the last page
        RedirectUser(PageCount - 1);
    }
    #endregion

    #region Event Handlers for Sorting Interface
    protected void SortByProductName_Click(object sender, EventArgs e)
    {
        // Sort by ProductName
        RedirectUser(0, "ProductName");
    }
    protected void SortByCategoryName_Click(object sender, EventArgs e)
    {
        // Sort by CategoryName
        RedirectUser(0, "CategoryName");
    }
    protected void SortBySupplierName_Click(object sender, EventArgs e)
    {
        // Sort by SupplierName
        RedirectUser(0, "SupplierName");
    }
    #endregion

    private void RedirectUser(int sendUserToPageIndex)
    {
        // Use the SortExpression property to get the sort expression from the querystring
        RedirectUser(sendUserToPageIndex, SortExpression);
    }

    private void RedirectUser(int sendUserToPageIndex, string sendUserSortingBy)
    {
        // Send the user to the requested page with the requested sort expression
        Response.Redirect(string.Format("SortingWithDefaultPaging.aspx?pageIndex={0}&pageSize={1}&sortExpression={2}", sendUserToPageIndex, PageSize, sendUserSortingBy));
    }

    protected void ProductsDefaultPagingDataSource_Selected(object sender, ObjectDataSourceStatusEventArgs e)
    {
        // Reference the PagedDataSource bound to the DataList
        PagedDataSource pagedData = (PagedDataSource)e.ReturnValue;

        // Remember the total number of records being paged through across postbacks
        TotalRowCount = pagedData.DataSourceCount;

        // Configure the paging interface based on the data in the PagedDataSource
        FirstPage.Enabled = !pagedData.IsFirstPage;
        PrevPage.Enabled = !pagedData.IsFirstPage;
        NextPage.Enabled = !pagedData.IsLastPage;
        LastPage.Enabled = !pagedData.IsLastPage;

        // Display the current page being viewed...
        CurrentPageNumber.Text = string.Format("You are viewing page {0} of {1}...", PageIndex + 1, PageCount);
    }

    #region Page-Level, Paging- and Sorting-Related properties
    private int TotalRowCount
    {
        get
        {
            object o = ViewState["TotalRowCount"];
            if (o == null)
                return -1;
            else
                return (int)o;
        }
        set
        {
            ViewState["TotalRowCount"] = value;
        }
    }

    private int PageCount
    {
        get
        {
            if (TotalRowCount <= 0 || PageSize <= 0)
                return 1;
            else
                return ((TotalRowCount + PageSize) - 1) / PageSize;
        }
    }

    private int PageIndex
    {
        get
        {
            if (!string.IsNullOrEmpty(Request.QueryString["pageIndex"]))
                return Convert.ToInt32(Request.QueryString["pageIndex"]);
            else
                return 0;
        }
    }

    private int PageSize
    {
        get
        {
            if (!string.IsNullOrEmpty(Request.QueryString["pageSize"]))
                return Convert.ToInt32(Request.QueryString["pageSize"]);
            else
                return 4;
        }
    }

    private string SortExpression
    {
        get
        {
            if (!string.IsNullOrEmpty(Request.QueryString["sortExpression"]))
                return Request.QueryString["sortExpression"];
            else
                return "ProductName";
        }
    }
    #endregion
}
