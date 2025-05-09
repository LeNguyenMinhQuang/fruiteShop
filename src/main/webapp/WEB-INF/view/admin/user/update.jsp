<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
                                        <div class="d-flex">
                                            <h5>Update User: ${updateUser.fullName}</h5>
                                        </div>
                                        <hr />
                                        <form:form action="/admin/user/update" method="POST" modelAttribute="updateUser"
                                            enctype="multipart/form-data">
                                            <div class="mb-3 col-12 col-md-6" style="display: none;">
                                                <label class="form-label">Id:</label>
                                                <form:input type="text" class="form-control" path="id"
                                                    readonly="true" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Email:</label>
                                                <form:input type="email" class="form-control" path="email"
                                                    readonly="true" disabled="true" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Phone Number:</label>
                                                <!-- path phải trùng với key của model trong domain -->
                                                <form:input type="text" class="form-control" path="phone" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Full Name:</label>
                                                <form:input type="text" class="form-control" path="fullName" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Address:</label>
                                                <form:input type="text" class="form-control" path="address" />
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label class="form-label">Role:</label>
                                                <!-- vì role trong user là một object sinh ra từ class Role, mà các option là String, nên ta phải để path đến role.name (là 1 String) -->
                                                <form:select class="form-select" path="role.name">
                                                    <form:option value="ADMIN">ADMIN</form:option>
                                                    <form:option value="USER">USER</form:option>
                                                </form:select>
                                            </div>
                                            <div class="mb-3 col-12 col-md-6">
                                                <label for="avatarFile" class="form-label">Avatar:</label>
                                                <!-- thuộc tính name để bên controller có thể getParams -->
                                                <input name="avatarFile" type="file" class="form-control"
                                                    id="uploadFile" accept=".png, .jpg, .jpeg">
                                            </div>
                                            <c:set var="imageShow" scope="page" value="none" />
                                            <c:if test="${updateUser.avatar != null}">
                                                <c:set var="imageShow" scope="page" value="" />
                                            </c:if>
                                            <div class="col-12 mb-3">
                                                <img src="/images/avatar/${updateUser.avatar}"
                                                    style="max-height: 250px; display: ${imageShow}" alt="filePreview"
                                                    id="filePreview">
                                            </div>

                                            <div class="col-12 mb-5">
                                                <button type="submit" class="btn btn-primary ">Create</button>
                                            </div>
                                        </form:form>
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