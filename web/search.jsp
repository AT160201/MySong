<%-- 
    Document   : index
    Created on : Jul 8, 2021, 4:07:21 AM
    Author     : ADMIN
--%>

<%@page import="model.Account"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Song" %>
<%@page import="model.CaSi" %>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link
            href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900"
            rel="stylesheet"
            />

        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="eCommerce HTML Template Free Download" name="keywords">
        <meta content="eCommerce HTML Template Free Download" name="description">

        <title>Reflux HTML CSS Template</title>
        <!--
        Reflux Template
        https://templatemo.com/tm-531-reflux
        -->
        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="assets/css/fontawesome.css" />
        <link rel="stylesheet" href="assets/css/templatemo-style.css" />
        <link rel="stylesheet" href="assets/css/owl.css" />
        <link rel="stylesheet" href="assets/css/lightbox.css" />


        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/slick/slick.css" rel="stylesheet">
        <link href="lib/slick/slick-theme.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css1.css" rel="stylesheet">

    </head>

    <body>
        <div id="page-wraper">
            <!-- Sidebar Menu -->
            <div class="responsive-nav">
                <i class="fa fa-bars" id="menu-toggle"></i>
                <div id="menu" class="menu">
                    <i class="fa fa-times" id="menu-close"></i>
                    <div class="container">
                        <div class="image">
                            <a href="home"><img src="img/MY Song.png" alt="" /></a>
                        </div>
                        <div class="author-content">
                        </div>
                        <div class="main-nav" role="navigation">
                            <ul>
                                <li><a href="private">Cá nhân</a></li>
                                <li><a href="home">Home</a></li>
                                <li><a href="top">Xếp hạng</a></li>
                                <li><a href="type">Chủ đề</a></li>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>

            <section class="section about-me" >
                
          <!-- Nav Bar Start -->
        <div class="nav">
            <div class="container-fluid">
                <nav class="navbar navbar-expand-md bg-dark navbar-dark">
                    <a href="#" class="navbar-brand">MENU</a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto">
                            <a href="home" class="nav-item nav-link active">Home</a>
                       
                        </div>
                        <div class="navbar-nav ml-auto">
                            <% Account account = (Account) request.getAttribute("account");
                                        if (account != null) {
                                    %>
                                          <div class="nav-item dropdown">
                                <a href="private" class="nav-link dropdown-toggle" data-toggle="dropdown">${sessionScope.account.account}</a>
                                <div class="dropdown-menu">
                                    <a href="logout" class="dropdown-item">Logout</a>
                                    <a href="upsong" class="dropdown-item">Tải lên</a>
                                </div>
                            </div>
                                    <%
                                    } else {
                                    %>
                                         <div class="nav-item dropdown">
                                        <a href="Login" class="nav-link dropdown-toggle" data-toggle="dropdown">User Account</a>
                                        <div class="dropdown-menu">
                                            <a href="Login" class="dropdown-item">Login</a>
                                            <a href="register" class="dropdown-item">Register</a>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Nav Bar End -->      

              <!-- Bottom Bar Start -->
        <div class="bottom-bar">
            <div class="container-fluid">
                <div class="row align-items-center">

                    <div class="col-md-9">
                        <div class="search">
                            <form action="search" method="post">
                            <input type="text" placeholder="Search" name="search">
                            <button><i class="fa fa-search"></i></button>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="user">
                            <a href="wishlist.html" class="btn wishlist">
                                <i class="fa fa-heart"></i>
                              
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bottom Bar End -->    
                
                
                <% List<Song> song = (List<Song>) request.getAttribute("song");
                List<CaSi> singer = (List<CaSi>) request.getAttribute("singer");
                if(song==null && singer==null){
                    %>
                    <h3 style="color: #ffffff">Không tìm thấy</h3>
                <%
                }else{
                    %>
                    <c:forEach items="${requestScope.singer}" var="s">
                        <div class="container mt-5 mb-5">
                            <div class="d-flex justify-content-center row">
                                <div class="col-md-11">
                                    <div class="row p-2 bg-white border rounded">

                                        <div class="col-md-2 mt-1"><a href="singer?id=${s.NId}"><img class="img-fluid img-responsive rounded product-image" src="img/CaSi/${s.img}"></a></div>
                                        <div class="col-md-10 mt-1">
                                            <div class="mt-1 mb-1 spec-1">
                                                <a href="singer?id=${s.NId}"><h5>${s.name}</h5></a>
                                                
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>  
                    </c:forEach>
                    <c:forEach items="${requestScope.song}" var="s">
                        <div class="container mt-5 mb-5">
                            <div class="d-flex justify-content-center row">
                                <div class="col-md-11">
                                    <div class="row p-2 bg-white border rounded">

                                        <div class="col-md-2 mt-1"><a href="song?id=${s.SId}"><img class="img-fluid img-responsive rounded product-image" src="img/${s.img}"></a></div>
                                        <div class="col-md-10 mt-1">
                                            <div class="mt-1 mb-1 spec-1">
                                                <a href="song?id=${s.SId}"><h5>${s.name}</h5></a>
                                                    <span>${s.singer.name}</span>
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>  
                    </c:forEach>
                <%
                }
                %>



            </section>


        </div>



        <!-- Scripts -->
        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/isotope.min.js"></script>
        <script src="assets/js/owl-carousel.js"></script>
        <script src="assets/js/lightbox.js"></script>
        <script src="assets/js/custom.js"></script>
        <script>
            //according to loftblog tut
            $(".main-menu li:first").addClass("active");

            var showSection = function showSection(section, isAnimate) {
                var direction = section.replace(/#/, ""),
                        reqSection = $(".section").filter(
                        '[data-section="' + direction + '"]'
                        ),
                        reqSectionPos = reqSection.offset().top - 0;

                if (isAnimate) {
                    $("body, html").animate(
                            {
                                scrollTop: reqSectionPos
                            },
                            800
                            );
                } else {
                    $("body, html").scrollTop(reqSectionPos);
                }
            };

            var checkSection = function checkSection() {
                $(".section").each(function () {
                    var $this = $(this),
                            topEdge = $this.offset().top - 80,
                            bottomEdge = topEdge + $this.height(),
                            wScroll = $(window).scrollTop();
                    if (topEdge < wScroll && bottomEdge > wScroll) {
                        var currentId = $this.data("section"),
                                reqLink = $("a").filter("[href*=\\#" + currentId + "]");
                        reqLink
                                .closest("li")
                                .addClass("active")
                                .siblings()
                                .removeClass("active");
                    }
                });
            };

            $(".main-menu").on("click", "a", function (e) {
                e.preventDefault();
                showSection($(this).attr("href"), true);
            });

            $(window).scroll(function () {
                checkSection();
            });
        </script>
        <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/slick/slick.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>