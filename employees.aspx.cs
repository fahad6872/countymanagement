using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employees : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Add.Visible = false;
            employeeview.Visible = false;

            ProjectName.DataSource = SqlDataSource1;
            ProjectName.DataTextField = "name";
            ProjectName.DataValueField = "project_id";
            ProjectName.DataBind();

            AllEmployees.DataSource = SqlDataSource2;
            AllEmployees.DataTextField = "last_name"; 
            AllEmployees.DataValueField = "ssn";
            AllEmployees.DataBind();
        }
    }
    protected void Create_ButtonClick(object sender, EventArgs e)
    {
        Add.Visible = true;
        initial.Visible = false;
        employeeview.Visible = false;
        TxtFirstName.Text = String.Empty;
        TxtLastName.Text = String.Empty; ;
        TxtSSN.Text = String.Empty;
    }
    protected void Cancel_ButtonClick(object sender, EventArgs e)
    {
        Add.Visible = false;
        initial.Visible = true;
        employeeview.Visible = false;
    }
    protected void Insert_ButtonClick(object sender, EventArgs e)
    {
        //Parse form values
        Int32 ssn = Convert.ToInt32(TxtSSN.Text);
        String fName = TxtFirstName.Text;
        String lName = TxtLastName.Text;
        Int32 empType = Convert.ToInt32(EmpType.SelectedValue);
        float wage = Convert.ToSingle(TxtWage.Text);
        String email = TxtEmail.Text;
        String phone = TxtPhone.Text;
        String emergency = TxtEmergency.Text;


        Int32 hrsWorked = Convert.ToInt32(TxtWork.Text);
        Int32 projID = Convert.ToInt32(ProjectName.SelectedValue);

        try
        {
            String DataConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Public_Works_Project"].ConnectionString;
            String Insert = "Insert into dbo.Employees VALUES (@ssn, @first_name, @last_name, @emp_type, @wage, @email, @phone, @emergency_contact);";
            SqlConnection Connection = new SqlConnection(DataConnectionString);
            Connection.Open();
            using (SqlCommand Command = new SqlCommand(Insert, Connection))
            {
                SqlParameter the_ssn = new SqlParameter("ssn", DbType.String);
                the_ssn.Value = ssn;
                Command.Parameters.Add(the_ssn);

                SqlParameter the_fName = new SqlParameter("first_name", DbType.String);
                the_fName.Value = fName;
                Command.Parameters.Add(the_fName);

                SqlParameter the_lName = new SqlParameter("last_name", DbType.String);
                the_lName.Value = lName;
                Command.Parameters.Add(the_lName);

                SqlParameter the_empType = new SqlParameter("emp_type", DbType.String);
                the_empType.Value = empType;
                Command.Parameters.Add(the_empType);

                SqlParameter the_wage = new SqlParameter("wage", DbType.String);
                the_wage.Value = wage;
                Command.Parameters.Add(the_wage);

                SqlParameter the_email = new SqlParameter("email", DbType.String);
                the_email.Value = email;
                Command.Parameters.Add(the_email);

                SqlParameter the_phone = new SqlParameter("phone", DbType.String);
                the_phone.Value = phone;
                Command.Parameters.Add(the_phone);

                SqlParameter the_eContact = new SqlParameter("emergency_contact", DbType.String);
                the_eContact.Value = emergency;
                Command.Parameters.Add(the_eContact);

                Command.ExecuteNonQuery();

            }
        }
        catch (Exception ex1)
        {
            //display error on debug console
            Console.Out.WriteLine(ex1);
        }
        try
        {
            String DataConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["Public_Works_Project"].ConnectionString;
            String Insert = "Insert into dbo.WorksOn VALUES (@project_id, @employee_id, @hours_worked);";
            SqlConnection Connection = new SqlConnection(DataConnectionString);
            Connection.Open();
            using (SqlCommand Command = new SqlCommand(Insert, Connection))
            {


                SqlParameter the_projectId = new SqlParameter("project_id", DbType.String);
                the_projectId.Value = projID;
                Command.Parameters.Add(the_projectId);

                SqlParameter the_ssn = new SqlParameter("employee_id", DbType.String);
                the_ssn.Value = ssn;
                Command.Parameters.Add(the_ssn);

                SqlParameter the_hrsWorked = new SqlParameter("hours_worked", DbType.String);
                the_hrsWorked.Value = hrsWorked;
                Command.Parameters.Add(the_hrsWorked);

                Command.ExecuteNonQuery();

            }
        }
        catch (Exception ex2)
        {
            //display error on debug console 
            Console.Out.WriteLine(ex2);
        }
        AllEmployees.DataSource = SqlDataSource2;
        SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        AllEmployees.DataTextField = "last_name";
        AllEmployees.DataValueField = "ssn";
        AllEmployees.DataBind();
        Add.Visible = false;
        initial.Visible = true;
        employeeview.Visible = false;
    }

    protected void Delete_ButtonClick(object sender, EventArgs e)
    {
        AllEmployees.DataSource = SqlDataSource2;
        SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        AllEmployees.DataTextField = "last_name";
        AllEmployees.DataValueField = "ssn";
        AllEmployees.DataBind();
        
    }
    protected void AllEmployees_SelectedIndexChanged(object sender, EventArgs e)
    {
        employeeview.Visible = true;
    }

    protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
    {
        AllEmployees.DataSource = SqlDataSource2;
        SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        AllEmployees.DataTextField = "last_name";
        AllEmployees.DataValueField = "ssn";
        AllEmployees.DataBind();
        Add.Visible = false;
        initial.Visible = true;
        employeeview.Visible = false;
    }
    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        AllEmployees.DataSource = SqlDataSource2;
        SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        AllEmployees.DataTextField = "last_name";
        AllEmployees.DataValueField = "ssn";
        AllEmployees.DataBind();
        
    }
}