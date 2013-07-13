using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using NorthwindTableAdapters;

/// <summary>
/// Summary description for Categories
/// </summary>
[System.ComponentModel.DataObject]
public class CategoriesBLL
{
    private CategoriesTableAdapter _categoriesAdapter = null;
    protected CategoriesTableAdapter Adapter
    {
        get
        {
            if (_categoriesAdapter == null)
                _categoriesAdapter = new CategoriesTableAdapter();

            return _categoriesAdapter;
        }
    }


    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
    public Northwind.CategoriesDataTable GetCategories()
    {
        return Adapter.GetCategories();
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
    public Northwind.CategoriesDataTable GetCategoriesAndNumberOfProducts()
    {
        return Adapter.GetCategoriesAndNumberOfProducts();
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
    public Northwind.CategoriesDataTable GetCategoryByCategoryID(int categoryID)
    {
        return Adapter.GetCategoryByCategoryID(categoryID);
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
    public Northwind.CategoriesDataTable GetCategoryWithBinaryDataByCategoryID(int categoryID)
    {
        return Adapter.GetCategoryWithBinaryDataByCategoryID(categoryID);
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Insert, false)]
    public void InsertWithPicture(string categoryName, string description, string brochurePath, byte[] picture)
    {
        Adapter.InsertWithPicture(categoryName, description, brochurePath, picture);
    }


    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, false)]
    public bool UpdateCategory(string categoryName, string description, string brochurePath, byte[] picture, int categoryID)
    {
        // If no picture is specified, use other overload
        if (picture == null)
            return UpdateCategory(categoryName, description, brochurePath, categoryID);

        // Update picture, as well
        int rowsAffected = Adapter.UpdateWithPicture(categoryName, description, brochurePath, picture, categoryID);

        // Return true if precisely one row was updated, otherwise false
        return rowsAffected == 1;
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
    public bool UpdateCategory(string categoryName, string description, string brochurePath, int categoryID)
    {
        int rowsAffected = Adapter.Update(categoryName, description, brochurePath, categoryID);

        // Return true if precisely one row was updated, otherwise false
        return rowsAffected == 1;
    }


    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Delete, true)]
    public bool DeleteCategory(int categoryID)
    {
        int rowsAffected = Adapter.Delete(categoryID);

        // Return true if precisely one row was deleted, otherwise false
        return rowsAffected == 1;
    }
}
