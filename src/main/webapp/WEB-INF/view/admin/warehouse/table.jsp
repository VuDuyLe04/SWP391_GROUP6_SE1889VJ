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
            <div class="col-lg-12">
              <section class="panel">
                <header
                  class="panel-heading d-flex justify-content-between align-items-center"
                >
                  <!-- Ô tìm kiếm -->
                  <div class="search-container">
                    <input
                      type="text"
                      id="searchInput"
                      class="form-control search-input"
                      placeholder="Tìm kiếm khu vực..."
                    />
                    <button
                      class="btn btn-primary search-btn"
                      onclick="searchWarehouses()"
                    >
                      <i class="fa fa-search"></i> Tìm kiếm
                    </button>
                  </div>

                  <script>
                    function searchWarehouses() {
                      let searchValue = document
                        .getElementById("searchInput")
                        .value.trim();
                      if (searchValue) {
                        window.location.href =
                          "/warehouse/search?name=" +
                          encodeURIComponent(searchValue);
                      } else {
                        alert("Vui lòng nhập từ khóa tìm kiếm!");
                      }
                    }
                  </script>

                  <!-- Nút tạo khu vực mới -->
                  <a href="/warehouse/create" class="btn btn-primary">
                    <i class="fa fa-plus"></i> Tạo khu vực mới
                  </a>
                </header>
                <div class="panel-body">
                  <div class="table-responsive">
                    <!-- Thêm phần Total Warehouse Info Section -->
                    <div
                      style="
                        display: flex;
                        justify-content: flex-end;
                        gap: 15px;
                        margin-bottom: 8px;
                      "
                    >
                      <div style="display: flex; align-items: center">
                        <i
                          class="fa fa-building mr-xs"
                          style="color: #0088cc; font-size: 11px"
                        ></i>
                        <span
                          style="font-weight: 400; color: #666; font-size: 11px"
                          >Tổng số:
                          <span style="color: #0088cc; font-weight: 500"
                            >${listWareHouse.size()}</span
                          >
                          khu vực
                        </span>
                      </div>
                      <div style="display: flex; align-items: center">
                        <i
                          class="fa fa-file mr-xs"
                          style="color: #0088cc; font-size: 11px"
                        ></i>
                        <span
                          style="font-weight: 400; color: #666; font-size: 11px"
                          >Trang:
                          <span style="color: #0088cc; font-weight: 500"
                            >${currentPage}/${totalPages}</span
                          >
                        </span>
                      </div>
                    </div>

                    <table
                      class="table table-bordered table-striped table-condensed mb-none"
                    >
                      <thead>
                        <tr>
                          <th class="text-center">ID</th>
                          <th class="text-center">Tên</th>
                          <th class="text-center">Cửa hàng</th>
                          <th class="text-right">Hoạt động</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${listWareHouse}" var="warehouse">
                          <tr>
                            <td class="text-center">${warehouse.id}</td>
                            <td class="text-center">${warehouse.name}</td>
                            <td class="text-center">${warehouse.storeName}</td>
                            <td class="text-right">
                              <a
                                href="/warehouse/update/${warehouse.id}"
                                class="btn btn-primary"
                                >Cập nhật</a
                              >
                              <a
                                href="/warehouse/detail/${warehouse.id}"
                                class="btn btn-primary"
                                >Chi tiết</a
                              >
                            </td>
                          </tr>
                        </c:forEach>
                      </tbody>
                    </table>

                    <div class="pagination-container">
                      <c:if test="${totalPages > 1}">
                        <ul class="pagination">
                          <!-- Nút Trước -->
                          <c:choose>
                            <c:when test="${currentPage > 1}">
                              <li>
                                <a
                                  href="/fetch-all-warehouse?page=${currentPage - 1}"
                                  class="btn btn-default"
                                  >Trước</a
                                >
                              </li>
                            </c:when>
                            <c:otherwise>
                              <li>
                                <span class="btn btn-default disabled"
                                  >Trước</span
                                >
                              </li>
                            </c:otherwise>
                          </c:choose>

                          <!-- Hiển thị trang hiện tại -->
                          <li>
                            <span class="btn btn-default disabled"
                              >${currentPage}</span
                            >
                          </li>

                          <!-- Nút Sau -->
                          <c:choose>
                            <c:when test="${currentPage < totalPages}">
                              <li>
                                <a
                                  href="/fetch-all-warehouse?page=${currentPage + 1}"
                                  class="btn btn-default"
                                  >Sau</a
                                >
                              </li>
                            </c:when>
                            <c:otherwise>
                              <li>
                                <span class="btn btn-default disabled"
                                  >Sau</span
                                >
                              </li>
                            </c:otherwise>
                          </c:choose>
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
  </body>
</html>
