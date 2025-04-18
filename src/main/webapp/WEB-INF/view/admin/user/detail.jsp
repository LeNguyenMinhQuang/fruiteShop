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
                        <h1 class="mt-4">Users</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">Dashboard</li>
                            <li class="breadcrumb-item active">User</li>
                        </ol>
                        <div class="row">
                            <div class="col-12 mx-auto">
                                <div class="d-flex justify-content-between align-items-center">
                                    <h5>${user.fullName}</h5>
                                </div>
                                <hr />
                                <table class="table table-bordered table-hover">
                                    <tbody>
                                        <tr>
                                            <th width="20%">Avatar</th>
                                            <td>
                                                <img width="150px" src="/images/avatar/${user.avatar}" alt="">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th width="20%">ID</th>
                                            <td>${user.id}</td>
                                        </tr>
                                        <tr>
                                            <th width="20%">Full name</th>
                                            <td>${user.fullName}</td>
                                        </tr>
                                        <tr>
                                            <th width="20%">Email</th>
                                            <td>${user.email}</td>
                                        </tr>
                                        <tr>
                                            <th width="20%">Role</th>
                                            <td>${user.role.name}</td>
                                        </tr>
                                        <tr>
                                            <th width="20%">Phone number</th>
                                            <td>${user.phone}</td>
                                        </tr>
                                        <tr>
                                            <th width="20%">Address</th>
                                            <td>${user.address}</td>
                                        </tr>
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