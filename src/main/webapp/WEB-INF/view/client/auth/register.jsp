<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <jsp:include page="../layout/lib.jsp" />
            <html lang="en">
            <jsp:include page="../layout/head.jsp" />


            <body class="bg-primary">
                <div id="layoutAuthentication">
                    <div id="layoutAuthentication_content">
                        <main>
                            <div class="container">
                                <div class="row justify-content-center">
                                    <div class="col-lg-7">
                                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                                            <div class="card-header">
                                                <h3 class="text-center font-weight-light my-4">Create Account</h3>
                                            </div>
                                            <div class="card-body">
                                                <form:form action="/register" method="POST"
                                                    modelAttribute="registerUser" enctype="multipart/form-data">
                                                    <div class="row mb-3">
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">
                                                                <form:input class="form-control"
                                                                    placeholder="Enter your first name" type="text"
                                                                    path="firstName" />
                                                                <label for="inputFirstName">First name</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-floating">
                                                                <form:input class="form-control" type="text"
                                                                    placeholder="Enter your last name"
                                                                    path="lastName" />
                                                                <label for="inputLastName">Last name</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <c:set var="errorEmail">
                                                            <form:errors path="email" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <form:input type="email"
                                                            class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                            path="email" placeholder="name@example.com" />
                                                        ${errorEmail}
                                                        <label for="inputEmail">Email address</label>
                                                    </div>
                                                    <div class="row mb-3">
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">
                                                                <c:set var="errorPassword">
                                                                    <form:errors path="password"
                                                                        cssClass="invalid-feedback" />
                                                                </c:set>
                                                                <form:input type="password"
                                                                    class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                                    path="password" placeholder="Create a passwordm" />
                                                                ${errorPassword}
                                                                <label for="inputPassword">Password</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-floating mb-3 mb-md-0">
                                                                <c:set var="errorCPassword">
                                                                    <form:errors path="confirmPassword"
                                                                        cssClass="invalid-feedback" />
                                                                </c:set>
                                                                <form:input type="password"
                                                                    class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                                    path="confirmPassword" />
                                                                ${errorCPassword}
                                                                <label for="inputPasswordConfirm">Confirm
                                                                    Password</label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="mt-4 mb-0">
                                                        <div class="d-grid"><button type="submit"
                                                                class="btn btn-primary btn-block">Create
                                                                Account</button></div>
                                                    </div>
                                                </form:form>
                                            </div>
                                            <div class="card-footer text-center py-3">
                                                <div class="small"><a href="/login">Have an account? Go to login</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <!-- <script src="js/scripts.js"></script> -->
            </body>


            </html>