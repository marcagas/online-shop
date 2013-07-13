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
/// Summary description for Suppliers
/// </summary>
[System.ComponentModel.DataObject]
public class SuppliersBLL
{
    private SuppliersTableAdapter _suppliersAdapter = null;
    protected SuppliersTableAdapter Adapter
    {
        get
        {
            if (_suppliersAdapter == null)
                _suppliersAdapter = new SuppliersTableAdapter();

            return _suppliersAdapter;
        }
    }


    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
    public Northwind.SuppliersDataTable GetSuppliers()
    {
        return Adapter.GetSuppliers();
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
    public Northwind.SuppliersDataTable GetSupplierBySupplierID(int supplierID)
    {
        return Adapter.GetSupplierBySupplierID(supplierID);
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
    public Northwind.SuppliersDataTable GetSuppliersByCountry(string country)
    {
        if (string.IsNullOrEmpty(country))
            return GetSuppliers();
        else
            return Adapter.GetSuppliersByCountry(country);
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Update, true)]
    public bool UpdateSupplierAddress(int supplierID, string address, string city, string country)
    {
        Northwind.SuppliersDataTable suppliers = Adapter.GetSupplierBySupplierID(supplierID);
        if (suppliers.Count == 0)
            // no matching record found, return false
            return false;
        else
        {
            Northwind.SuppliersRow supplier = suppliers[0];

            // Comment out the below three lines if you plan on using the OPTIONAL feature further down...
            if (address == null) supplier.SetAddressNull(); else supplier.Address = address;
            if (city == null) supplier.SetCityNull(); else supplier.City = city;
            if (country == null) supplier.SetCountryNull(); else supplier.Country = country;


            // OPTIONAL: Only assign the values to the SupplierRow's column values if they differ
            //if (address == null && !supplier.IsAddressNull())
            //    supplier.SetAddressNull();
            //else if ((address != null && supplier.IsAddressNull()) || (!supplier.IsAddressNull() && string.Compare(supplier.Address, address) != 0))
            //    supplier.Address = address;

            //if (city == null && !supplier.IsCityNull())
            //    supplier.SetCityNull();
            //else if ((city != null && supplier.IsCityNull()) || (!supplier.IsCityNull() && string.Compare(supplier.City, city) != 0))
            //    supplier.City = city;

            //if (country == null && !supplier.IsCountryNull())
            //    supplier.SetCountryNull();
            //else if ((country != null && supplier.IsCountryNull()) || (!supplier.IsCountryNull() && string.Compare(supplier.Country, country) != 0))
            //    supplier.Country = country;


            // Update the supplier Address-related information
            int rowsAffected = Adapter.Update(supplier);

            // Return true if precisely one row was updated, otherwise false
            return rowsAffected == 1;
        }
    }

}
