<%-- 
    Document   : register
    Created on : Mar 29, 2021, 9:00:24 PM
    Author     : TrongNhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                 <!-- mobile metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <title>register</title>
                 <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- style css -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive-->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- fevicon -->
    <link rel="icon" href="images/fevicon.png" type="image/gif" />
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
    <!-- Tweaks for older IEs-->
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
    <!-- owl stylesheets -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" 
type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
 <script type="text/javascript">
    $(document).ready(function () {
        var x_timer;
        $("#email").keyup(function (e) {
            clearTimeout(x_timer);
            var user_name = $(this).val().trim();
            x_timer = setTimeout(function () {
                check_username_ajax(user_name);
            }, 1000);
        });
        function check_username_ajax(username) {
            $("#user-result").html('<img src="img/ajax-loader.GIF" />');
            $.post('CheckEmailServlet', {'username': username}, function (data) {
                $("#user-result").html(data);
            });
        }
    });
 
 </script>
    </head>
    <body>
         <jsp:include page="header.jsp"></jsp:include>
 

            <div class="brand_color">
                
                
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>Register</h2>
                    </div>
                </div>
            </div>
        </div>

    </div>
        <!--<jsp:include page="banner.jsp"></jsp:include> -->
          <div class="contact">
        <div class="container">
            <div class="row">
                <div class="col-md-12">

                    <form class="main_form" action="UsersServlet" method="POST">
                        <div class="row">
                            
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                <input class="form-control" placeholder="Your name(*)" type="text" name="fullname">
   
                            </div>
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6">
                                <input class="form-control" id="email" placeholder="Email(*)" type="text" name="Email">
                                <span id="user-result"></span>
                            </div>
                          <!--  <div class=" col-md-12">
                                <input class="form-control" placeholder="User" type="text" name="User">
                            </div>-->
                            <div class=" col-md-12">
                                <input class="form-control" placeholder="Password(*)" type="password" name="Password">
                            </div>
                           <div class=" col-md-12">
                                <input class="form-control" placeholder="Confirm Password(*)" type="password" name="Confirm Password">
                                </div>
                               <!-- <div class=" col-md-12">
                                <input class="form-control" placeholder="Address" type="text" name="Address">
                            </div>
                            <div class=" col-md-12">
                                <input class="form-control" placeholder="Phone" type="text" name="Phone">
                            </div>-->
                          
                            
                            <div class=" col-md-12">

                                <input type="hidden" value="insert" name="command"/>
                                <button class="send" type="submit">Register</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
        <jsp:include page="footer.jsp"></jsp:include>
         
    </body>
</html>
