<%-- 
    Document   : products
    Created on : Mar 29, 2021, 6:57:36 PM
    Author     : TrongNhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="model.Product"%>
<%@page import ="dao.ProductDAO"%>


<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <!-- mobile metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <!-- site metas -->
        <title>products</title>
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
      

        <% 
            ProductDAO productDAO = new ProductDAO();
            String category_id = "";
            if(request.getParameter("category") != null){
                category_id = request.getParameter("category");
                
            }
            
            %>
            
          <jsp:include page="header.jsp"></jsp:include>
          <!-- <jsp:include page="banner.jsp"></jsp:include>  -->
          <div class="container">
              <div class="products">
                  
                       <%                        
                                for(Product p : productDAO.getListProductByCategory(Long.parseLong(category_id))){
                               

                        %>
                        <h2 class="products-in">DANH SÁCH NHÀ</h2>
                        
                       <div class="col-md-3 md-col">

                            <div class="col-md">
                                <a href="Single.jsp?product=<%=p.getProductID()%>"><img src="<%=p.getProductImage()%>" alt="<%=p.getProductName()%> "/></a>

                                <div class="top-content">
                                    <h5><a href="Single.jsp?product=<%=p.getProductID()%>"><%=p.getProductName()%></a></h5>
                                    <div class="white">
                                        <a href="Single.jsp" class="hvr-shutter-in-vertical hvr-shutter-in-vertical2">Contact Us</a>
                                        <p class="dollar"><span><%=p.getProductPrice()%></span><span class="in-dollar">$</span> </p>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                        <div class="clearfix"></div>
                    </div>
          </div>
    
                
            
     <jsp:include page="footer.jsp"></jsp:include>

        
       
    </body>
</html>

