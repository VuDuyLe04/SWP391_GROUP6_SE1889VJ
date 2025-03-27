<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html class="fixed">
<head>
    <!-- Basic Meta -->
    <meta charset="UTF-8">
    <title>Doanh thu theo năm | JSOFT Admin</title>
    <meta name="keywords" content="HTML5 Admin Template" />
    <meta name="description" content="JSOFT Admin - Responsive HTML5 Template">
    <meta name="author" content="JSOFT.net">

    <!-- Mobile Meta -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

    <!-- Web Fonts -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light" rel="stylesheet" type="text/css">

    <!-- Vendor CSS -->
    <link rel="stylesheet" href="/client/auth/assets/vendor/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="/client/auth/assets/vendor/font-awesome/css/font-awesome.css" />
    <link rel="stylesheet" href="/client/auth/assets/vendor/magnific-popup/magnific-popup.css" />
    <link rel="stylesheet" href="/client/auth/assets/vendor/bootstrap-datepicker/css/datepicker3.css" />
    <link rel="stylesheet" href="/client/auth/assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css" />
    <link rel="stylesheet" href="/client/auth/assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css" />
    <link rel="stylesheet" href="/client/auth/assets/vendor/morris/morris.css" />

    <!-- Theme CSS -->
    <link rel="stylesheet" href="/client/auth/assets/stylesheets/theme.css" />

    <!-- Skin CSS -->
    <link rel="stylesheet" href="/client/auth/assets/stylesheets/skins/default.css" />

    <!-- Custom Theme CSS -->
    <link rel="stylesheet" href="/client/auth/assets/stylesheets/theme-custom.css">

    <!-- Head Libs -->
    <script src="/client/auth/assets/vendor/modernizr/modernizr.js"></script>
    <style>
        /* Main fixes for responsive layout */
        .inner-wrapper {
            padding-left: 0;
            transition: all 0.3s ease;
        }

        @media only screen and (min-width: 768px) {
            html.sidebar-left-collapsed .inner-wrapper {
                margin-left: 75px;
            }
        }

        /* Chart container styles */
        .panel {
            width: 100%;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 1px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            overflow: hidden;
        }

        .panel-heading {
            background-color: #f6f6f6;
            padding: 15px;
            border-bottom: 1px solid #e9e9e9;
        }

        .panel-body {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            width: 100%;
        }

        /* Chart container responsive */
        .chart-container {
            display: flex;
            flex-direction: column;
            width: 100%;
            gap: 20px;
        }

        .chart {
            width: 100%;
            height: 350px;
            background-color: #fff;
            border-radius: 3px;
            border: 1px solid #e9e9e9;
        }

        /* Year selection styles */
        #yearSelect {
            width: 150px;
            margin-bottom: 20px;
            align-self: flex-start;
        }

        /* Tooltip styles */
        .flot-tooltip {
            position: absolute;
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 5px;
            font-size: 12px;
            display: none;
            pointer-events: none;
            z-index: 100;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        /* Responsive design for tablets and desktops */
        @media only screen and (min-width: 768px) {
            .chart-container {
                flex-direction: row;
                flex-wrap: wrap;
                justify-content: space-between;
            }

            .chart {
                width: 48%;
            }
        }

        /* Small screens adjustments */
        @media only screen and (max-width: 767px) {
            .panel-body {
                padding: 10px;
            }

            #yearSelect {
                width: 100%;
            }
        }

        /* Fix content being cut off on smaller screens */
        .content-body {
            padding: 15px;
        }

        /* Fix sidebar toggle functionality */
        @media only screen and (max-width: 767px) {
            html.sidebar-left-opened .sidebar-left {
                margin-left: 0;
            }

            html.no-overflowscrolling.sidebar-left-opened,
            html.no-overflowscrolling.sidebar-left-opened body {
                overflow: hidden;
            }
        }
    </style>
