using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class tasks : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PastProjects.DataTextField = "name";
            PastProjects.DataValueField = "project_ID";
            PastProjects.DataBind();
            GridView1.Visible = false;
            TaskButton.Visible = false;
            FormView1.Visible = false;
        }
    }
    protected void PastProjects_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        GridView1.DataBind();
        TaskButton.Visible = true;
        FormView1.Visible = false;
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        e.Cancel = true;
        GridView1.DataBind();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        SqlDataSource1.Update();
        GridView1.DataBind();
    }
    protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        GridView1.DataBind();
        FormView1.Visible = false;
        TaskButton.Visible = true;
    }
    protected void TaskButton_Click(object sender, EventArgs e)
    {
        FormView1.Visible = true;
    }
}