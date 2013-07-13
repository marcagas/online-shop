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

public partial class BinaryData_FileUpload : System.Web.UI.Page
{
    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if (UploadTest.HasFile == false)
        {
            // No file uploaded!
            UploadDetails.Text = "Please first select a file to upload...";            
        }
        else
        {
            // Display the uploaded file's details
            UploadDetails.Text = string.Format(
                    @"Uploaded file: {0}<br />
                      File size (in bytes): {1:N0}<br />
                      Content-type: {2}", 
                      UploadTest.FileName, 
                      UploadTest.FileBytes.Length,
                      UploadTest.PostedFile.ContentType);

            // Save the file
            string filePath = Server.MapPath("~/Brochures/" + UploadTest.FileName);
            UploadTest.SaveAs(filePath);
        }
    }
}
