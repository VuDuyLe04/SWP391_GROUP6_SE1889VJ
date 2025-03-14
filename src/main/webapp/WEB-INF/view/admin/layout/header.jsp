<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<header class="header">
    <div class="logo-container">
        <a href="../" class="logo">
            <img src="/client/auth/assets/images/logo.png" height="35" alt="JSOFT Admin" />
        </a>
        <div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
            <i class="fa fa-bars" aria-label="Toggle sidebar"></i>
        </div>
    </div>

    <!-- start: search & user box -->
    <div class="header-right">

<%--        <form action="pages-search-results.html" class="search nav-form">--%>
<%--            <div class="input-group input-search">--%>
<%--                <input type="text" class="form-control" name="q" id="q" placeholder="Search...">--%>
<%--                <span class="input-group-btn">--%>
<%--								<button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>--%>
<%--							</span>--%>
<%--            </div>--%>
<%--        </form>--%>
<%--        <span class="separator"></span>--%>
        <c:if test="${sessionScope.user.role.name == 'STAFF'}">
            <div class="notifications">
                <form id="storeSwitcher" method="post" action="/storesession">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <select class="form-control" name="storeId" onchange="document.getElementById('storeSwitcher').submit();">
                        <c:forEach items="${sessionScope.user.userStores}" var="userStore" varStatus="status">
                            <option value="${userStore.store.id}"
                                    <c:if test="${sessionScope.store.id == userStore.store.id}">selected</c:if>>
                                    ${userStore.store.name}
                            </option>
                        </c:forEach>
                    </select>
                </form>
            </div>
        </c:if>

<%--    <c:if test="${sessionScope.user.role.name == 'OWNER'}">--%>
<%--        <div class="notification">--%>
<%--            Số dư: <fmt:formatNumber value="${sessionScope.user.balance}" type="currency"--%>
<%--                                     currencySymbol="₫"/>--%>
<%--        </div>--%>
<%--    </c:if>--%>

        <span class="separator"></span>

        <div id="userbox" class="userbox">
            <a href="#" data-toggle="dropdown">
                <figure class="profile-picture">
                    <img src="/client/auth/assets/images/vuduyle.jpg" alt="Joseph Doe" class="img-circle" data-lock-picture="/client/auth/assets/images/!logged-user.jpg" />
                </figure>
                <div class="profile-info" data-lock-name="John Doe" data-lock-email="johndoe@JSOFT.com">
                    <span class="name">${sessionScope.user.name}</span>
                    <span class="role">
                        <c:if test="${sessionScope.user.role.name == 'OWNER'}">
                            CHỦ CỬA HÀNG
                        </c:if>

                        <c:if test="${sessionScope.user.role.name == 'ADMIN'}">
                            ADMIN
                        </c:if>

                        <c:if test="${sessionScope.user.role.name == 'STAFF'}">
                            NHÂN VIÊN
                        </c:if>

                    </span>
                </div>

                <i class="fa custom-caret"></i>
            </a>

            <div class="dropdown-menu">
                <ul class="list-unstyled">
                    <li class="divider"></li>
                    <li>
                        <a role="menuitem" tabindex="-1" href="/profile"><i class="fa fa-user"></i> Thông tin cá nhân</a>
                    </li>
                    <c:if test="${sessionScope.user.role.name == 'OWNER'}">
                        <li>
                            <a role="menuitem" tabindex="-1" href="/payment"><i class="fa fa-money"></i> Nạp tiền</a>
                        </li>
                        <li>
                            <a role="menuitem" tabindex="-1" href="/payment/history"><i class="fa fa-history"></i> Lịch sử nạp tiền</a>
                        </li>
                    </c:if>
                    <li>
                        <form id="logoutForm" method="post" action="/logout">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <a role="menuitem" tabindex="-1" href="#"
                               onclick="document.getElementById('logoutForm').submit(); return false;">
                                <i class="fa fa-power-off"></i> Đăng xuất
                            </a>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- end: search & user box -->
</header>