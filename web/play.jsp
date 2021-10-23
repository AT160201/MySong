<%-- 
    Document   : index
    Created on : Jul 8, 2021, 4:07:21 AM
    Author     : ADMIN
--%>

<%@page import="model.Account"%>
<%@page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Song" %>
<%@page import="model.CaSi" %>
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
        <link href="style.css" rel="stylesheet">
        <link href="css1.css" rel="stylesheet">
    </head>

    <body>


        <% List<Song> list = (List<Song>) request.getAttribute("list");
            Song song = (Song) request.getAttribute("song");
            int index = 0;
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getSId() == song.getSId()) {
                    index = i;
                }
            }
        %>
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
                                <li><a href="home">Khám phá</a></li>
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
                                        <a href="login" class="nav-link dropdown-toggle" data-toggle="dropdown">User Account</a>
                                        <div class="dropdown-menu">
                                            <a href="Login" class="dropdown-item">Login</a>
                                            <a href="register" class="dropdown-item">Register</a>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
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
                                    <input type="text" placeholder="Search">
                                    <button><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="user">
                                    <a href="private" class="btn wishlist">
                                        <i class="fa fa-heart"></i>
                                        
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- Footer Bottom Start -->
                <div class="footer-bottom">
                    <div class="container">
                        <div class="row">

                            <div class="main">

                                <!--- left part --->
                                <div class="left">

                                    <!--- song img --->
                                    <img id="track_image" src="img/img1.jpg">


                                </div>


                                <!--- right part --->
                                <div class="right">

                                    <!--- song title & artist name --->
                                    <p id="title">title.mp3</p>
                                    <p id="artist">Artist name</p>

                                    <!--- middle part --->
                                    <div class="middle">
                                        <% if (index == 0) {%>
                                        <a href="song?id=<%=list.get(list.size() - 1).getSId()%>"><i class="fa fa-step-backward" aria-hidden="true"></i></a>
                                            <%
                                            } else {
                                            %>
                                        <a href="song?id=<%=list.get(index - 1).getSId()%>"><i class="fa fa-step-backward" aria-hidden="true"></i></a>
                                            <% }
                                            %>
                                        <button onclick="justplay()" id="play"><i class="fa fa-play" aria-hidden="true"></i></button>
                                            <% if (index == list.size() - 1) {
                                            %>
                                        <a href="song?id=<%=list.get(0).getSId()%>"><i class="fa fa-step-forward" aria-hidden="true"></i></button></a>
                                        <% } else {
                                        %>
                                        <a href="song?id=<%=list.get(index + 1).getSId()%>"><i class="fa fa-step-forward" aria-hidden="true"></i></button></a>
                                        <% }%>
                                    </div>

                                    <!--- song duration part --->
                                    <div class="duration">
                                        <input type="range" min="0" max="100" value="0" id="duration_slider" onchange="change_duration()">
                                    </div>
                                    <button id="auto" onclick="autoplay_switch()">Auto play <i class="fa fa-circle-o-notch" aria-hidden="true"></i></button>
                                </div>

                            </div>


                        </div>
                    </div>


                    <!--Danh sach-->

                    <c:forEach items="${requestScope.list}" var="s">
                        <div class="container mt-5 mb-5">
                            <div class="d-flex justify-content-center row">
                                <div class="col-md-11">
                                    <div class="row p-2 bg-white border rounded">

                                        <div class="col-md-2 mt-1"><a href="song?id=${s.SId}"><img class="img-fluid img-responsive rounded product-image" src="img/${s.img}"></a></div>
                                        <div class="col-md-9 mt-1">
                                            <div class="mt-1 mb-1 spec-1">
                                                <a href="song?id=${s.SId}"><h5>${s.name}</h5></a> <span>Lượt Vote: ${s.luotVode}</span>
                                                <span>Lượt Nghe: ${s.luotNghe}</span><br>
                                                <span>${s.singer.name}</span>
                                                
                                            </div>

                                        </div>

                                        <div class="col-md-1 mt-1">
                                            <a href="list_add?sid=${s.SId}">add</a><br/>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>  
                    </c:forEach>                                    


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
        <script>

                                        let previous = document.querySelector('#pre');
                                        let play = document.querySelector('#play');
                                        let next = document.querySelector('#next');
                                        let title = document.querySelector('#title');
                                        let recent_volume = document.querySelector('#volume');
                                        let volume_show = document.querySelector('#volume_show');
                                        let slider = document.querySelector('#duration_slider');
                                        let show_duration = document.querySelector('#show_duration');
                                        let track_image = document.querySelector('#track_image');
                                        let auto_play = document.querySelector('#auto');
                                        let present = document.querySelector('#present');
                                        let total = document.querySelector('#total');
                                        let artist = document.querySelector('#artist');



                                        let timer;
                                        let autoplay = 0;

                                        let index_no = 0;
                                        let Playing_song = false;

//create a audio Element
                                        let track = document.createElement('audio');





// All functions


// function load the track
                                        function load_track(index_no) {
                                            clearInterval(timer);
                                            reset_slider();

                                            track.src = "${song.mp3}";
                                            title.innerHTML = "${song.name}";
                                            track_image.src = "img/${song.img}";
                                            artist.innerHTML = "${song.singer.name}";
                                            track.load();

                                            timer = setInterval(range_slider, 1000);
                                        }

                                        load_track(index_no);


//mute sound function
                                        function mute_sound() {
                                            track.volume = 0;
                                            volume.value = 0;
                                            volume_show.innerHTML = 0;
                                        }


// checking.. the song is playing or not
                                        function justplay() {
                                            if (Playing_song == false) {
                                                playsong();

                                            } else {
                                                pausesong();
                                            }
                                        }


// reset song slider
                                        function reset_slider() {
                                            slider.value = 0;
                                        }

// play song
                                        function playsong() {
                                            track.play();
                                            Playing_song = true;
                                            play.innerHTML = '<i class="fa fa-pause" aria-hidden="true"></i>';
                                        }

//pause song
                                        function pausesong() {
                                            track.pause();
                                            Playing_song = false;
                                            play.innerHTML = '<i class="fa fa-play" aria-hidden="true"></i>';
                                        }


// change volume
                                        function volume_change() {
                                            volume_show.innerHTML = recent_volume.value;
                                            track.volume = recent_volume.value / 100;
                                        }

// change slider position 
                                        function change_duration() {
                                            slider_position = track.duration * (slider.value / 100);
                                            track.currentTime = slider_position;
                                        }

// autoplay function
                                        function autoplay_switch() {
                                            if (autoplay == 1) {
                                                autoplay = 0;
                                                auto_play.style.background = "rgba(255,255,255,0.2)";
                                            } else {
                                                autoplay = 1;
                                                auto_play.style.background = "#FF8A65";
                                            }
                                        }


                                        function range_slider() {
                                            let position = 0;

                                            // update slider position
                                            if (!isNaN(track.duration)) {
                                                position = track.currentTime * (100 / track.duration);
                                                slider.value = position;
                                            }


                                            // function will run when the song is over
                                            if (track.ended) {
                                                play.innerHTML = '<i class="fa fa-play" aria-hidden="true"></i>';
                                                if (autoplay == 1) {
                                                    index_no += 1;
                                                    load_track(index_no);
                                                    playsong();
                                                }
                                            }
                                        }
        </script>

    </body>
</html>
