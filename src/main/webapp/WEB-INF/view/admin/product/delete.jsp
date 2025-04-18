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
                                <h1 class="mt-4">Products</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item active">Dashboard</li>
                                    <li class="breadcrumb-item active">Product</li>
                                </ol>
                                <div class="row">
                                    <div class="col-12 mx-auto">
                                        <div class="d-flex">
                                            <h5>Delete Product: ${deleteProduct.name} with id: ${deleteProduct.id}?</h5>
                                        </div>
                                        <hr />
                                        <form:form action="/admin/product/delete" method="POST"
                                            modelAttribute="deleteProduct" enctype="multipart/form-data">
                                            <div class="mb-3 col-12 col-md-6" style="display: none;">
                                                <label class="form-label">Id:</label>
                                                <form:input type="text" class="form-control" path="id"
                                                    readonly="true" />
                                            </div>
                                            <button type="submit" class="btn btn-primary">Delete</button>
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