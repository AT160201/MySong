<%-- 
    Document   : index
    Created on : Jul 8, 2021, 4:07:21 AM
    Author     : ADMIN
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Account" %>
<!DOCTYPE html>
<html lang="en">
    <head>
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

        <title>My Song</title>
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
                                    <div class="nav-item dropdown">
                                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">${sessionScope.account.account}</a>
                                        <div class="dropdown-menu">
                                            <a href="logout" class="dropdown-item">Logout</a>
                                            <a href="upsong" class="dropdown-item">Tải lên</a>
                                        </div>
                                    </div>
                                </div>
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
                                    <form action="search" method="get">
                                        <input type="text" placeholder="Search" name="search">
                                        <button><i class="fa fa-search"></i></button>
                                    </form>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="user">
                                    <a href="wishlist.html" class="btn wishlist">
                                        <i class="fa fa-heart"></i>
                                        <span>(0)</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Bottom Bar End -->     



                <h1 style="margin: auto">${sessionScope.account.account}</h1>

                <div class="nav">
                    <div class="container-fluid">

                        <nav class="navbar navbar-expand-md bg-dark navbar-dark">

                            <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                                <div class="navbar-nav mr-auto">
                                    <a href="private" class="nav-item nav-link active">My List</a>
                                    <a href="upsong" class="nav-item nav-link">Đã tải lên</a>
                                    <a href="add" class="nav-item nav-link">Tải lên</a>

                                </div>



                            </div>
                        </nav>



                    </div>
                </div>
                <!-- Nav Bar End -->   

                <div class="signin-form">
                    <h2 class="form-title">Thêm bài hát mới</h2>
                    <form action="add" method="post" class="register-form" id="login-form">
                        <div class="form-group">
                            <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                           Tên bài hát: <input type="text" name="name" id="your_name" placeholder="Tên bài hát"/>
                        </div>
                        <div class="form-group">
                            <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                           Tên Ca sĩ:  <input type="text" name="cs" id="your_pass" placeholder="Tên Ca sĩ"/>
                        </div>
                         <div class="form-group">
                            <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                            MP3:  <input type="text" name="img" id="your_pass" placeholder="MP3"/>
                        </div>
                         <div class="form-group">
                            <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                            Image:  <input type="text" name="img" id="your_pass" placeholder="Image"/>
                        </div>
                       <div class="form-group">
                            <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                            Date:  <input type="text" name="img" id="your_pass" placeholder="date"/> (yyyy-dd-mm)
                        </div>
                        <div class="form-group form-button">
                            <input type="submit" name="signin" id="signin" class="form-submit" value="Add"/>
                        </div>
                    </form>

                </div>


                <!-- Footer Start -->
                <div class="footer">



                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-6 col-md-6">
                                <div class="footer-widget">

                                    <div class="contact-info">

                                        <div class="social">

                                            <a href="https://www.facebook.com/AT160201/"><i class="fab fa-facebook-f"></i></a>

                                            <a href=""><i class="fab fa-instagram"></i></a>
                                            <a href=""><i class="fab fa-youtube"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6 col-md-6">
                                <div class="footer-widget">
                                    <ul>
                                        <li><a href="#">Nguyễn Thu Tươi</a></li><br/>
                                        <li><a href="#">HE150022</a></li><br/>
                                        <li><a href="#">Đại học FPT</a></li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Footer Bottom Start -->
                <div class="footer-bottom">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 copyright">
                                <p>Copyright &copy; <a href="https://htmlcodex.com">HTML Codex</a>. All Rights Reserved</p>
                            </div>

                            <div class="col-md-6 template-by">
                                <p>Template By <a href="https://www.facebook.com/AT160201/"> AT</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Footer Bottom End -->  
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
