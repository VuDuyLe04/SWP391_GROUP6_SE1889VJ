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
                    <li>
                        <a href="/usermanagement">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            <span>Người dùng</span>
                        </a>
                    </li>
                    <li >
                        <a href="/customer">
                            <i class="fa fa-copy" aria-hidden="true"></i>
                            <span>Khách hàng</span>
                        </a>

                    </li>
                    <li>
                        <a href="/product">
                            <i class="fa fa-tasks" aria-hidden="true"></i>
                            <span>Sản phẩm</span>
                        </a>

                    </li>
                    <li>
                        <a>
                            <i class="fa fa-list-alt" aria-hidden="true"></i>
                            <span>Hóa đơn</span>
                        </a>
                    </li>
                    <li>
                        <a href="/warehouse">
                            <i class="fa fa-table" aria-hidden="true"></i>
                            <span>Kho hàng</span>
                        </a>
                    </li>
                    <li>
                        <a href="/packaings">
                            <i class="fa fa-map-marker" aria-hidden="true"></i>
                            <span>Quy cách đóng gói</span>
                        </a>

                    </li>
                    <li>
                        <a>
                            <i class="fa fa-map-marker" aria-hidden="true"></i>
                            <span>Cửa hàng</span>
                        </a>

                    </li>


                </ul>
            </nav>

            <hr class="separator" />


        </div>

    </div>

</aside>