</head>
<body>
<section class="body">
    <!-- start: header -->
    <jsp:include page="../layout/header.jsp" />
    <!-- end: header -->

    <div class="inner-wrapper">
        <!-- start: sidebar -->
        <jsp:include page="../layout/sidebar.jsp" />
        <!-- end: sidebar -->

        <section role="main" class="content-body">
            <div class="row">
                <div class="col-md-12">
                    <section class="panel">
                        <header class="panel-heading">
                            <div class="panel-actions">
                                <a href="#" class="fa fa-caret-down"></a>
                                <a href="#" class="fa fa-times"></a>
                            </div>
                            <h2 class="panel-title">Doanh thu theo năm</h2>
                            <p class="panel-subtitle">Xem biểu đồ doanh thu của cửa hàng theo từng năm</p>
                        </header>
                        <div class="panel-body">
                            <!-- Dropdown chọn năm -->
                            <div class="form-group">
                                <label for="yearSelect">Chọn năm:</label>
                                <select id="yearSelect" class="form-control">
                                    <option value="2020">2020</option>
                                    <option value="2021">2021</option>
                                    <option value="2022">2022</option>
                                    <option value="2023">2023</option>
                                    <option value="2024">2024</option>
                                    <option value="2025" selected>2025</option>
                                </select>
                            </div>

                            <!-- Container cho biểu đồ đường và biểu đồ cột -->
                            <div class="chart-container">
                                <!-- Biểu đồ đường -->
                                <div class="chart" id="flotDashBasic"></div>

                                <!-- Biểu đồ cột -->
                                <div class="chart" id="flotBarChart"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-3 text-center">
                                <a href="/stores" class="btn btn-primary">Quay lại</a>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </section>
    </div>
</section>

<!-- Vendor JS -->
<script src="/client/auth/assets/vendor/jquery/jquery.js"></script> <!-- jQuery -->
<script src="/client/auth/assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
<script src="/client/auth/assets/vendor/bootstrap/js/bootstrap.js"></script>
<script src="/client/auth/assets/vendor/nanoscroller/nanoscroller.js"></script>
<script src="/client/auth/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="/client/auth/assets/vendor/magnific-popup/magnific-popup.js"></script>
<script src="/client/auth/assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>

<!-- Flot.js -->
<script src="/client/auth/assets/vendor/flot/jquery.flot.js"></script> <!-- Flot chart library -->
<script src="/client/auth/assets/vendor/flot/jquery.flot.resize.js"></script> <!-- For responsive charts -->

<!-- Custom JS -->
<script src="/client/auth/assets/javascripts/theme.js"></script>
<script src="/client/auth/assets/javascripts/theme.custom.js"></script>
<script src="/client/auth/assets/javascripts/theme.init.js"></script>

