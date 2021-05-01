<%-- 
    Document   : Single
    Created on : Apr 25, 2021, 4:32:09 PM
    Author     : TrongNhan
--%>


<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
           <!-- mobile metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
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
        <title>Single</title>
    </head>
    <body>
       <jsp:include page="header.jsp"></jsp:include>
       
       
        <%
            ProductDAO productDAO = new ProductDAO();
            Product product = new Product();
            String productID ="";
            if(request.getParameter("product")!= null){
                productID=request.getParameter("product");
                product = productDAO.getProduct(Long.parseLong(productID));
                
            }
           
            %>

            <div class="container">
                <div class="col-md-9 single-top">
                    <div class="col-md-5 single-top">
                        <ul id="etalage">
                            <li>
                                <a href="#">
                                    <img class="etalage_thumb_image img-responsive" src="<%=product.getProductImage()%>" alt="<%=product.getProductName()%>">
                                    <img class="etalage_source_image img-responsive" src="<%=product.getProductImage()%>" alt="<%=product.getProductName()%>">
                                </a>
                            </li>
                            
                        </ul>
                    </div>
                    <div class="col-md-7 single-top-in">
                        <div class="single-para">
                            <h4><%=product.getProductName()%></h4>
                            <div class="para-grid">
                                <span class="add-to"><%=product.getProductPrice()%>$</span>
                                <a href="#" class="hvr-shutter-in-vertical cart-to">Contact Us</a>
                                <div class="clearfix"></div>
                            </div>
                            <p><%=product.getProductDescription()%></p>
                        </div>
                    </div>
                    
                </div>
            </div>
        
         <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
