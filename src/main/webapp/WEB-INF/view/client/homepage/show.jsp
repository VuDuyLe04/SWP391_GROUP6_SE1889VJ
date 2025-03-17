<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Rice Chicken</title>
    <meta name="description" content="">
    <meta name="keywords" content="">

    <!-- Favicons -->
<%--    <link href="/client/homepage/assets/img/favicon.png" rel="icon">--%>
<%--    <link href="/client/homepage/assets/img/apple-touch-icon.png" rel="apple-touch-icon">--%>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Ubuntu:ital,wght@0,300;0,400;0,500;0,700;1,300;1,400;1,500;1,700&display=swap"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="/client/homepage/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/client/homepage/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="/client/homepage/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="/client/homepage/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="/client/homepage/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Main CSS File -->
    <link href="/client/homepage/assets/css/main.css" rel="stylesheet">

    <!-- =======================================================
    * Template Name: eNno
    * Template URL: https://bootstrapmade.com/enno-free-simple-bootstrap-template/
    * Updated: Aug 07 2024 with Bootstrap v5.3.3
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->

    <style>
        .member .pic {
            width: 100%;
            height: 450px; /* Điều chỉnh chiều cao tùy theo yêu cầu */
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .member .pic img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Đảm bảo ảnh không bị méo, cắt bớt nếu cần */
        }
    </style>
</head>

<body class="index-page">

<jsp:include page="../layout/header.jsp" />

<main class="main">

    <!-- Hero Section -->
    <section id="hero" class="hero section">

        <div class="container">
            <div class="row gy-4">
                <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center" data-aos="fade-up">
                    <h1>Hệ thống quản lí cửa hàng bán gạo hàng đầu Việt Nam</h1>
                    <p>Chúng tôi là đội ngũ thiết kế tài năng, nhằm giải quyết bài toán quản lý cửa hàng bán gạo, cho các doanh nghiệp, cửa hàng.</p>
                    <div class="d-flex">
                        <a href="#about" class="btn-get-started">Bắt đầu tìm hiểu</a>
                        <a href="https://youtu.be/UgSCPpkzSvM?si=9crB7skezdgoy-Ur"
                           class="glightbox btn-watch-video d-flex align-items-center"><i class="bi bi-play-circle"></i><span>Xem video hướng dẫn sử dụng dịch vụ</span></a>
                    </div>
                </div>
                <div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-out" data-aos-delay="100">
                    <img src="/client/homepage/assets/img/gao.jpeg" class="img-fluid animated" alt="">
                </div>
            </div>
        </div>

    </section><!-- /Hero Section -->

    <!-- About Section -->
    <section id="about" class="about section">

        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
            <span>Chicken Rice<br></span>
            <h2>Tổng quát</h2>
            <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p>
        </div><!-- End Section Title -->

        <div class="container">

            <div class="row gy-4">
                <div class="col-lg-6 position-relative align-self-start" data-aos="fade-up" data-aos-delay="100">
                    <img src="/client/homepage/assets/img/about.png" class="img-fluid" alt="">
                    <a href="https://youtu.be/UgSCPpkzSvM?si=9crB7skezdgoy-Ur" class="glightbox pulsating-play-btn"></a>
                </div>
                <div class="col-lg-6 content" data-aos="fade-up" data-aos-delay="200">
                    <h3>Voluptatem dignissimos provident quasi corporis voluptates sit assumenda.</h3>
                    <p class="fst-italic">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                        labore et dolore
                        magna aliqua.
                    </p>
                    <ul>
                        <li><i class="bi bi-check2-all"></i> <span>Phí dịch vụ rẻ, hợp lí.</span>
                        </li>
                        <li><i class="bi bi-check2-all"></i> <span>Dễ dàng sử dụng, giao diện thân thiện.</span>
                        </li>
                        <li><i class="bi bi-check2-all"></i> <span>Giải quyết tồn vấn đề đang tồn đọng của quản lí truyền thống</span>
                        </li>
                    </ul>
                    <p>
                        Một hệ thống tốt
                    </p>
                </div>
            </div>

        </div>

    </section><!-- /About Section -->

    <!-- Stats Section -->
    <section id="stats" class="stats section">

        <div class="container" data-aos="fade-up" data-aos-delay="100">

            <div class="row gy-4">

                <div class="col-lg-6 col-md-6">
                    <div class="stats-item text-center w-100 h-100">
                        <span data-purecounter-start="0" data-purecounter-end="110" data-purecounter-duration="1"
                              class="purecounter"></span>
                        <p>Doanh nghiệp, cửa hàng</p>
                    </div>
                </div><!-- End Stats Item -->

                <div class="col-lg-6 col-md-6">
                    <div class="stats-item text-center w-100 h-100">
                        <span data-purecounter-start="0" data-purecounter-end="1000" data-purecounter-duration="1"
                              class="purecounter"></span>
                        <p>Người dùng</p>
                    </div>
                </div><!-- End Stats Item -->

