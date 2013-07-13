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

public partial class BinaryData_UpdatingAndDeleting : System.Web.UI.Page
{
    protected string GenerateBrochureLink(object BrochurePath)
    {
        if (Convert.IsDBNull(BrochurePath))
            return "No Brochure Available";
        else
            return string.Format(@"<a href=""{0}"">View Brochure</a>", ResolveUrl(BrochurePath.ToString()));
    }

    protected void NewCategory_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        // Reference the FileUpload controls
        FileUpload PictureUpload = (FileUpload)NewCategory.FindControl("PictureUpload");
        if (PictureUpload.HasFile)
        {
            // Make sure the picture upload is valid
            if (ValidPictureUpload(PictureUpload))
            {
                // Set the value of the picture parameter
                e.Values["picture"] = PictureUpload.FileBytes;
            }
            else
            {
                // Invalid file upload, cancel update and exit event handler
                e.Cancel = true;
                return;
            }
        }
        else
        {
            // No picture uploaded!
            UploadWarning.Text = "You must provide a picture for the new category.";
            UploadWarning.Visible = true;
            e.Cancel = true;
            return;
        }



        // Reference the FileUpload controls
        FileUpload BrochureUpload = (FileUpload)NewCategory.FindControl("BrochureUpload");

        // Process the BrochureUpload
        bool cancelOperation = false;
        e.Values["brochurePath"] = ProcessBrochureUpload(BrochureUpload, out cancelOperation);

