<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-narrow">

      <div class="jumbotron">
        <h1>Manage Your Project</h1>
        <p class="lead">This site provides County workers access to the project management database for construction project administration and record keeping.</p>
      </div>

      <hr/>
      
      <!-- Carousel
    ================================================== -->
    <div id="myCarousel" class="carousel slide">
      <div class="carousel-inner">
        <div class="item active">
          <img src="img/pic1.jpg" alt="">
            <div class="carousel-caption">
              <h1>View Projects</h1>
              <p class="lead">Follow the link to administer any County construction project.</p>
              <a class="btn btn-large btn-primary" href="projects.aspx">See Projects</a>
            </div>
          
        </div>
        <div class="item">
          <img src="img/pic2.jpg" alt="">
            <div class="carousel-caption">
              <h1>View Tasks</h1>
              <p class="lead">View any tasks for a County construction Project.</p>
              <a class="btn btn-large btn-primary" href="tasks.aspx">See Tasks</a>
            </div>
        </div>
        <div class="item">
          <img src="img/pic3.jpg" alt="">
            <div class="carousel-caption">
              <h1>Administer Employees</h1>
              <p class="lead">View employees working on a given project.</p>
              <a class="btn btn-large btn-primary" href="employees.aspx">View Employees</a>
            </div>
        </div>
      </div>
      <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
      <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
    </div><!-- /.carousel -->

      <div class="row-fluid marketing">
        <div class="span6">
          <h4>View current projects</h4>
          <p>This site allows you to check on current projects.</p>

          <h4>View subcontractors</h4>
          <p>See which contractors are awarded jobs on each construction project.</p>

          <h4>View employee records</h4>
          <p>Check employee wages, hours, and time spent on projects.</p>
        </div>

        <div class="span6">
          <h4>View past projects</h4>
          <p>Adds the ability to examine historical projects.</p>
          

          <h4>View tasks</h4>
          <p>View the upcoming schedule or task completion for each project.</p>

          <h4>Track project progress</h4>
          <p>Track permits, licenses, and task completion for a given project and subcontractor.</p>
        </div>
      </div>

      <hr/>

      <div class="footer">
        <p>&copy; Fahad Muzaffar, Ankita Dahad, Priyanka Polavarapu 2016</p>
      </div>

    </div> <!-- /container -->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <script src="js/bootstrap.js"></script>
</asp:Content>

