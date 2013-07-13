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

public partial class EditDeleteDataList_BatchUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void UpdateAll1_Click(object sender, EventArgs e)
    {
        UpdateAllSupplierAddresses();
    }
    
    protected void UpdateAll2_Click(object sender, EventArgs e)
    {
        UpdateAllSupplierAddresses();
    }

    private void UpdateAllSupplierAddresses()
    {
        // Create an instance of the SuppliersBLL class
        SuppliersBLL suppliersAPI = new SuppliersBLL();

        // Iterate through the DataList's items
        foreach (DataListItem item in Suppliers.Items)
        {
            // Get the supplierID from the DataKeys collection
            int supplierID = Convert.ToInt32(Suppliers.DataKeys[item.ItemIndex]);

            // Read in the user-entered values
            TextBox address = (TextBox)item.FindControl("Address");
            TextBox city = (TextBox)item.FindControl("City");
            TextBox country = (TextBox)item.FindControl("Country");

            string addressValue = null, cityValue = null, countryValue = null;
            if (address.Text.Trim().Length > 0)
                addressValue = address.Text.Trim();
            if (city.Text.Trim().Length > 0)
                cityValue = city.Text.Trim();
            if (country.Text.Trim().Length > 0)
                countryValue = country.Text.Trim();

            // Call the SuppliersBLL class's UpdateSupplierAddress method
            suppliersAPI.UpdateSupplierAddress(supplierID, addressValue, cityValue, countryValue);
        }
    }
}
