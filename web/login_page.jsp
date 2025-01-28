<%-- 
    Document   : login
    Created on : 19 Jun 2024, 3:08:06 pm
    Author     : harsh
--%>

<%@page import="newpackageEntities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <link href="Css/newcss.css" rel="stylesheet" type="text/css"/>
        
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS<6JXm" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="Css/css.css" rel="stylesheet" type="text/css"/>
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 85%, 69% 98%, 33% 89%, 0 99%, 0 0);
            }
        </style>
    </head>
    <body>
          
         <!-- Navbar -->
         
         <%@include file="normalNavbar.jsp" %>
         
         
         <!-- login form -->
        <main class="d-flex align-items-center primary-background banner-background" style="height:80vh">
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card ">
                        <div class="card-header text-center primary-background text-white ">
                           <span class="fa fa-user-plus fa-3x"></span>
                           <br>
                            <p class="mt-2">LOGIN HERE!</p>
                        </div>
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
                        <div class="card-body">
                            <form action="LoginServlet" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" name="email" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name="password" required class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
                                <div class="container text-center">
  <button type="submit" class="btn btn-primary text-center">Submit</button>
                                </div>
</form>
                        </div>
                        
                    </div>
                </div>
                
            </div>
            
        </div>
        </main>
        
        
        <!-- JAVASCRIPT -->    
        
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>   
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>    
<script src="js/newjavascript.js" type="text/javascript"></script>
    
       
 </body>
</html>
