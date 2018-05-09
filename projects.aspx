<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="projects.aspx.cs" Inherits="projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#startdate").datepicker();
            $("#completiondate").datepicker();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-narrow">
        <div runat="server" id="initial">
            <asp:Button ID="AddButton" runat="server" Text="Create New Project" CssClass="btn btn-primary" OnClick="Create_ButtonClick" />
            <br />
            <br />
            <p>&nbsp&nbsp&nbsp&nbsp or...</p>
            <div class="dropdown">
                <asp:Label ID="Label8" runat="server" Text="Select a Project: " Width="150px"></asp:Label>
                <asp:DropDownList ID="PastProjects" runat="server" CssClass="btn dropdown-toggle sr-only" OnSelectedIndexChanged="PastProjects_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
            </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Server=FAHAD\SQLEXPRESS02;database=Public_Works_Project;Integrated Security=true;" SelectCommand="SELECT name, project_ID FROM PROJECT"></asp:SqlDataSource>
        </div>
        <div runat="server" id="Add">
            <asp:Label ID="Label1" runat="server" Text="Name: " Width="150px"></asp:Label>
            <asp:TextBox ID="Name" runat="server"></asp:TextBox>
            <br />
            <div class="dropdown">
                <asp:Label ID="Label2" runat="server" Text="Project Manager: " Width="150px"></asp:Label>
                <asp:DropDownList ID="ProjectManager" runat="server" CssClass="btn dropdown-toggle sr-only"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Server=FAHAD\SQLEXPRESS02;database=Public_Works_Project;Integrated Security=true;" SelectCommand="SELECT ssn, last_name, first_name FROM Employees"></asp:SqlDataSource>
            </div>

            <br />
            <p>
                <asp:Label ID="Label6" runat="server" Text="Start Date: " Width="150px"></asp:Label>
                <input type="text" name="startdate" id="startdate" />
            </p>
            <p>
                <asp:Label ID="Label7" runat="server" Text="Completion Date: " Width="150px"></asp:Label>
                <input type="text" name="completiondate" id="completiondate"/>
            </p>
            <div class="dropdown">
                <asp:Label ID="Label3" runat="server" Text="Type: " Width="150px"></asp:Label>
                <asp:DropDownList ID="Type" runat="server" CssClass="btn dropdown-toggle sr-only">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Bridge</asp:ListItem>
                    <asp:ListItem>Road</asp:ListItem>
                    <asp:ListItem>Building</asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <asp:Label ID="Label4" runat="server" Text="Description: " Width="150px"></asp:Label>
            <asp:TextBox ID="Description" runat="server" TextMode="MultiLine" Rows="8" Width="600"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Total Budget: " Width="150px"></asp:Label>
            <asp:TextBox ID="Budget" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="InsertButton" runat="server" Text="Insert Project" CssClass="btn btn-primary" OnClick="Insert_ButtonClick" />
            <asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="btn btn-primary" OnClick="Cancel_ButtonClick" />
        </div>
        <div id="projectview" runat="server">
            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource3" DataKeyNames="project_ID" OnItemUpdated="FormView1_ItemUpdated" OnItemDeleted="FormView1_ItemDeleted">
                <ItemTemplate>
                    <br />
                    <asp:Label ID="Label9" runat="server" Text="Name:" Width="200" CssClass="label label-info" />
                    <asp:Label ID="l1" runat="server" Width="200" CssClass="label label-default" Text='<%# Eval("name") %>'/>
                    <br />
                    <asp:Label ID="Label10" runat="server" Text="Project Manager ID:" Width="200" CssClass="label label-info" />
                    <asp:Label ID="l2" runat="server" Width="200" CssClass="label label-default" Text='<%# Eval("project_manager") %>'/>
                    <br />
                    <asp:Label ID="Label11" runat="server" Text="Start Date:" Width="200" CssClass="label label-info" />
                    <asp:Label ID="l3" runat="server" Width="200" CssClass="label label-default" Text='<%# Eval("date_start") %>'/>
                    <br />
                    <asp:Label ID="Label12" runat="server" Text="Completion Date:" Width="200" CssClass="label label-info" />
                    <asp:Label ID="l4" runat="server" Width="200" CssClass="label label-default" Text='<%# Eval("date_complete") %>'/>
                    <br />
                    <asp:Label ID="Label13" runat="server" Text="Project Type:" Width="200" CssClass="label label-info" />
                    <asp:Label ID="l5" runat="server" Width="200" CssClass="label label-default" Text='<%# Eval("proj_type") %>'/>
                    <br />
                    <asp:Label ID="Label14" runat="server" Text="Project Description:" Width="200" CssClass="label label-info" />
                    <asp:Label ID="l6" runat="server" Width="200" CssClass="label label-default" Text='<%# Eval("descr") %>'/>
                    <br />
                    <asp:Label ID="Label15" runat="server" Text="Budget:" Width="200" CssClass="label label-info" />
                    <asp:Label ID="l7" runat="server" Width="200" CssClass="label label-default" Text='<%# Eval("budget") %>'/>
                    <br />
                    <br />
                    <asp:LinkButton ID="editbutton" runat="server" CssClass="btn btn-primary" CommandName="Edit" Text="Edit"/>
                    <asp:LinkButton ID="deletebutton" runat="server" CssClass="btn btn-primary" CommandName="Delete" Text="Delete"/>
                </ItemTemplate>
                <EditItemTemplate>
                    <br />
                    <asp:Label ID="Label9" runat="server" Text="Name:" Width="200" CssClass="label label-info" />
                    <asp:TextBox ID="l1" runat="server" Width="200" CssClass="" Text='<%# Bind("name") %>'/>
                    <br />
                    <asp:Label ID="Label10" runat="server" Text="Project Manager ID:" Width="200" CssClass="label label-info" />
                    <asp:TextBox ID="pm" runat="server" Width="200" CssClass="" Text='<%# Bind("project_manager") %>'/>
                    <br />
                    <asp:Label ID="Label11" runat="server" Text="Start Date:" Width="200" CssClass="label label-info" />
                    <asp:TextBox ID="l3" runat="server" Width="200" CssClass="" Text='<%# Bind("date_start") %>'/>
                    <br />
                    <asp:Label ID="Label12" runat="server" Text="Completion Date:" Width="200" CssClass="label label-info" />
                    <asp:TextBox ID="l4" runat="server" Width="200" CssClass="" Text='<%# Bind("date_complete") %>'/>
                    <br />
                    <asp:Label ID="Label13" runat="server" Text="Project Type:" Width="200" CssClass="label label-info" />
                    <asp:TextBox ID="l5" runat="server" Width="200" CssClass="" Text='<%# Bind("proj_type") %>'/>
                    <br />
                    <asp:Label ID="Label14" runat="server" Text="Project Description:" Width="200" CssClass="label label-info" />
                    <asp:TextBox ID="l6" runat="server" Width="200" CssClass="" Text='<%# Bind("descr") %>'/>
                    <br />
                    <asp:Label ID="Label15" runat="server" Text="Budget:" Width="200" CssClass="label label-info" />
                    <asp:TextBox ID="l7" runat="server" Width="200" CssClass="" Text='<%# Bind("budget") %>'/>
                    <br />
                    <asp:LinkButton ID="cancelbutton" runat="server" CssClass="btn btn-primary" CommandName="Cancel" Text="Cancel"/>
                    <asp:LinkButton ID="updatebutton" runat="server" CssClass="btn btn-primary" CommandName="Update" Text="Update"/>
                </EditItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Public_Works_ProjectConnectionString %>" DeleteCommand=" DELETE FROM [Task] WHERE project_ID=@project_ID; DELETE FROM [WorksOn] WHERE project_ID=@project_ID; DELETE FROM [Project] WHERE project_ID=@project_ID; " SelectCommand="SELECT [project_manager], [name], [date_start], [date_complete], [proj_type], [descr], [budget], [project_ID] FROM [Project] WHERE ([project_ID] = @project_ID)" UpdateCommand="UPDATE [Project] SET [project_manager] = @project_manager, [name] = @name, [date_start] = @date_start, [date_complete] = @date_complete, [proj_type] = @proj_type, [descr] = @descr, [budget] = @budget WHERE ([project_ID] = @project_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="PastProjects" Name="project_ID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>

