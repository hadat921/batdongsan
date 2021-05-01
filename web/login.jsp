<%-- 
    Document   : login
    Created on : Mar 29, 2021, 9:22:26 PM
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
        <title>login</title>
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
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="brand_color">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titlepage">
                        <h2>Login</h2>
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
                    <%if(session.getAttribute("error") != null) {%>
                        <div>
                            <p style="color: red"><%= session.getAttribute("error")%></p>
                        </div>
                    <%}%>
                        <div class="row">
                          
                            <div class=" col-md-12">
                                <input class="form-control" placeholder="User" type="text" name="email">
                            </div>
                            <div class=" col-md-12">
                                <input class="form-control" placeholder="Password" type="password" name="password">
                            </div>
                           
                            
                            <div class=" col-md-12">
                                <input type="hidden" value="login" name="command">
                                <button class="send" type="submit">login</button>
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