<%--                <div class="col-lg-4 col-md-6">--%>
<%--                    <div class="stats-item text-center w-100 h-100">--%>
<%--                        <span data-purecounter-start="0" data-purecounter-end="70" data-purecounter-duration="1"--%>
<%--                              class="purecounter"></span>--%>
<%--                        <p>Sức lao động</p>--%>
<%--                    </div>--%>
<%--                </div><!-- End Stats Item -->--%>



            </div>

        </div>

    </section><!-- /Stats Section -->

    <!-- Services Section -->
    <section id="services" class="services section light-background">

        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
            <span>Chicken Rice</span>
            <h2>Dịch vụ</h2>
            <p>Chúng tôi cung cấp đa dạng nhiều gói dịch vụ cho các cửa hàng, doanh nghiệp.</p>
        </div><!-- End Section Title -->

        <div class="container">

            <div class="row gy-4">

                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
                    <div class="service-item position-relative">
                        <div class="icon">
                            <i class="bi bi-broadcast"></i>
                        </div>
                        <a href="#" class="stretched-link">
                            <h3>Gói 1 tháng</h3>
                        </a>
                        <p href="#" class="stretched-link">
                            <h4>199.000 đồng</h4>
                        </p>
                        <p>Gói trải nhiệm, để khách hàng có thể sử dụng hệ thống với chi phí rẻ.</p>
                    </div>
                </div><!-- End Service Item -->

                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
                    <div class="service-item position-relative">
                        <div class="icon">
                            <i class="bi bi-broadcast"></i>
                        </div>
                        <a href="#" class="stretched-link">
                            <h3>Gói 3 tháng</h3>
                        </a>
                        <p href="#" class="stretched-link">
                        <h4>499.000 đồng</h4>
                        </p>
                        <p>Gói trải nhiệm, để khách hàng có thể sử dụng hệ thống với chi phí rẻ.</p>
                    </div>
                </div><!-- End Service Item -->

                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
                    <div class="service-item position-relative">
                        <div class="icon">
                            <i class="bi bi-broadcast"></i>
                        </div>
                        <a href="#" class="stretched-link">
                            <h3>Gói 6 tháng</h3>
                        </a>
                        <p href="#" class="stretched-link">
                        <h4>899.000 đồng</h4>
                        </p>
                        <p>Gói trải nhiệm, để khách hàng có thể sử dụng hệ thống với chi phí rẻ.</p>
                    </div>
                </div><!-- End Service Item -->


            </div>

        </div>

    </section><!-- /Services Section -->


    <!-- Testimonials Section -->
    <section id="testimonials" class="testimonials section light-background">

        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
            <span>Chicken Rice</span>
            <h2>Lời nhận xét</h2>
            <p>Ứng dụng tốt</p>
        </div><!-- End Section Title -->

        <div class="container" data-aos="fade-up" data-aos-delay="100">

            <div class="swiper init-swiper" data-speed="600" data-delay="5000"
                 data-breakpoints="{ &quot;320&quot;: { &quot;slidesPerView&quot;: 1, &quot;spaceBetween&quot;: 40 }, &quot;1200&quot;: { &quot;slidesPerView&quot;: 3, &quot;spaceBetween&quot;: 40 } }">
                <script type="application/json" class="swiper-config">
                    {
                        "loop": true,
                        "speed": 600,
                        "autoplay": {
                            "delay": 5000
                        },
                        "slidesPerView": "auto",
                        "pagination": {
                            "el": ".swiper-pagination",
                            "type": "bullets",
                            "clickable": true
                        },
                        "breakpoints": {
                            "320": {
                                "slidesPerView": 1,
                                "spaceBetween": 40
                            },
                            "1200": {
                                "slidesPerView": 3,
                                "spaceBetween": 20
                            }
                        }
                    }
                </script>
                <div class="swiper-wrapper">

                    <div class="swiper-slide">
                        <div class="testimonial-item">
                        "="">
                        <p>
                            <i class=" bi bi-quote quote-icon-left"></i>
                            <span>Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper.</span>
                            <i class="bi bi-quote quote-icon-right"></i>
                        </p>
                        <img src="/client/homepage/assets/img/testimonials/testimonials-1.jpg" class="testimonial-img"
                             alt="">
                        <h3>Saul Goodman</h3>
                        <h4>Ceo &amp; Founder</h4>
                    </div>
                </div><!-- End testimonial item -->

                <div class="swiper-slide">
                    <div class="testimonial-item">
                        <p>
                            <i class="bi bi-quote quote-icon-left"></i>
                            <span>Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.</span>
                            <i class="bi bi-quote quote-icon-right"></i>
                        </p>
                        <img src="/client/homepage/assets/img/testimonials/testimonials-2.jpg" class="testimonial-img"
                             alt="">
                        <h3>Sara Wilsson</h3>
                        <h4>Designer</h4>
                    </div>
                </div><!-- End testimonial item -->

                <div class="swiper-slide">
                    <div class="testimonial-item">
                        <p>
                            <i class="bi bi-quote quote-icon-left"></i>
                            <span>Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.</span>
                            <i class="bi bi-quote quote-icon-right"></i>
                        </p>
                        <img src="/client/homepage/assets/img/testimonials/testimonials-3.jpg" class="testimonial-img"
                             alt="">
                        <h3>Jena Karlis</h3>
                        <h4>Store Owner</h4>
                    </div>
                </div><!-- End testimonial item -->

                <div class="swiper-slide">
                    <div class="testimonial-item">
                        <p>
                            <i class="bi bi-quote quote-icon-left"></i>
                            <span>Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos export minim fugiat dolor enim duis veniam ipsum anim magna sunt elit fore quem dolore labore illum veniam.</span>
                            <i class="bi bi-quote quote-icon-right"></i>
                        </p>
                        <img src="/client/homepage/assets/img/testimonials/testimonials-4.jpg" class="testimonial-img"
                             alt="">
                        <h3>Matt Brandon</h3>
                        <h4>Freelancer</h4>
                    </div>
                </div><!-- End testimonial item -->

                <div class="swiper-slide">
                    <div class="testimonial-item">
                        <p>
                            <i class="bi bi-quote quote-icon-left"></i>
                            <span>Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum quid.</span>
                            <i class="bi bi-quote quote-icon-right"></i>
                        </p>
                        <img src="/client/homepage/assets/img/testimonials/testimonials-5.jpg" class="testimonial-img"
                             alt="">
                        <h3>John Larson</h3>
                        <h4>Entrepreneur</h4>
                    </div>
                </div><!-- End testimonial item -->

            </div>
            <div class="swiper-pagination"></div>
        </div>

        </div>

    </section><!-- /Testimonials Section -->


    <!-- Team Section -->
    <section id="team" class="team section">

        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
            <span>Chicken Rice</span>
            <h2>Thành viên</h2>
            <p>Đội ngũ phát triển hệ thống của chúng tôi.</p>
        </div><!-- End Section Title -->

        <div class="container">

            <div class="row gy-5">

                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
                    <div class="member">
                        <div class="pic"><img src="/client/homepage/assets/img/team/le.jpg" class="img-fluid"
                                              alt=""></div>
                        <div class="member-info">
                            <h4>Vũ Duy Lê</h4>
                            <span>Project Manager, Leader</span>
                            <div class="social">
                                <a href=""><i class="bi bi-twitter-x"></i></a>
                                <a href=""><i class="bi bi-facebook"></i></a>
                                <a href=""><i class="bi bi-instagram"></i></a>
                                <a href=""><i class="bi bi-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div><!-- End Team Member -->

                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
                    <div class="member">
                        <div class="pic"><img src="/client/homepage/assets/img/team/nam.jpg" class="img-fluid"
                                              alt=""></div>
                        <div class="member-info">
                            <h4>Nam Hoàng</h4>
                            <span>Ăn hại đái khai</span>
                            <div class="social">
                                <a href=""><i class="bi bi-twitter-x"></i></a>
                                <a href=""><i class="bi bi-facebook"></i></a>
                                <a href=""><i class="bi bi-instagram"></i></a>
                                <a href=""><i class="bi bi-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div><!-- End Team Member -->

                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
                    <div class="member">
                        <div class="pic"><img src="/client/homepage/assets/img/team/thao.jpg" class="img-fluid"
                                              alt=""></div>
                        <div class="member-info">
                            <h4>Đinh Thị Thảo</h4>
                            <span>Ăn hại đái khai không khai bằng Nam</span>
                            <div class="social">
                                <a href=""><i class="bi bi-twitter-x"></i></a>
                                <a href=""><i class="bi bi-facebook"></i></a>
                                <a href=""><i class="bi bi-instagram"></i></a>
                                <a href=""><i class="bi bi-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div><!-- End Team Member -->

                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
                    <div class="member">
                        <div class="pic"><img src="/client/homepage/assets/img/team/huythanh.jpg" class="img-fluid"
                                              alt=""></div>
                        <div class="member-info">
                            <h4>Hồ Huy Thành</h4>
                            <span>Ăn hại đái khai không khai bằng Nam</span>
                            <div class="social">
                                <a href=""><i class="bi bi-twitter-x"></i></a>
                                <a href=""><i class="bi bi-facebook"></i></a>
                                <a href=""><i class="bi bi-instagram"></i></a>
                                <a href=""><i class="bi bi-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div><!-- End Team Member -->

                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
                    <div class="member">
                        <div class="pic"><img src="/client/homepage/assets/img/team/ducthanh.jpg" class="img-fluid"
                                              alt=""></div>
                        <div class="member-info">
                            <h4>Phạm Đức Thành</h4>
                            <span>Ăn hại đái khai không khai bằng Nam</span>
                            <div class="social">
                                <a href=""><i class="bi bi-twitter-x"></i></a>
                                <a href=""><i class="bi bi-facebook"></i></a>
                                <a href=""><i class="bi bi-instagram"></i></a>
                                <a href=""><i class="bi bi-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div><!-- End Team Member -->

                <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
                    <div class="member">
                        <div class="pic"><img src="/client/homepage/assets/img/team/khang.jpg" class="img-fluid"
                                              alt=""></div>
                        <div class="member-info">
                            <h4>Phạm Quang Khang</h4>
                            <span>Giảng viên hướng dẫn</span>
                            <div class="social">
                                <a href=""><i class="bi bi-twitter-x"></i></a>
                                <a href=""><i class="bi bi-facebook"></i></a>
                                <a href=""><i class="bi bi-instagram"></i></a>
                                <a href=""><i class="bi bi-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div><!-- End Team Member -->


            </div>

        </div>

    </section><!-- /Team Section -->

    <!-- Contact Section -->
    <section id="contact" class="contact section">

        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
            <span>Chicken rice</span>
            <h2>Liên hệ</h2>
            <p>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi, có thắc mắc vui lòng liên hệ thông tin dưới đây.</p>
        </div><!-- End Section Title -->

        <div class="container" data-aos="fade-up" data-aos-delay="100">

            <div class="row gy-4">

                <div class="col-lg-12">

                    <div class="info-wrap">
                        <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="200">
                            <i class="bi bi-geo-alt flex-shrink-0"></i>
                            <div>
                                <h3>Địa chỉ</h3>
                                <p>Đại học FPT Hà Nội</p>
                            </div>
                        </div><!-- End Info Item -->

                        <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="300">
                            <i class="bi bi-telephone flex-shrink-0"></i>
                            <div>
                                <h3>Gọi cho chúng tôi</h3>
                                <p>+84 8223 179 04</p>
                            </div>
                        </div><!-- End Info Item -->

                        <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="400">
                            <i class="bi bi-envelope flex-shrink-0"></i>
                            <div>
                                <h3>Email</h3>
                                <p>chickenrice@gmail.com</p>
                            </div>
                        </div><!-- End Info Item -->

                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4582.878677382485!2d105.52350832596944!3d21.01274168832721!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abc60e7d3f19%3A0x2be9d7d0b5abcbf4!2sFPT%20University!5e1!3m2!1sen!2s!4v1739900336821!5m2!1sen!2s"
                                frameborder="0" style="border:0; width: 100%; height: 270px;" allowfullscreen=""
                                loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>


            </div>

        </div>

    </section><!-- /Contact Section -->

</main>

<jsp:include page="../layout/footer.jsp" />

<!-- Scroll Top -->
<a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<!-- Preloader -->
<div id="preloader"></div>

<!-- Vendor JS Files -->
<script src="/client/homepage/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/client/homepage/assets/vendor/php-email-form/validate.js"></script>
<script src="/client/homepage/assets/vendor/aos/aos.js"></script>
<script src="/client/homepage/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="/client/homepage/assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="/client/homepage/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
<script src="/client/homepage/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="/client/homepage/assets/vendor/swiper/swiper-bundle.min.js"></script>

<!-- Main JS File -->
<script src="/client/homepage/assets/js/main.js"></script>

</body>

</html>