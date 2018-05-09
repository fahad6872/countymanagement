using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SetCurrentPage();   
    }

    private void SetCurrentPage()
    {
        var pageName = GetPageName();
        if (pageName == null)
        {
            pageName = "default.aspx";
        }
        switch (pageName)
        {
            case "projects.aspx":
                Projects.Attributes["class"] = "active";
                break;
            case "tasks.aspx":
                Tasks.Attributes["class"] = "active";
                break;
            case "employees.aspx":
                Employees.Attributes["class"] = "active";
                break;
            case "licensepermit.aspx":
                LicPerm.Attributes["class"] = "active";
                break;
            case "login.aspx":
                Login.Attributes["class"] = "active";
                break;
            case "default.aspx":
                Home.Attributes["class"] = "active";
                break;
        }
    }

    private string GetPageName()
    {
        return Request.Url.ToString().Split('/').Last();
    }
}
