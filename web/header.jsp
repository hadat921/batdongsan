<%-- 
    Document   : header
    Created on : Mar 29, 2021, 12:15:32 PM
    Author     : TrongNhan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Users"%>
<%@page import="dao.UsersDAO"%>
<%@page import="model.Category"%>
<%@page import="dao.CategoryDAO"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Header</title>
    </head>
    <body>
        <%
                  CategoryDAO categoryDAO = new CategoryDAO();
        %>
<%
 Users users = new Users();
 if (session.getAttribute("user") != null) 
 users = (Users) session.getAttribute("user");
 else
 users.setUserEmail("");
 %>
        <div class="header">

            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                        <div class="full">
                            <div class="center-desk">
                                <div class="logo">
                                    <a href="index.jsp"><img src="images/logo.jpg" alt="#"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9 clo-sm-9">
                        <div class="menu-area">
                            <div class="limit-box">
                                <nav class="main-menu">
                                    <ul class="menu-area-main">
                                        <li><a href="#"> <%=users.getUserEmail() %></a> </li>
                                        <li class="active"> <a href="index.jsp">Home</a> </li> 
                    
                                            
                                        <li><a href="products.jsp">Products</a>
                                       
                                                   <%
                                                         for (Category c : categoryDAO.getListCategory()){
                                                    %>
                                                          <li><a href="products.jsp?category=<%=c.getCategoryID()%>"><%=c.getCategoryName() %></a></li>
                                                       <%
                                                                            }
                                                        %>
                                    
                                        
                                        <li><a href="contact.jsp">Contact Us</a></li>
                                        <li> <a href="register.jsp">Register</a> </li>
                                        <li> <a href="login.jsp">Login</a> </li>
                                        <li class="last">
                                            <a href="#"><img src="images/search_icon.png" alt="icon" /></a>
                                        </li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 offset-md-6">
                        <div class="location_icon_bottum">
                            <ul>
                                <li><img src="icon/call.png" />0961800734</li>
                                <li><img src="icon/email.png" />hoangungdai@gmail.com</li>
                                <li><img src="icon/loc.png" />District 1</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
