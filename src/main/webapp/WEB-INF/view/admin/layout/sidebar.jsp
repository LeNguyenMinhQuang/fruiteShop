<div id="layoutSidenav_nav">
  <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
      <div class="nav">
        <div class="sb-sidenav-menu-heading">Menu</div>
        <a class="nav-link" href="/">
          <div class="sb-nav-link-icon"><i class="fas fa-house"></i></div>
          Home
        </a>
        <a class="nav-link" href="/admin">
          <div class="sb-nav-link-icon"><i class="fas fa-gauge"></i></div>
          Dashboard
        </a>
        <a class="nav-link" href="/admin/user">
          <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
          User
        </a>
        <a class="nav-link" href="/admin/product">
          <div class="sb-nav-link-icon"><i class="fas fa-shop"></i></div>
          Product
        </a>
        <a class="nav-link" href="/admin/order">
          <div class="sb-nav-link-icon"><i class="fas fa-cart-shopping"></i></div>
          Order
        </a>
      </div>
    </div>
    <div class="sb-sidenav-footer">
      <div class="small">Logged in as:</div>
      ${sessionScope.fullName}
    </div>
  </nav>
</div>