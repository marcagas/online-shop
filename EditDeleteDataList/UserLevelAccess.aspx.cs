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

public partial class EditDeleteDataList_UserLevelAccess : System.Web.UI.Page
{
    protected void LoggedOnAs_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Make sure editing is disabled and rebind the data to the DataList
        Employees.EditItemIndex = -1;
        Employees.DataBind();
    }

    #region Updating-Related Event Handlers
    protected void Employees_EditCommand(object source, DataListCommandEventArgs e)
    {
        // Set the EditItemIndex to the index of the item whose Edit button was clicked
        Employees.EditItemIndex = e.Item.ItemIndex;
        Employees.DataBind();
    }

    protected void Employees_CancelCommand(object source, DataListCommandEventArgs e)
    {
        // Return the DataList to its pre-editing state
        Employees.EditItemIndex = -1;
        Employees.DataBind();
    }

    protected void Employees_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        // Display a client-side messagebox explaining that the updating capabilities are not yet implemented
        Page.ClientScript.RegisterStartupScript(this.GetType(), "NotYetImplemented", @"alert('Update capabilities are not yet implemented and are left as an exercise to the reader - that\'s you!');", true);

        // Return the DataList to its pre-editing state
        Employees.EditItemIndex = -1;
        Employees.DataBind();
    }
    #endregion

    // A page-level variable holding information about the currently "logged on" user
    Northwind.EmployeesRow currentlyLoggedOnUser = null;

    protected void Employees_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
        {
            // Determine the Manager of the Employee record being bound to this DataListItem
            Northwind.EmployeesRow employee = (Northwind.EmployeesRow)((System.Data.DataRowView)e.Item.DataItem).Row;

            // Read in the information for the currently "logged on" user, if needed
            if (currentlyLoggedOnUser == null && Convert.ToInt32(LoggedOnAs.SelectedValue) > 0)
            {
                EmployeesBLL employeeAPI = new EmployeesBLL();
                currentlyLoggedOnUser = employeeAPI.GetEmployeeByEmployeeID(Convert.ToInt32(LoggedOnAs.SelectedValue))[0];
            } 
            
            
            // See if this user has access to edit the employee
            bool canEditEmployee = false;

            if (currentlyLoggedOnUser != null)
            {
                // We've got an authenticated user... see if they have no manager...
                if (currentlyLoggedOnUser.IsReportsToNull())
                    canEditEmployee = true;
                else
                {
                    // ok, this person has a manager... see if they are editing themselves
                    if (currentlyLoggedOnUser.EmployeeID == employee.EmployeeID)
                        canEditEmployee = true;
                    // see if this person manages the employee
                    else if (!employee.IsReportsToNull() && employee.ReportsTo == currentlyLoggedOnUser.EmployeeID)
                        canEditEmployee = true;
                }
            }                      


            // Referrence the Edit button and set its Visible property accordingly
            Button editButton = (Button)e.Item.FindControl("EditButton");
            editButton.Visible = canEditEmployee;
        }
    }
}
