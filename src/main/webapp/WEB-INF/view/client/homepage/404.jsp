<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <jsp:include page="../layout/lib.jsp" />
    <html lang="en">
    <jsp:include page="../layout/head.jsp" />

    <body>
      <jsp:include page="../layout/loader.jsp" />
      <jsp:include page="../layout/navbar.jsp" />
      <jsp:include page="../layout/hero.jsp" />
      <!-- error section -->
      <div class="full-height-section error-section">
        <div class="full-height-tablecell">
          <div class="container">
            <div class="row">
              <div class="col-lg-8 offset-lg-2 text-center">
                <div class="error-text">
                  <i class="far fa-sad-cry"></i>
                  <h1>Oops! Not Found.</h1>
                  <p>The page you requested for is not found.</p>
                  <a href="/" class="boxed-btn">Back to Home</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- end error section -->
      <jsp:include page="../layout/footer.jsp" />
      <jsp:include page="../layout/scripts.jsp" />
    </body>

    </html>