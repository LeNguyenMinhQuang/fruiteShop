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
        </div>
      </div>
    </div>
  </main>
  <jsp:include page="../layout/footer.jsp" />
</div>