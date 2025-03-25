<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html class="fixed">
  <head>
    <!-- Basic -->
    <meta charset="UTF-8" />

    <title>Danh sách khu vực</title>
    <meta name="keywords" content="HTML5 Admin Template" />
    <meta
      name="description"
      content="JSOFT Admin - Responsive HTML5 Template"
    />
    <meta name="author" content="JSOFT.net" />

    <!-- Mobile Metas -->
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"
    />

    <!-- Web Fonts  -->
    <link
      href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800|Shadows+Into+Light"
      rel="stylesheet"
      type="text/css"
    />

    <!-- Vendor CSS -->
    <link
      rel="stylesheet"
      href="/client/auth/assets/vendor/bootstrap/css/bootstrap.css"
    />
    <link
      rel="stylesheet"
      href="/client/auth/assets/vendor/font-awesome/css/font-awesome.css"
    />
    <link
      rel="stylesheet"
      href="/client/auth/assets/vendor/magnific-popup/magnific-popup.css"
    />
    <link
      rel="stylesheet"
      href="/client/auth/assets/vendor/bootstrap-datepicker/css/datepicker3.css"
    />

    <!-- Specific Page Vendor CSS -->
    <link
      rel="stylesheet"
      href="/client/auth/assets/vendor/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.css"
    />
    <link
      rel="stylesheet"
      href="/client/auth/assets/vendor/bootstrap-multiselect/bootstrap-multiselect.css"
    />
    <link
      rel="stylesheet"
      href="/client/auth/assets/vendor/morris/morris.css"
    />

    <!-- Theme CSS -->
    <link rel="stylesheet" href="/client/auth/assets/stylesheets/theme.css" />

    <!-- Skin CSS -->
    <link
      rel="stylesheet"
      href="/client/auth/assets/stylesheets/skins/default.css"
    />

    <!-- Theme Custom CSS -->
    <link
      rel="stylesheet"
      href="/client/auth/assets/stylesheets/theme-custom.css"
    />

    <!-- Head Libs -->
    <script src="/client/auth/assets/vendor/modernizr/modernizr.js"></script>

    <style>
      .add-warehouse {
        color: white !important;
        text-decoration: none;
      }

      .panel-heading {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
      }

      .search-container {
        position: relative;
        display: flex;
        align-items: center;
        width: 300px;
      }

      .search-input {
        width: 100%;
        border-radius: 20px;
        padding-left: 35px;
      }

      .search-icon {
        position: absolute;
        left: 10px;
        color: gray;
      }

      .btn-primary {
        white-space: nowrap; /* Giữ chữ không bị xuống dòng */
      }

      .search-container {
        position: relative;
        display: flex;
        align-items: center;
        width: 350px;
      }

      .search-input {
        flex: 1;
        border-radius: 20px;
        padding-left: 10px;
      }

      .search-btn {
        margin-left: 5px;
        border-radius: 20px;
        padding: 5px 15px;
      }

      .panel-featured-primary {
        border-color: #0088cc;
      }
      .panel-featured-primary .panel-heading {
        background-color: #0088cc;
        color: #fff;
        border-radius: 5px 5px 0 0;
      }
      .input-group-addon {
        background-color: #0088cc;
        color: #fff;
        border-color: #0088cc;
      }
      .table > thead > tr > th {
        background-color: #f5f5f5;
        border-bottom: 2px solid #0088cc;
      }
      .btn-primary {
        background-color: #0088cc;
        border-color: #0088cc;
      }
      .btn-primary:hover {
        background-color: #006699;
        border-color: #006699;
      }
      .label-sm {
        font-size: 90%;
        padding: 3px 8px;
      }
      .mr-xs {
        margin-right: 5px;
      }
      .mb-xs {
        margin-bottom: 5px;
      }
      .mt-xs {
        margin-top: 5px;
      }
      .pagination {
        margin: 20px auto;
        display: inline-flex;
        justify-content: center;
        padding-left: 0;
      }
      .pagination .page-item {
        margin: 0 2px;
      }
      .pagination .page-link {
        border-radius: 3px;
        padding: 6px 12px;
        color: #0088cc;
        background-color: #fff;
        border: 1px solid #ddd;
      }
      .pagination .page-item.active .page-link {
        background-color: #0088cc;
        border-color: #0088cc;
        color: #fff;
      }
      .pagination .page-item.disabled .page-link {
        color: #777;
        pointer-events: none;
        background-color: #fff;
        border-color: #ddd;
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
          <header class="page-header">
            <h2>Danh sách khu vực</h2>

            <div class="right-wrapper pull-right">
              <ol class="breadcrumbs">
                <li>
                  <a href="/">
                    <i class="fa fa-home"></i>
                  </a>
                </li>
                <li><span>Danh sách khu vực</span></li>
              </ol>

              <a class="sidebar-right-toggle" data-open="sidebar-right"
                ><i class="fa fa-chevron-left"></i
              ></a>
            </div>
          </header>

          <!-- start: page -->

          <div class="row">
            <div class="col-md-12">
              <section class="panel panel-featured panel-featured-primary">
                <header class="panel-heading">
                  <div class="panel-actions">
                    <a
                      href="#"
                      class="panel-action panel-action-toggle"
                      data-panel-toggle
                    ></a>
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <h2 class="panel-title">
                        <i class="fa fa-list-alt mr-xs"></i>Danh sách khu vực
                      </h2>
                    </div>
                    <div class="col-sm-6">
                      <div class="pull-right">
                        <div class="input-group input-search">
                          <input
                            type="text"
                            id="searchInput"
                            class="form-control"
                            placeholder="Tìm kiếm khu vực..."
                          />
                          <span class="input-group-btn">
                            <button
                              class="btn btn-primary"
                              type="button"
                              onclick="searchWarehouses()"
                            >
                              <i class="fa fa-search"></i>
                            </button>
                          </span>
                        </div>
                      </div>
                    </div>
                  </div>
                </header>

                <div class="panel-body">
                  <div class="row mb-md">
                    <div class="col-sm-6">
                      <!-- Có thể thêm các filter nếu cần -->
                    </div>
                    <div class="col-sm-6">
                      <div class="pull-right">
                        <a
                          href="/warehouse/create"
                          class="btn btn-primary mb-xs mt-xs mr-xs"
                        >
                          <i class="fa fa-plus mr-xs"></i>Tạo khu vực mới
                        </a>
                      </div>
                    </div>
                  </div>

                  <div class="table-responsive">
                    <!-- Total Info Section -->


                    <table
                      class="table table-bordered table-striped table-hover mb-none"
                    >
                      <thead>
                        <tr>
                          <th class="text-center" style="width: 50px">ID</th>
                          <th>
                            <i class="fa fa-building mr-xs"></i>Tên khu vực
                          </th>
                          <th><i class="fa fa-store mr-xs"></i>Cửa hàng</th>
                          <th class="text-center" style="width: 200px">
                            <i class="fa fa-cogs mr-xs"></i>Hoạt động
                          </th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${listWareHouse}" var="warehouse">
                          <tr>
                            <td class="text-center">${warehouse.id}</td>
                            <td><strong>${warehouse.name}</strong></td>
                            <td>${warehouse.storeName}</td>
                            <td class="text-center">
                              <a
                                href="/warehouse/update/${warehouse.id}"
                                class="btn btn-primary btn-sm"
                                title="Cập nhật"
                              >
                                <i class="fa fa-pencil"></i>
                              </a>
                              <a
                                href="/warehouse/detail/${warehouse.id}"
                                class="btn btn-info btn-sm"
                                title="Chi tiết"
                              >
                                <i class="fa fa-eye"></i>
                              </a>
                            </td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>

                    <!-- Phân trang -->
                    <div
                      style="
                        display: flex;
                        justify-content: center;
                        margin-top: 20px;
                      "
                    >
                      <c:if test="${totalPages > 1}">
                        <ul class="pagination">
                          <li
                            class="page-item ${currentPage == 1 ? 'disabled' : ''}"
                          >
                            <a
                              class="page-link"
                              href="/fetch-all-warehouse?page=${currentPage - 1}"
                            >
                              <i class="fa fa-angle-left"></i> Trước
                            </a>
                          </li>

                          <li class="page-item active">
                            <span class="page-link">${currentPage}</span>
                          </li>

                          <li
                            class="page-item ${currentPage == totalPages ? 'disabled' : ''}"
                          >
                            <a
                              class="page-link"
                              href="/fetch-all-warehouse?page=${currentPage + 1}"
                            >
                              Sau <i class="fa fa-angle-right"></i>
                            </a>
                          </li>
                        </ul>
                      </c:if>
                    </div>
                  </div>
                </div>
              </section>
            </div>
          </div>
          <!-- end: page -->
        </section>
      </div>
    </section>

    <!-- Vendor -->
    <script src="/client/auth/assets/vendor/jquery/jquery.js"></script>
    <script src="/client/auth/assets/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
    <script src="/client/auth/assets/vendor/bootstrap/js/bootstrap.js"></script>
    <script src="/client/auth/assets/vendor/nanoscroller/nanoscroller.js"></script>
    <script src="/client/auth/assets/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="/client/auth/assets/vendor/magnific-popup/magnific-popup.js"></script>
    <script src="/client/auth/assets/vendor/jquery-placeholder/jquery.placeholder.js"></script>

    <!-- Specific Page Vendor -->
    <script src="/client/auth/assets/vendor/jquery-ui/js/jquery-ui-1.10.4.custom.js"></script>
    <script src="/client/auth/assets/vendor/jquery-ui-touch-punch/jquery.ui.touch-punch.js"></script>
    <script src="/client/auth/assets/vendor/jquery-appear/jquery.appear.js"></script>
    <script src="/client/auth/assets/vendor/bootstrap-multiselect/bootstrap-multiselect.js"></script>
    <script src="/client/auth/assets/vendor/jquery-easypiechart/jquery.easypiechart.js"></script>
    <script src="/client/auth/assets/vendor/flot/jquery.flot.js"></script>
    <script src="/client/auth/assets/vendor/flot-tooltip/jquery.flot.tooltip.js"></script>
    <script src="/client/auth/assets/vendor/flot/jquery.flot.pie.js"></script>
    <script src="/client/auth/assets/vendor/flot/jquery.flot.categories.js"></script>
    <script src="/client/auth/assets/vendor/flot/jquery.flot.resize.js"></script>
    <script src="/client/auth/assets/vendor/jquery-sparkline/jquery.sparkline.js"></script>
    <script src="/client/auth/assets/vendor/raphael/raphael.js"></script>
    <script src="/client/auth/assets/vendor/morris/morris.js"></script>
    <script src="/client/auth/assets/vendor/gauge/gauge.js"></script>
    <script src="/client/auth/assets/vendor/snap-svg/snap.svg.js"></script>
    <script src="/client/auth/assets/vendor/liquid-meter/liquid.meter.js"></script>
    <script src="/client/auth/assets/vendor/jqvmap/jquery.vmap.js"></script>
    <script src="/client/auth/assets/vendor/jqvmap/data/jquery.vmap.sampledata.js"></script>
    <script src="/client/auth/assets/vendor/jqvmap/maps/jquery.vmap.world.js"></script>
    <script src="/client/auth/assets/vendor/jqvmap/maps/continents/jquery.vmap.africa.js"></script>
    <script src="/client/auth/assets/vendor/jqvmap/maps/continents/jquery.vmap.asia.js"></script>
    <script src="/client/auth/assets/vendor/jqvmap/maps/continents/jquery.vmap.australia.js"></script>
    <script src="/client/auth/assets/vendor/jqvmap/maps/continents/jquery.vmap.europe.js"></script>
    <script src="/client/auth/assets/vendor/jqvmap/maps/continents/jquery.vmap.north-america.js"></script>
    <script src="/client/auth/assets/vendor/jqvmap/maps/continents/jquery.vmap.south-america.js"></script>

    <!-- Theme Base, Components and Settings -->
    <script src="/client/auth/assets/javascripts/theme.js"></script>

    <!-- Theme Custom -->
    <script src="/client/auth/assets/javascripts/theme.custom.js"></script>

    <!-- Theme Initialization Files -->
    <script src="/client/auth/assets/javascripts/theme.init.js"></script>

    <!-- Examples -->
    <script src="/client/auth/assets/javascripts/dashboard/examples.dashboard.js"></script>

    <script>
      function searchWarehouses() {
        let searchValue = document.getElementById("searchInput").value.trim();
        if (searchValue) {
          window.location.href =
            "/warehouse/search?name=" + encodeURIComponent(searchValue);
        } else {
          alert("Vui lòng nhập từ khóa tìm kiếm!");
        }
      }
    </script>
  </body>
</html>
