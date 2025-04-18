<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
                    <div class="d-flex">
                      <h5>Create User</h5>
                    </div>
                    <hr />
                    <form:form action="/admin/product/create" method="POST" modelAttribute="newProduct" class="row"
                      enctype="multipart/form-data">
                      <div class="mb-3 col-12 col-md-6">
                        <label class="form-label">Name:</label>
                        <c:set var="errorName">
                          <form:errors path="name" cssClass="invalid-feedback" />
                        </c:set>
                        <form:input type="name" class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                          path="name" />
                        ${errorName}
                      </div>
                      <div class="mb-3 col-12 col-md-6">
                        <label class="form-label">Category:</label>
                        <form:select class="form-select" path="category">
                          <form:option value="Tropical Fruits">Tropical Fruits</form:option>
                          <form:option value="Citrus Fruits">Citrus Fruits</form:option>
                          <form:option value="Berries">Berries</form:option>
                          <form:option value="Melons">Melons</form:option>
                          <form:option value="Stone Fruits">Stone Fruits</form:option>
                          <form:option value="Pome Fruits">Pome Fruits</form:option>
                        </form:select>
                      </div>
                      <div class="mb-3 col-12 col-md-6">
                        <label class="form-label">Price:</label>
                        <c:set var="errorPrice">
                          <form:errors path="price" cssClass="invalid-feedback" />
                        </c:set>
                        <form:input type="price" class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                          path="price" />
                        ${errorPrice}
                      </div>
                      <div class=" mb-3 col-12 col-md-6">
                        <label class="form-label">Description:</label>
                        <form:input type="text" class="form-control" path="description" />
                      </div>
                      <div class=" mb-3 col-12 col-md-6">
                        <label class="form-label">Quantity:</label>
                        <form:input type="number" class="form-control" path="quantity" />
                      </div>
                      <div class="mb-3 col-12 col-md-6">
                        <label for="imagePrd" class="form-label">Image:</label>
                        <!-- thuộc tính name để bên controller có thể getParams -->
                        <input name="imagePrd" type="file" class="form-control" id="uploadFile"
                          accept=".png, .jpg, .jpeg">
                      </div>
                      <div class="col-12 mb-3">
                        <img style="max-height: 250px; display:none" alt="filePreview" id="filePreview">
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