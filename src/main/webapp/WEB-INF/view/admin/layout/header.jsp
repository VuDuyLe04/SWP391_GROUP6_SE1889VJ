<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
    .header-right {
        display: flex;
        align-items: center;
        gap: 10px; /* Khoảng cách giữa các phần tử */
    }

    .notifications {
        margin-right: 10px; /* Để nút Bán hàng không quá sát với dropdown */
    }

    .notifications select {
        max-width: 200px; /* Đảm bảo rằng dropdown không quá rộng */
    }

    .btn-primary {
        padding: 10px 15px; /* Tăng padding cho nút Bán hàng */
        font-size: 14px; /* Đảm bảo chữ trong nút rõ ràng và vừa phải */
        white-space: nowrap; /* Đảm bảo chữ không bị xuống dòng */
    }

</style>
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

            <!-- Thêm nút "Bán hàng" -->
            <a href="/saleproduct" class="btn btn-primary" style="margin-left: 15px;">
                Bán hàng
            </a>
        </c:if>
        <c:if test="${sessionScope.user.role.name == 'OWNER'}">
            <a href="javascript:void(0)" class="btn btn-primary" style="margin-left: 15px;" data-toggle="modal" data-target="#saleModal">
                Bán hàng
            </a>
        </c:if>

        <!-- Modal -->
        <div class="modal fade" id="saleModal" tabindex="-1" role="dialog" aria-labelledby="saleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h5 class="modal-title" id="saleModalLabel">Chọn cửa hàng </h5>
                    </div>

                    <form action="/storesession" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="hidden" id="storeIdInput" name="storeId" value=""/>
                        <div class="modal-body">
                            <ul>
                                <c:forEach items="${sessionScope.user.userStores}" var="userStore">
                                    <li>
                                        <a href="#" onclick="submitStore('${userStore.store.id}'); return false;">
                                                ${userStore.store.name}
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </form>

                    <script>
                        function submitStore(storeId) {
                            document.getElementById('storeIdInput').value = storeId;
                            document.forms[0].submit();
                        }
                    </script>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>

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
                            <a role="menuitem" tabindex="-1" href="/owner/payment/history"><i class="fa fa-history"></i> Lịch sử nạp tiền</a>
                        </li>
                        <li>
                            <a role="menuitem" tabindex="-1" href="/owner/service/history"><i class="fa fa-history"></i> Lịch sử thuê dịch vụ</a>
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