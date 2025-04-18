<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <% String title=request.getParameter("title"); String subtitle=request.getParameter("subtitle"); %>

    <!-- breadcrumb-section -->
    <div class="breadcrumb-section breadcrumb-bg">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 offset-lg-2 text-center">
            <div class="breadcrumb-text">
              <p>
                <%= title %>
              </p>
              <h1>
                <%= subtitle %>
              </h1>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end breadcrumb section -->