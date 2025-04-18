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
            <h1 class="mt-4">Products</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">Dashboard</li>
              <li class="breadcrumb-item active">Products</li>
            </ol>
            <div class="row">
              <div class="col-12 mx-auto">
                <div class="d-flex justify-content-between align-items-center">
                  <h5>${product.name}</h5>
                </div>
                <hr />
                <table class="table table-bordered table-hover">
                  <tbody>
                    <tr>
                      <th width="20%">Image</th>
                      <td>
                        <img width="150px" src="/images/products/${product.image}" alt="">
                      </td>
                    </tr>
                    <tr>
                      <th width="20%">ID</th>
                      <td>${product.id}</td>
                    </tr>
                    <tr>
                      <th width="20%">Name</th>
                      <td>${product.name}</td>
                    </tr>
                    <tr>
                      <th width="20%">Category</th>
                      <td>${product.category}</td>
                    </tr>
                    <tr>
                      <th width="20%">Price</th>
                      <td>${product.price}</td>
                    </tr>
                    <tr>
                      <th width="20%">Description</th>
                      <td>${product.description}</td>
                    </tr>
                    <tr>
                      <th width="20%">Quantity</th>
                      <td>${product.quantity}</td>
                    </tr>
                    <tr>
                      <th width="20%">Sold</th>
                      <td>${product.sold}</td>
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