<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="tasks.aspx.cs" Inherits="tasks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-narrow">
        <asp:DropDownList ID="PastProjects" DataSourceID="SqlDataSource2" runat="server" CssClass="btn dropdown-toggle sr-only" DataTextField="name" DataValueField="project_ID" AutoPostBack="true" OnSelectedIndexChanged="PastProjects_SelectedIndexChanged"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Server=FAHAD\SQLEXPRESS02;database=Public_Works_Project;Integrated Security=true;" SelectCommand="SELECT name, project_ID FROM PROJECT"></asp:SqlDataSource>
        <br />
        <div>
            <br />
        </div>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="task_id" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" AutoGenerateColumns="False" CssClass="table">
            <Columns>
                <asp:BoundField ReadOnly="True" HeaderText="task_id"
                    InsertVisible="False" DataField="task_id" SortExpression="task_id"></asp:BoundField>
                <asp:CommandField ShowEditButton="True"></asp:CommandField>
                <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                <asp:BoundField DataField="completion_date" HeaderText="completion_date" SortExpression="completion_date" />
                <asp:BoundField DataField="date_start" HeaderText="date_start" SortExpression="date_start" />
                <asp:BoundField DataField="value" HeaderText="value" SortExpression="value" />
                <asp:BoundField DataField="descr" HeaderText="descr" SortExpression="descr" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:LinkButton ID="TaskButton" runat="server" CssClass="btn btn-primary" Text="Add New Task" OnClick="TaskButton_Click" />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Public_Works_ProjectConnectionString %>" SelectCommand="SELECT [task_id], [name], [completion_date], [date_start], [value], [descr] FROM [Task] WHERE ([project_id] = @project_id)"
            UpdateCommand="UPDATE [Task] SET [name] = @name, [date_start] = @date_start, [completion_date] = @completion_date, [value] = @value, [descr] = @descr WHERE ([task_ID] = @task_ID)"
            DeleteCommand="DELETE FROM [Task] WHERE task_id=@task_id">
            <SelectParameters>
                <asp:ControlParameter ControlID="PastProjects" Name="project_id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Type="Int32" Name="task_id"></asp:Parameter>
                <asp:Parameter Type="String" Name="name"></asp:Parameter>
                <asp:Parameter Type="Int32" Name="value"></asp:Parameter>
                <asp:Parameter Type="DateTime" Name="date_start"></asp:Parameter>
                <asp:Parameter Type="DateTime" Name="completion_date"></asp:Parameter>
                <asp:Parameter Type="String" Name="descr"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource3" DataKeyNames="project_ID" DefaultMode="Insert" OnItemInserted="FormView1_ItemInserted">
            <InsertItemTemplate>
                <br />
                <asp:Label ID="Label9" runat="server" Text="Name:" Width="200" CssClass="label label-info" />
                <asp:TextBox ID="l1" runat="server" Width="200" Text='<%# Bind("name") %>'  />
                <br />
                <asp:Label ID="Label10" runat="server" Text="Start Date:" Width="200" CssClass="label label-info" />
                <asp:TextBox ID="l2" runat="server" Width="200" Text='<%# Bind("date_start") %>' />
                <br />
                <asp:Label ID="Label11" runat="server" Text="Completion Date:" Width="200" CssClass="label label-info" />
                <asp:TextBox ID="l3" runat="server" Width="200" Text='<%# Bind("completion_date") %>' />
                <br />
                <asp:Label ID="Label12" runat="server" Text="Task Value:" Width="200" CssClass="label label-info" />
                <asp:TextBox ID="l4" runat="server" Width="200" Text='<%# Bind("value") %>' />
                <br />
                <asp:Label ID="Label13" runat="server" Text="Description:" Width="200" CssClass="label label-info" />
                <asp:TextBox ID="l5" runat="server" Width="200" Text='<%# Bind("descr") %>' />
                <br />
                <br />
                <asp:LinkButton ID="insertbutton" runat="server" CssClass="btn btn-primary" CommandName="Insert" Text="Insert" />
            </InsertItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Public_Works_ProjectConnectionString %>" InsertCommand="Insert INTO task (name, project_id, date_start, completion_date, value, descr) VALUES (@name, @project_id, @date_start, @completion_date, @value, @descr)">
            <InsertParameters>
<%--                <asp:Parameter Type="Int32" Name="task_id"></asp:Parameter>--%>
                <asp:Parameter Type="String" Name="name"></asp:Parameter>
                <asp:Parameter Type="Int32" Name="value"></asp:Parameter>
                <asp:Parameter Type="DateTime" Name="date_start"></asp:Parameter>
                <asp:Parameter Type="DateTime" Name="completion_date"></asp:Parameter>
                <asp:Parameter Type="String" Name="descr"></asp:Parameter>
                <asp:ControlParameter ControlID="PastProjects" Name="project_id" PropertyName="SelectedValue" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

