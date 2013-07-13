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

public partial class BinaryData_DisplayOrDownloadData : System.Web.UI.Page
{
    protected string GenerateBrochureLink(object BrochurePath)
    {
        if (Convert.IsDBNull(BrochurePath))
            return "No Brochure Available";
        else
            return string.Format(@"<a href=""{0}"">View Brochure</a>", ResolveUrl(BrochurePath.ToString()));
    }
}
