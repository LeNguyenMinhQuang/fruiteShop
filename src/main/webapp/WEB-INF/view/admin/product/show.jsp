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
                  <h5>Products</h5>
                  <a href="/admin/product/create" class="btn btn-primary">Create new product</a>
                </div>
                <hr />
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Name</th>
                      <th>Category</th>
                      <th>Price</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="product" items="${products}">
                      <tr>
                        <th>${product.id}</th>
                        <th>${product.name}</th>
                        <th>${product.category}</th>
                        <th>${product.price}</th>
                        <th>
                          <a href="/admin/product/${product.id}" class="btn btn-success">View</a>
                          <a href="/admin/product/update/${product.id}" class="btn btn-warning">Update</a>
                          <a href="/admin/product/delete/${product.id}" class="btn btn-danger">Delete</a>
                        </th>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
                <nav aria-label="Page navigation example">
                  <ul class="pagination justify-content-end">
                    <li class="page-item">
                      <a class="${(currentPage eq 1) ? 'disabled page-link' : 'page-link'}"
                        href="/admin/product?page=${currentPage - 1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                      </a>
                    </li>
                    <!-- phần sau dấu ? là queryString, nó sẽ ko ảnh hưởng tới đường link url gọi bên server -->
                    <c:forEach begin="1" end="${pages}" varStatus="status">
                      <li class="page-item"><a
                          class="${(status.index) eq currentPage ? 'active page-link' : 'page-link'}"
                          href="/admin/product?page=${status.index}">${status.index}</a></li>
                    </c:forEach>

                    <li class="page-item">
                      <a class="${(currentPage eq pages) ? 'disabled page-link' : 'page-link'}"
                        href="/admin/product?page=${currentPage + 1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                      </a>
                    </li>
                  </ul>
                </nav>
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