<%-- 
    Document   : profile
    Created on : 20 Jun 2024, 7:33:53 pm
    Author     : harsh
--%>
<%@page import="newpackageEntities.Message"%>
<%@page errorPage="error_page.jsp" %>
<%@page import="newpackageEntities.UserInfo"%>
<% 
    //in jsp you dont need to create the object for HttpSeiion class
    //directly you can use #IMPLICIT OBJECT CONCEPT
 UserInfo user=(UserInfo)session.getAttribute("CurrentUser");
 if(user==null){
    response.sendRedirect("login_page.jsp");
    }
  


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Register Page</title>


        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="Css/newcss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
        </style>

    </head>
    <body>
        <!-- navbar START-->
          <nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk"></span>   Tech Blog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#"> <span class="	fa fa-bell-o"></span> LearnCode with Durgesh <span class="sr-only">(current)</span></a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="	fa fa-check-square-o"></span> Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Programming Language</a>
                    <a class="dropdown-item" href="#">Project Implementation</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Data Structure</a>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#"> <span class="	fa fa-address-card-o"></span> Contact</a>
            </li>
            
            

        </ul>
        <form class="form-inline my-2 my-lg-0">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                <a class="nav-link" href="#"data-toggle="modal" data-target="#profileModal"> <span class="fa fa-user-circle  "></span> <%= user.getName()%></a>
            </li>
                <li class="nav-item">
                <a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus "></span> Log Out</a>
            </li>
            </ul>
        </form>
    </div>
</nav>
       
        <!-- navbar END-->
        <!-- alert message display -->
         <% 
                           Message m=(Message)session.getAttribute("msg");
                           if(m!=null){
                           %>
                           
                           <div class="alert <%= m.getCssClass()%>" role="alert">
     <%= m.getContent() %>
</div>
                           
                           <%
                             session.removeAttribute("msg");
                               }
                        %>
                        
                        
        <!-- profile modal -->
          <!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
          <div class=" container text-center">
          <h1>TechBlog</h1>
          </div>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
              <img src="pics/<%= user.getProfile()%>" style="border-radius:50%;max-width: 150px;;"  />
          <h5 class="modal-title" id="exampleModalLabel"><%= user.getName()%></h5>
          <div class="conatiner" id="profile-details">
          <table class="table">
  
  <tbody>
    <tr>
                                            <th scope="row"> ID </th>
                                            <td> <%= user.getId()%></td>

                                        </tr>
    <tr>
      <th scope="row">Name</th>
      <td><%= user.getName() %></td>
      
    </tr>
    <tr>
      <th scope="row">Email</th>
      <td><%= user.getEmail() %></td>
      
    </tr>
    <tr>
      <th scope="row">Gender</th>
      <td><%= user.getGender() %></td>
      
    </tr>
    <tr>
      <th scope="row">Status</th>
      <td><%= user.getAbout() %></td>
      
    </tr>
    <tr>
      <th scope="row">Registration time</th>
      <td><%= user.getDateTime() %></td>
      
    </tr>
  </tbody>
</table>
      </div>
      <div id="profile-edit" style="display:none" class="text-center">
          <!-- form is storing multi part data -->
          <form action="EditServlet" method="post" enctype="multipart/form-data">
          <table class="table">
   <tr>
      <th scope="row">ID</th>
      <td><%= user.getId() %></td>
      
    </tr>
    <tr>
      <th scope="row">Name</th>
      <td><input type="text" id="name" name="user_name" value="<%= user.getName()%>" class="form-control"></td>
      
    </tr> 
    <tr>
      <th scope="row">Email</th>
      <td><input type="email" id="email" name="user_email" value="<%= user.getEmail() %>" class="form-control"></td>
      
    </tr>
            <tr>
      <th scope="row">Password</th>
      <td><input type="password" id="password" name="user_password" value="<%= user.getPassword()%>" class="form-control"></td>
      
    </tr> 
     <tr>
      <th scope="row">About</th>
      <td><textarea id="about" name="user_about" rows="3" class="form-control"><%= user.getAbout()%></textarea></td>
      
    </tr>
    <tr>
      <th scope="row">New Profile</th>
      <td><input type="file" id="profile" name="user_profile"accept="image/png,image/jpeg"></td>
      
    </tr> 
          </table>
      <button name="save" class="btn btn-primary">save</button>
      </form>
      </div>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="edit-profile" class="btn btn-primary">EDIT</button>
      </div>
    </div>
  </div>
</div>
        <!-- profile modal END -->
        
        <!-- we have to put this funcationality of modal in profile name -->
        
        
        
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/newjavascript.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
        let editStatus=false;       
        $('#edit-profile').click(function(){
        //created variable         
        
        if(editStatus==false){
             $("#profile-details").hide();
                  $("#profile-edit").show();
                  
                   $(this).text("back");
                   editStatus=true;
        }
        else{
              $("#profile-details").show();
                  $("#profile-edit").hide();
                  editStatus=false;
                  $(this).text("EDIT");
        }
                
               });
            });
        </script>
    </body>
</html>
