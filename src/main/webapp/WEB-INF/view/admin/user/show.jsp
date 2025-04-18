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
                  <h5>Users</h5>
                  <a href="/admin/user/create" class="btn btn-primary">Create new user</a>
                </div>
                <hr />
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Email</th>
                      <th>Full Name</th>
                      <th>Role</th>
                      <th>Action</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach var="user" items="${users}">
                      <tr>
                        <th>${user.id}</th>
                        <th>${user.email}</th>
                        <th>${user.fullName}</th>
                        <th>${user.role.name}</th>
                        <th>
                          <a href="/admin/user/${user.id}" class="btn btn-success">View</a>
                          <a href="/admin/user/update/${user.id}" class="btn btn-warning">Update</a>
                          <a href="/admin/user/delete/${user.id}" class="btn btn-danger">Delete</a>
                        </th>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
                <nav aria-label="Page navigation example">
                  <ul class="pagination justify-content-end">
                    <li class="page-item">
                      <a class="${(currentPage eq 1) ? 'disabled page-link' : 'page-link'}"
                        href="/admin/user?page=${currentPage - 1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                      </a>
                    </li>
                    <!-- phần sau dấu ? là queryString, nó sẽ ko ảnh hưởng tới đường link url gọi bên server -->
                    <c:forEach begin="1" end="${pages}" varStatus="status">
                      <li class="page-item"><a
                          class="${(status.index) eq currentPage ? 'active page-link' : 'page-link'}"
                          href="/admin/user?page=${status.index}">${status.index}</a></li>
                    </c:forEach>

                    <li class="page-item">
                      <a class="${(currentPage eq pages) ? 'disabled page-link' : 'page-link'}"
                        href="/admin/user?page=${currentPage + 1}" aria-label="Next">
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