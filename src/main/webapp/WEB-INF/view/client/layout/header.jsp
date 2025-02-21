<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
    /* Nút popup */
    .btn-getstarted {
        background-color: #28a745;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 25px;
        display: inline-block;
    }

    /* Popup ẩn */
    .popup {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 1000;
    }

    /* Nội dung popup */
    .popup-content {
        background-color: white;
        margin: 15% auto;
        padding: 20px;
        border-radius: 10px;
        width: 300px;
        text-align: center;
    }

    /* Nút đóng */
    .close {
        color: red;
        font-size: 24px;
        cursor: pointer;
        position: absolute;
        top: 15px;
        right: 20px;
    }

</style>
<script>
    function openPopup() {
        document.getElementById("popup").style.display = "block";
    }

    function closePopup() {
        document.getElementById("popup").style.display = "none";
    }

</script>
<header id="header" class="header d-flex align-items-center sticky-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center">

        <a href="#" class="logo d-flex align-items-center me-auto">
            <!-- Uncomment the line below if you also wish to use an image logo -->
            <!-- <img src="/client/homepage/assets/img/logo.png" alt=""> -->
            <h1 class="sitename">Rice Chicken</h1>
        </a>

        <nav id="navmenu" class="navmenu">
            <ul>
                <li><a href="#hero" class="active">Trang chủ</a></li>
                <li><a href="#about">Giới thiệu</a></li>
                <li><a href="#services">Dịch vụ</a></li>
<%--                <li><a href="#portfolio">Portfolio</a></li>--%>
                <li><a href="#team">Thành viên</a></li>
<%--                <li class="dropdown"><a href="#"><span>Dropdown</span> <i--%>
<%--                        class="bi bi-chevron-down toggle-dropdown"></i></a>--%>
<%--                    <ul>--%>
<%--                        <li><a href="#">Dropdown 1</a></li>--%>
<%--                        <li class="dropdown"><a href="#"><span>Deep Dropdown</span> <i--%>
<%--                                class="bi bi-chevron-down toggle-dropdown"></i></a>--%>
<%--                            <ul>--%>
<%--                                <li><a href="#">Deep Dropdown 1</a></li>--%>
<%--                                <li><a href="#">Deep Dropdown 2</a></li>--%>
<%--                                <li><a href="#">Deep Dropdown 3</a></li>--%>
<%--                                <li><a href="#">Deep Dropdown 4</a></li>--%>
<%--                                <li><a href="#">Deep Dropdown 5</a></li>--%>
<%--                            </ul>--%>
<%--                        </li>--%>
<%--                        <li><a href="#">Dropdown 2</a></li>--%>
<%--                        <li><a href="#">Dropdown 3</a></li>--%>
<%--                        <li><a href="#">Dropdown 4</a></li>--%>
<%--                    </ul>--%>
<%--                </li>--%>
                <li><a href="#contact">Liên hệ</a></li>
            </ul>
            <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>
        <c:choose>
            <c:when test="${sessionScope.user != null}">
                <c:if test="${sessionScope.user.role.name == 'ADMIN'}">
                    <a class="btn-getstarted" href="/dashboard">Quản lý hệ thống</a>
                </c:if>

                <c:if test="${sessionScope.user.role.name == 'OWNER'}">
                    <a class="btn-getstarted" href="/dashboard">Quản lý các cửa hàng</a>
                </c:if>

                <c:if test="${sessionScope.user.role.name == 'STAFF'}">
                    <a class="btn-getstarted" href="javascript:void(0)" onclick="openPopup()">Chọn cửa hàng</a>
                    <div id="popup" class="popup">
                        <div class="popup-content">
                            <span class="close" onclick="closePopup()">&times;</span>
                            <ul>

                                <c:set var="hasStore" value="false"/>
                                <c:forEach items="${sessionScope.user.userStores}" var="userStore" varStatus="status">
                                    <c:if test="${userStore.accessStoreStatus == 'ACCESSED'}">
                                        <c:set var="hasStore" value="true"/>
                                        <li>
                                            <!-- Sử dụng id động với chỉ số index -->
                                            <form id="storeForm-${status.index}" method="post" action="/storesession">
                                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                                <input type="hidden" value="${userStore.store.id}" name="storeId">
                                                <a href="#" onclick="document.getElementById('storeForm-${status.index}').submit(); return false;">
                                                        ${userStore.store.name}
                                                </a>
                                            </form>
                                        </li>
                                    </c:if>
                                </c:forEach>
                                <c:if test="${!hasStore}">
                                    <p style="color: red">Không có cửa hàng nào để quản lý</p>
                                </c:if>
                            </ul>

                        </div>
                    </div>
                </c:if>


                <form id="logoutForm" method="post" action="/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    <a class="btn-getstarted" href="#" onclick="document.getElementById('logoutForm').submit(); return false;">Đăng xuất</a>
                </form>


            </c:when>
            <c:otherwise>
                <a class="btn-getstarted" href="/login">Đăng nhập/Đăng ký</a>
            </c:otherwise>
        </c:choose>


    </div>
</header>