using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class projects : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Add.Visible = false;
            projectview.Visible = false;
            ProjectManager.DataSource = SqlDataSource1;
            ProjectManager.DataTextField = "last_name";
            ProjectManager.DataValueField = "ssn";
            
            ProjectManager.DataBind();
            PastProjects.DataSource = SqlDataSource2;
            PastProjects.DataTextField = "name";
            PastProjects.DataValueField = "project_ID";
            PastProjects.DataBind();
        }
    }
    protected void Create_ButtonClick(object sender, EventArgs e)
    {
        Add.Visible = true;
        initial.Visible = false;
        projectview.Visible = false;
        Name.Text = String.Empty;
        Description.Text = String.Empty; ;
        Budget.Text = String.Empty;
    }
    protected void Cancel_ButtonClick(object sender, EventArgs e)
    {
        Add.Visible = false;
        initial.Visible = true;
        projectview.Visible = false;
    }
    protected void Insert_ButtonClick(object sender, EventArgs e)
    {
        //Parse form values
        String name = Name.Text;
        String pm = ProjectManager.SelectedValue;
        String start = Request.Form["startdate"];
        DateTime start_date = Convert.ToDateTime(start);
        String completion = Request.Form["completiondate"];
        DateTime completion_date = Convert.ToDateTime(completion);
        String project_type = Type.SelectedValue;
        String description = Description.Text;
        Int32 budget = Convert.ToInt32(Budget.Text);
        //Execute the SQL Insert
        try
        {
            String DataConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Public_Works_Project"].ConnectionString;
            String Insert = "Insert into dbo.Project VALUES (@pm, @name, @start_date, @completion_date, @project_type, @description, @budget);";
            SqlConnection Connection = new SqlConnection(DataConnectionString);
            Connection.Open();
            using (SqlCommand Command = new SqlCommand(Insert, Connection))
            {
                SqlParameter the_name = new SqlParameter("name", DbType.String);
                the_name.Value = name;
                Command.Parameters.Add(the_name);
                SqlParameter the_pm = new SqlParameter("pm", DbType.String);
                the_pm.Value = pm;
                Command.Parameters.Add(the_pm);
                SqlParameter the_start = new SqlParameter("start_date", DbType.String);
                the_start.Value = start_date;
                Command.Parameters.Add(the_start);
                SqlParameter the_completion = new SqlParameter("completion_date", DbType.String);
                the_completion.Value = completion_date;
                Command.Parameters.Add(the_completion);
                SqlParameter the_project_type = new SqlParameter("project_type", DbType.String);
                the_project_type.Value = project_type;
                Command.Parameters.Add(the_project_type);
                SqlParameter the_description = new SqlParameter("description", DbType.String);
                the_description.Value = description;
                Command.Parameters.Add(the_description);
                SqlParameter the_budget = new SqlParameter("budget", DbType.String);
                the_budget.Value = budget;
                Command.Parameters.Add(the_budget);
                Command.ExecuteNonQuery();
                
            }
        }
        catch (Exception ex)
        {
            //log error 
            //display friendly error to user
        }

        PastProjects.DataSource = SqlDataSource2;
        SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        PastProjects.DataTextField = "name";
        PastProjects.DataValueField = "project_ID";
        PastProjects.DataBind();
        Add.Visible = false;
        initial.Visible = true;
        projectview.Visible = false;
    }
    protected void PastProjects_SelectedIndexChanged(object sender, EventArgs e)
    {
        projectview.Visible = true;
        //PastProjects.DataSource = SqlDataSource2;
        //SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        //PastProjects.DataTextField = "name";
        //PastProjects.DataValueField = "project_ID";
        //PastProjects.DataBind();
        //Int32 SelectedProject_ID = Convert.ToInt32(PastProjects.SelectedValue);
        //try
        //{

        //    String DataConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Public_Works_Project"].ConnectionString;
        //    String Select = "Select project_manager, name, date_start, date_complete, proj_type, descr, budget FROM dbo.Project WHERE project_ID = " + SelectedProject_ID;
        //    SqlConnection Connection = new SqlConnection(DataConnectionString);
        //    Connection.Open();
        //    using (SqlCommand Command = new SqlCommand(Select, Connection))
        //    {
        //        SqlDataReader Reader = Command.ExecuteReader();
        //        if (Reader.HasRows)
        //        {
        //            while (Reader.Read())
        //            {
        //                String name = (String)Reader.GetValue(1);
        //                Int32 pm = (Int32)Reader.GetValue(0);
        //                DateTime start = (DateTime)Reader.GetValue(2);
        //                DateTime completion = (DateTime)Reader.GetValue(3);
        //                String project_type = (String)Reader.GetValue(4);
        //                String description = (String)Reader.GetValue(5);
        //                Double budget = (Double)Reader.GetValue(6);
        //                l1.Text = name;
        //                l2.Text = pm.ToString();
        //                l3.Text = start.ToString();
        //                l4.Text = completion.ToString();
        //                l5.Text = project_type;
        //                l6.Text = description;
        //                l7.Text = budget.ToString();
        //            }
        //        }
        //    }
        //    projectview.Visible = true;
        //}
        //catch (Exception ex)
        //{
        //    //log error 
        //    //display friendly error to user
        //}
    }

    protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        PastProjects.DataSource = SqlDataSource2;
        SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        PastProjects.DataTextField = "name";
        PastProjects.DataValueField = "project_ID";
        PastProjects.DataBind();
    }
    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        PastProjects.DataSource = SqlDataSource2;
        SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        PastProjects.DataTextField = "name";
        PastProjects.DataValueField = "project_ID";
        PastProjects.DataBind();
    }
}