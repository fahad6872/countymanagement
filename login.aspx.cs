using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Do a employee database query
        
        //If not found or incorrect password error.Visible = true;

        //For testing
        if (IsPostBack)
        {
            error.Visible = true;
        }
    }
}