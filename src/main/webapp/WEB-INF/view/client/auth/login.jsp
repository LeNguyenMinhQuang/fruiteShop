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
                                    <div class="col-lg-5">
                                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                                            <div class="card-header">
                                                <h3 class="text-center font-weight-light my-4">Login</h3>
                                            </div>
                                            <div class="card-body">
                                                <form:form action="/login" method="post">
                                                    <c:if test="${param.error !=null}">
                                                        <div class="my-2" style="color: red">Invalid email or password
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${param.logout !=null}">
                                                        <div class="my-2" style="color: green">Logout success</div>
                                                    </c:if>
                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" id="inputEmail" type="email"
                                                            placeholder="name@example.com" name="username" />
                                                        <!-- khai báo name="username" và name="password" để cho spring security hoạt động -->
                                                        <label for="inputEmail">Email address</label>
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input class="form-control" id="inputPassword" type="password"
                                                            placeholder="Password" name="password" />
                                                        <label for="inputPassword">Password</label>
                                                    </div>
                                                    <!-- và phải có thêm input sau cho Spring security -->
                                                    <div>
                                                        <input type="hidden" name="${_crsf.parameterName}"
                                                            value="${_crsf.token}">
                                                    </div>
                                                    <div class="form-check mb-3">
                                                        <input class="form-check-input" id="inputRememberPassword"
                                                            type="checkbox" value="" />
                                                        <label class="form-check-label"
                                                            for="inputRememberPassword">Remember
                                                            Password</label>
                                                    </div>
                                                    <div
                                                        class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                        <a class="small">Forgot Password?</a>
                                                        <button class="btn btn-primary" type="submit">Login</button>
                                                    </div>
                                                </form:form>
                                            </div>
                                            <div class="card-footer text-center py-3">
                                                <div class="small"><a href="/register">Need an account? Sign up!</a>
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