        e.Cancel = cancelOperation;
    }

    protected void NewCategory_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.Exception != null)
        {
            // Need to delete brochure file, if it exists
            if (e.Values["brochurePath"] != null)
                System.IO.File.Delete(Server.MapPath(e.Values["brochurePath"].ToString()));
        }
    }

    // A page variable to "remember" the deleted category's BrochurePath value
    string deletedCategorysPdfPath = null;
    
    protected void Categories_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // Determine the PDF path for the category being deleted...
        int categoryID = Convert.ToInt32(e.Keys["CategoryID"]);

        CategoriesBLL categoryAPI = new CategoriesBLL();
        Northwind.CategoriesDataTable categories = categoryAPI.GetCategoryByCategoryID(categoryID);
        Northwind.CategoriesRow category = categories[0];

        if (category.IsBrochurePathNull())
            deletedCategorysPdfPath = null;
        else
            deletedCategorysPdfPath = category.BrochurePath;
    }
    
    protected void Categories_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        // Delete the brochure file if there were no problems deleting the record
        if (e.Exception == null)
        {
            DeleteRememberedBrochurePath();
        }
    }

    protected void BrochureOptions_SelectedIndexChanged(object sender, EventArgs e)
    {
        // Get a reference to the RadioButtonList and its Parent
        RadioButtonList BrochureOptions = (RadioButtonList)sender;
        Control parent = BrochureOptions.Parent;

        // Now use FindControl("controlID") to get a reference of the FileUpload control
        FileUpload BrochureUpload = (FileUpload)parent.FindControl("BrochureUpload");

        // Only show BrochureUpload if SelectedValue = "3"
        BrochureUpload.Visible = (BrochureOptions.SelectedValue == "3");
    }

    protected void Categories_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Reference the PictureUpload FileUpload
        FileUpload PictureUpload = (FileUpload)Categories.Rows[e.RowIndex].FindControl("PictureUpload");
        if (PictureUpload.HasFile)
        {
            // Make sure the picture upload is valid
            if (ValidPictureUpload(PictureUpload))
            {
                e.NewValues["picture"] = PictureUpload.FileBytes;
            }
            else
            {
                // Invalid file upload, cancel update and exit event handler
                e.Cancel = true;
                return;
            }
        }


        // Reference the RadioButtonList
        RadioButtonList BrochureOptions = (RadioButtonList)Categories.Rows[e.RowIndex].FindControl("BrochureOptions");

        // Get BrochurePath information about the record being updated
        int categoryID = Convert.ToInt32(e.Keys["CategoryID"]);

        CategoriesBLL categoryAPI = new CategoriesBLL();
        Northwind.CategoriesDataTable categories = categoryAPI.GetCategoryByCategoryID(categoryID);
        Northwind.CategoriesRow category = categories[0];

        if (BrochureOptions.SelectedValue == "1")
        {
            // Use current value for BrochurePath
            if (category.IsBrochurePathNull())
                e.NewValues["brochurePath"] = null;
            else
                e.NewValues["brochurePath"] = category.BrochurePath;
        }
        else if (BrochureOptions.SelectedValue == "2")
        {
            // Remove the current brochure (set it to NULL in the database)
            e.NewValues["brochurePath"] = null;
        }
        else if (BrochureOptions.SelectedValue == "3")
        {
            // Reference the BrochurePath FileUpload control
            FileUpload BrochureUpload = (FileUpload)Categories.Rows[e.RowIndex].FindControl("BrochureUpload");

            // Process the BrochureUpload
            bool cancelOperation = false;
            e.NewValues["brochurePath"] = ProcessBrochureUpload(BrochureUpload, out cancelOperation);

            e.Cancel = cancelOperation;
        }
        else
        {
            // Unknown value!
            throw new ApplicationException(string.Format("Invalid BrochureOptions value, {0}", BrochureOptions.SelectedValue));
        }

        if (BrochureOptions.SelectedValue == "2" || BrochureOptions.SelectedValue == "3")
        {
            // "Remember" that we need to delete the old PDF file
            if (category.IsBrochurePathNull())
                deletedCategorysPdfPath = null;
            else
                deletedCategorysPdfPath = category.BrochurePath;
        }
    }

    protected void Categories_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        // If there were no problems and we updated the PDF file, then delete the existing one
        if (e.Exception == null)
        {
            DeleteRememberedBrochurePath();
        }
    }


    private string ProcessBrochureUpload(FileUpload BrochureUpload, out bool CancelOperation)
    {
        CancelOperation = false;    // by default, do not cancel operation

        if (BrochureUpload.HasFile)
        {
            // Make sure that a PDF has been uploaded
            if (string.Compare(System.IO.Path.GetExtension(BrochureUpload.FileName), ".pdf", true) != 0)
            {
                UploadWarning.Text = "Only PDF documents may be used for a category's brochure.";
                UploadWarning.Visible = true;
                CancelOperation = true;
                return null;
            }

            const string BrochureDirectory = "~/Brochures/";
            string brochurePath = BrochureDirectory + BrochureUpload.FileName;
            string fileNameWithoutExtension = System.IO.Path.GetFileNameWithoutExtension(BrochureUpload.FileName);

            int iteration = 1;

            while (System.IO.File.Exists(Server.MapPath(brochurePath)))
            {
                brochurePath = string.Concat(BrochureDirectory, fileNameWithoutExtension, "-", iteration, ".pdf");
                iteration++;
            }

            // Save the file to disk and set the value of the brochurePath parameter
            BrochureUpload.SaveAs(Server.MapPath(brochurePath));
            return brochurePath;
        }
        else
        {
            // No file uploaded
            return null;
        }
    }

    private void DeleteRememberedBrochurePath()
    {
        // Is there a file to delete?
        if (deletedCategorysPdfPath != null)
        {
            System.IO.File.Delete(Server.MapPath(deletedCategorysPdfPath));
        }
    }

    private bool ValidPictureUpload(FileUpload PictureUpload)
    {
        // Make sure that a JPG has been uploaded
        if (string.Compare(System.IO.Path.GetExtension(PictureUpload.FileName), ".jpg", true) != 0 &&
            string.Compare(System.IO.Path.GetExtension(PictureUpload.FileName), ".jpeg", true) != 0)
        {
            UploadWarning.Text = "Only JPG documents may be used for a category's picture.";
            UploadWarning.Visible = true;
            return false;
        }
        else
        {
            return true;
        }
    }
    protected void Categories_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