<script>
    $(document).ready(function() {
        // Get storeId from URL path
        const pathParts = window.location.pathname.split('/');
        const storeId = pathParts[2];
        console.log("Store ID: ", storeId);

        // Set default year
        $('#yearSelect').val('2025');

        // Tooltip function for charts
        function showTooltip(x, y, contents) {
            $('<div class="flot-tooltip">' + contents + '</div>')
                .css({
                    top: y + 5,
                    left: x + 5
                })
                .appendTo("body")
                .fadeIn(200);
        }

        // Handle window resize for responsive charts
        $(window).on('resize', function() {
            if (window.flotLineChart) {
                window.flotLineChart.resize();
                window.flotLineChart.setupGrid();
                window.flotLineChart.draw();
            }
            if (window.flotBarChart) {
                window.flotBarChart.resize();
                window.flotBarChart.setupGrid();
                window.flotBarChart.draw();
            }
        });

        // Function to load revenue data and display charts
        function loadRevenueData(storeId, year) {
            fetch(`http://localhost:8080/api/v1/revenue-store/` + storeId, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({
                    year: year,
                    periodType: 'YEAR'
                })
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    if (data.revenueDetails && data.revenueDetails.length > 0) {
                        // Prepare data for line chart
                        let lineChartData = [
                            {
                                data: data.revenueDetails.map(detail => [detail.month - 1, detail.revenue]),
                                label: "Doanh thu",
                                color: "#0088cc"
                            }
                        ];

                        // Draw line chart
                        window.flotLineChart = $.plot("#flotDashBasic", lineChartData, {
                            series: {
                                lines: { show: true, lineWidth: 2 },
                                points: { show: true, radius: 4 }
                            },
                            grid: {
                                hoverable: true,
                                clickable: true,
                                borderColor: "#e9e9e9",
                                borderWidth: 1,
                                backgroundColor: { colors: ["#fff", "#fcfcfc"] }
                            },
                            xaxis: {
                                ticks: [
                                    [0, "January"], [1, "February"], [2, "March"], [3, "April"],
                                    [4, "May"], [5, "June"], [6, "July"], [7, "August"],
                                    [8, "September"], [9, "October"], [10, "November"], [11, "December"]
                                ],
                                font: {
                                    size: 11,
                                    family: "'Open Sans', sans-serif"
                                }
                            },
                            yaxis: {
                                font: {
                                    size: 11,
                                    family: "'Open Sans', sans-serif"
                                }
                            }
                        });

                        // Add hover handler for line chart
                        $("#flotDashBasic").bind("plothover", function (event, pos, item) {
                            if (item) {
                                var month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                                var revenue = item.datapoint[1].toLocaleString('vi-VN');
                                var content = "<strong>" + month[item.dataIndex] + "</strong>: " + revenue + " VND";
                                showTooltip(item.pageX, item.pageY, content);
                            } else {
                                $(".flot-tooltip").remove();
                            }
                        });

                        // Prepare data for bar chart
                        let barChartData = [
                            {
                                data: data.revenueDetails.map(detail => [detail.month - 1, detail.revenue]),
                                label: "Doanh thu",
                                color: "#2a8cc4"
                            }
                        ];

                        // Draw bar chart
                        window.flotBarChart = $.plot("#flotBarChart", barChartData, {
                            series: {
                                bars: {
                                    show: true,
                                    barWidth: 0.6,
                                    align: "center",
                                    fill: 0.8
                                }
                            },
                            grid: {
                                hoverable: true,
                                clickable: true,
                                borderColor: "#e9e9e9",
                                borderWidth: 1,
                                backgroundColor: { colors: ["#fff", "#fcfcfc"] }
                            },
                            xaxis: {
                                ticks: [
                                    [0, "January"], [1, "February"], [2, "March"], [3, "April"],
                                    [4, "May"], [5, "June"], [6, "July"], [7, "August"],
                                    [8, "September"], [9, "October"], [10, "November"], [11, "December"]
                                ],
                                font: {
                                    size: 11,
                                    family: "'Open Sans', sans-serif"
                                }
                            },
                            yaxis: {
                                font: {
                                    size: 11,
                                    family: "'Open Sans', sans-serif"
                                }
                            }
                        });

                        // Add hover handler for bar chart
                        $("#flotBarChart").bind("plothover", function (event, pos, item) {
                            if (item) {
                                var month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
                                var revenue = item.datapoint[1].toLocaleString('vi-VN');
                                var content = "<strong>" + month[item.dataIndex] + "</strong>: " + revenue + " VND";
                                showTooltip(item.pageX, item.pageY, content);
                            } else {
                                $(".flot-tooltip").remove();
                            }
                        });
                    } else {
                        console.error("Không có dữ liệu doanh thu hoặc dữ liệu rỗng.");
                        $("#flotDashBasic, #flotBarChart").html("<div class='alert alert-info'>Không có dữ liệu doanh thu cho năm " + year + "</div>");
                    }
                })
                .catch(error => {
                    console.error("Lỗi khi lấy dữ liệu từ API:", error);
                    $("#flotDashBasic, #flotBarChart").html("<div class='alert alert-danger'>Lỗi khi tải dữ liệu. Vui lòng thử lại sau.</div>");
                });
        }

        // Load revenue data for default year (2025)
        loadRevenueData(storeId, 2025);

        // Update charts when user changes year
        $('#yearSelect').change(function() {
            var selectedYear = $(this).val();
            loadRevenueData(storeId, selectedYear);
        });

        // Handle sidebar toggle for small screens
        $(".sidebar-toggle").on("click", function() {
            if ($(window).width() < 768) {
                $("html").toggleClass("sidebar-left-opened");
            }
        });
    });
</script>

</body>
</html>