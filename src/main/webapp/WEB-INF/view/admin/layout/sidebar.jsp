<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<aside id="sidebar-left" class="sidebar-left">

    <div class="sidebar-header">
        <div class="sidebar-title">
            Điều hướng
        </div>
        <div class="sidebar-toggle hidden-xs" data-toggle-class="sidebar-left-collapsed" data-target="html" data-fire-event="sidebar-left-toggle">
            <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
        </div>
    </div>

    <div class="nano">
        <div class="nano-content">
            <nav id="menu" class="nav-main" role="navigation">
                <ul class="nav nav-main">
                    <li class="nav-active">
                        <a href="/dashboard">
                            <i class="fa fa-home" aria-hidden="true"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <c:if test="${sessionScope.user.role.name == 'ADMIN' || sessionScope.user.role.name == 'OWNER'}">
                        <li>
                            <a href="/usermanagement">
                                <i class="fa fa-user" aria-hidden="true"></i>
                                <span>Người dùng</span>
                            </a>
                        </li>
                    </c:if>

                    <c:if test="${sessionScope.user.role.name == 'OWNER' || sessionScope.user.role.name == 'STAFF'}">
                        <li >
                            <a href="/customer">
                                <i class="fa fa-copy" aria-hidden="true"></i>
                                <span>Khách hàng</span>
                            </a>

                        </li>
                    </c:if>

                    <c:if test="${sessionScope.user.role.name == 'OWNER'}">
                        <li>
                            <a href="/product">
                                <i class="fa fa-tasks" aria-hidden="true"></i>
                                <span>Sản phẩm</span>
                            </a>

                        </li>
                    </c:if>
                    <c:if test="${sessionScope.user.role.name == 'OWNER'}">
                        <li>
                            <a>
                                <i class="fa fa-list-alt" aria-hidden="true"></i>
                                <span>Hóa đơn</span>
                            </a>
                        </li>
                    </c:if>

                    <c:if test="${sessionScope.user.role.name == 'OWNER'}">
                        <li>
                            <a href="/warehouse">
                                <i class="fa fa-table" aria-hidden="true"></i>
                                <span>Kho hàng</span>
                            </a>
                        </li>
                    </c:if>

                    <c:if test="${sessionScope.user.role.name == 'OWNER'}">
                        <li>
                            <a href="/packaings">
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                <span>Quy cách đóng gói</span>
                            </a>

                        </li>
                    </c:if>

                    <c:if test="${sessionScope.user.role.name == 'OWNER'}">
                        <li>
                            <a>
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                <span>Cửa hàng</span>
                            </a>

                        </li>
                    </c:if>

                    <c:if test="${sessionScope.user.role.name == 'ADMIN'}">
                        <li>
                            <a href="/service/table">
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                <span>Dịch vụ</span>
                            </a>

                        </li>
                    </c:if>
                    <c:if test="${sessionScope.user.role.name == 'ADMIN'}">
                        <li>
                            <a href="/transpayments">
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                <span>Giao dịch thanh toán  </span>
                            </a>

                        </li>
                    </c:if>
                    <c:if test="${sessionScope.user.role.name == 'ADMIN'}">
                        <li>
                            <a href="/transervices">
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                <span>Giao dịch dịch vụ </span>
                            </a>

                        </li>
                    </c:if>



                </ul>
            </nav>

            <hr class="separator" />


        </div>

    </div>

</aside>