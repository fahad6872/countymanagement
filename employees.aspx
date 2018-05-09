<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="employees.aspx.cs" Inherits="employees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript">
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-narrow">
        <div runat="server" id="initial">
            <asp:Button ID="AddButton" runat="server" Text="Create New Employee" CssClass="btn btn-primary" OnClick="Create_ButtonClick" />
            <br />
            <br />
            <p>&nbsp&nbsp&nbsp&nbsp or...</p>
            <div class="dropdown">
                <asp:Label ID="Label8" runat="server" Text="Select An Employee: " Width="150px"></asp:Label>
                <asp:DropDownList ID="AllEmployees" runat="server" CssClass="btn dropdown-toggle sr-only" OnSelectedIndexChanged="AllEmployees_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>

                
            </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Server=FAHAD\SQLEXPRESS02;database=Public_Works_Project;Integrated Security=true;" SelectCommand="SELECT last_name, ssn  FROM Employees"></asp:SqlDataSource>
        </div>
        <div runat="server" id="Add">

            <asp:Label ID="LblSSN" runat="server" Text="SSN: " Width="150px"></asp:Label>
            <asp:TextBox ID="TxtSSN" runat="server"></asp:TextBox>
            <br />
            

            <asp:Label ID="LblFirstName" runat="server" Text="First Name: " Width="150px"></asp:Label>
            <asp:TextBox ID="TxtFirstName" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LblLastName" runat="server" Text="Last Name: " Width="150px"></asp:Label>
            <asp:TextBox ID="TxtLastName" runat="server"></asp:TextBox>
            <br />
            <div class="dropdown">
                <asp:Label ID="Label3" runat="server" Text="Employee Type: " Width="150px"></asp:Label>
                <asp:DropDownList ID="EmpType" runat="server" CssClass="btn dropdown-toggle sr-only">
                    <asp:ListItem Value="0">Please Select a Type:</asp:ListItem>
                    <asp:ListItem Value="1">Construction</asp:ListItem>
                    <asp:ListItem Value="2">HR</asp:ListItem>
                    <asp:ListItem Value="3">Accounting</asp:ListItem>
                    <asp:ListItem Value="4">Administrative</asp:ListItem>
                    <asp:ListItem Value="5">Management</asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <asp:Label ID="LblWage" runat="server" Text="Hourly Wage/Salary: " Width="150px"></asp:Label>
            <asp:TextBox ID="TxtWage" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LblEmail" runat="server" Text="Email: " Width="150px"></asp:Label>
            <asp:TextBox ID="TxtEmail" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LblPhone" runat="server" Text="Phone #: " Width="150px"></asp:Label>
            <asp:TextBox ID="TxtPhone" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="LblEmergency" runat="server" Text="Emergency Contact Name/#: " Width="150px"></asp:Label>
            <asp:TextBox ID="TxtEmergency" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="LblWorked" runat="server" Text="Hours Worked: " Width="150px"></asp:Label>
            <asp:TextBox ID="TxtWork" runat="server"></asp:TextBox>
            <br />
            <div class="dropdown">
                <asp:Label ID="LblProjectName" runat="server" Text="Project Name: " Width="150px"></asp:Label>
                <asp:DropDownList ID="ProjectName" runat="server" CssClass="btn dropdown-toggle sr-only"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Server=FAHAD\SQLEXPRESS02;database=Public_Works_Project;Integrated Security=true;" SelectCommand="SELECT project_id, name FROM Project"></asp:SqlDataSource>
            </div>
            <br />
            <asp:Button ID="InsertButton" runat="server" Text="Insert Employee Information" CssClass="btn btn-primary" OnClick="Insert_ButtonClick" />
            <asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="btn btn-primary" OnClick="Cancel_ButtonClick" />
        </div>
        <div id="employeeview" runat="server">
            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource3" DataKeyNames="ssn" OnItemUpdated="FormView1_ItemUpdated" OnItemDeleted="FormView1_ItemDeleted">
                <ItemTemplate>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="SSN:" Width="200" CssClass="label label-info" />
                    <asp:Label ID="Label5" runat="server" Width="200" CssClass="label label-default" Text='<%# Eval("ssn") %>'/>
                    <br />
                    <asp:Label ID="Label9" runat="server" Text="First Name:" Width="200" CssClass="label label-info" />
                    <asp:Label ID="l1" runat="server" Width="200" CssClass="label label-default" Text='<%# Eval("first_name") %>'/>
                    <br />
                    <asp:Label ID="Label10" runat="server" Text="Last Name:" Width="200" CssClass="label label-info" />
                    <asp:Label ID="l2" runat="server" Width="200" CssClass="label label-default" Text='<%# Eval("last_name") %>'/>
                    <br />
                    <asp:Label ID="Label11" runat="server" Text="Employee Type:" Width="200" CssClass="label label-info" />
                    <asp:Label ID="l3" runat="server" Width="200" CssClass="label label-default" Text='<%# Eval("emp_type") %>'/>
                    <br />
                    <asp:Label ID="Label12" runat="server" Text="Wage:" Width="200" CssClass="label label-info" />
                    <asp:Label ID="l4" runat="server" Width="200" CssClass="label label-default" Text='<%# Eval("wage") %>'/>
                    <br />
                    <asp:Label ID="Label13" runat="server" Text="Email:" Width="200" CssClass="label label-info" />
                    <asp:Label ID="l5" runat="server" Width="200" CssClass="label label-default" Text='<%# Eval("email") %>'/>
                    <br />
                    <asp:Label ID="Label14" runat="server" Text="Phone:" Width="200" CssClass="label label-info" />
                    <asp:Label ID="l6" runat="server" Width="200" CssClass="label label-default" Text='<%# Eval("phone") %>'/>
                    <br />
                    <asp:Label ID="Label15" runat="server" Text="Emergency Contact:" Width="200" CssClass="label label-info" />
                    <asp:Label ID="l7" runat="server" Width="200" CssClass="label label-default" Text='<%# Eval("emergency_contact") %>'/>
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Works Ons Project:" Width="200" CssClass="label label-info" />
                    <asp:Label ID="Label2" runat="server" Width="200" CssClass="label label-default" Text='<%# Eval("project_id") %>'/>
                    <br />
                     <asp:Label ID="Label6" runat="server" Text="Hours Worked:" Width="200" CssClass="label label-info" />
                    <asp:Label ID="Label7" runat="server" Width="200" CssClass="label label-default" Text='<%# Eval("hours_worked") %>'/>
                    <br />
                    <br />
                    <asp:LinkButton ID="editbutton" runat="server" CssClass="btn btn-primary" CommandName="Edit" Text="Edit"/>
                    <asp:LinkButton ID="deletebutton" runat="server" CssClass="btn btn-primary" CommandName="Delete" Text="Delete"/>
                </ItemTemplate>
                <EditItemTemplate>
                    <br />
                    <asp:Label ID="Label9" runat="server" Text="First Name:" Width="200" CssClass="label label-info" />
                    <asp:TextBox ID="l1" runat="server" Width="200" CssClass="" Text='<%# Bind("first_name") %>'/>
                    <br />
                    <asp:Label ID="Label10" runat="server" Text="Last Name:" Width="200" CssClass="label label-info" />
                    <asp:TextBox ID="pm" runat="server" Width="200" CssClass="" Text='<%# Bind("last_name") %>'/>
                    <br />
                    <asp:Label ID="Label11" runat="server" Text="Employee Type:" Width="200" CssClass="label label-info" />
                    <asp:TextBox ID="l3" runat="server" Width="200" CssClass="" Text='<%# Bind("emp_type") %>'/>
                    <br />
                    <asp:Label ID="Label12" runat="server" Text="Wage:" Width="200" CssClass="label label-info" />
                    <asp:TextBox ID="l4" runat="server" Width="200" CssClass="" Text='<%# Bind("wage") %>'/>
                    <br />
                    <asp:Label ID="Label13" runat="server" Text="Email:" Width="200" CssClass="label label-info" />
                    <asp:TextBox ID="l5" runat="server" Width="200" CssClass="" Text='<%# Bind("email") %>'/>
                    <br />
                    <asp:Label ID="Label14" runat="server" Text="Phone:" Width="200" CssClass="label label-info" />
                    <asp:TextBox ID="l6" runat="server" Width="200" CssClass="" Text='<%# Bind("phone") %>'/>
                    <br />
                    <asp:Label ID="Label15" runat="server" Text="Emergency Contact:" Width="200" CssClass="label label-info" />
                    <asp:TextBox ID="l7" runat="server" Width="200" CssClass="" Text='<%# Bind("emergency_contact") %>'/>
                    <br />
                    <asp:LinkButton ID="cancelbutton" runat="server" CssClass="btn btn-primary" CommandName="Cancel" Text="Cancel"/>
                    <asp:LinkButton ID="updatebutton" runat="server" CssClass="btn btn-primary" CommandName="Update" Text="Update"/>
                </EditItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Public_Works_ProjectConnectionString %>" DeleteCommand="DELETE FROM [Employees] WHERE ssn=@ssn" SelectCommand="SELECT [ssn], [first_name], [last_name], [emp_type], [wage], [email], [phone], [emergency_contact], [project_id], [hours_worked]  FROM [Employees], [WorksOn] WHERE [ssn] = @ssn AND [employee_id] = @ssn" UpdateCommand="UPDATE [Employees] SET [ssn] = @ssn, [first_name] = @first_name, [last_name] = @last_name, [emp_type] = @emp_type, [wage] = @wage, [email] = @email, [phone] = @phone, [emergency_contact] = @emergency_contact WHERE ([ssn] = @ssn)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="AllEmployees" Name="ssn" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>