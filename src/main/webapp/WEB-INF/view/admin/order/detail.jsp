<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <jsp:include page="../layout/head.jsp" />

    <body class="sb-nav-fixed">
        <jsp:include page="../layout/navbar.jsp" />
        <div id="layoutSidenav">
            <jsp:include page="../layout/sidebar.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Orders</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                            <li class="breadcrumb-item active">Order</li>
                        </ol>
                        <div class="row">
                            <div class="col-12 mx-auto">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h5>Order: ${order.id}</h5>
                                </div>
                                <hr />
                                <table class="table table-bordered table-hover">
                                    <tbody>
                                        <tr>
                                            <th width="20%">User</th>
                                            <td><a style="text-decoration: none; color:black"
                                                    href="/admin/user/${order.user.id}">${order.user.id}.
                                                    ${order.user.fullName}</a></td>
                                        </tr>
                                        <tr>
                                            <th width="20%">Receiver Name</th>
                                            <td>${order.receiverName}</td>
                                        </tr>
                                        <tr>
                                            <th width="20%">Receiver Phone</th>
                                            <td>${order.receiverPhone}</td>
                                        </tr>
                                        <tr>
                                            <th width="20%">Receiver Address</th>
                                            <td>${order.receiverAddress}</td>
                                        </tr>
                                        <tr>
                                            <th width="20%">Total Price</th>
                                            <td>${order.totalPrice}</td>
                                        </tr>
                                        <tr>
                                            <th width="20%">Status</th>
                                            <td>${order.status}</td>
                                        </tr>
                                    </tbody>
                                </table>

                                <div class="d-flex justify-content-between align-items-center">
                                    <h5>Products</h5>
                                </div>
                                <hr />
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="od" items="${list}">
                                            <tr>
                                                <th>
                                                    <a style="text-decoration: none; color:black"
                                                        href="/admin/product/${od.product.id}">${od.product.name}</a>
                                                </th>
                                                <th>${od.quantity}</th>
                                                <th>${od.price}</th>
                                                <th>${od.quantity * od.price}</th>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="../layout/footer.jsp" />
            </div>
        </div>
        <jsp:include page="../layout/scripts.jsp" />
    </body>

    </html>