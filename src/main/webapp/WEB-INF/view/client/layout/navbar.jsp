<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- header -->
    <div class="top-header-area" id="sticker">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 col-sm-12 text-center">
            <div class="main-menu-wrap">
              <!-- logo -->
              <div class="site-logo">
                <a href="index.html">
                  <img src="assets/img/logo.png" alt="">
                </a>
              </div>
              <!-- logo -->

              <!-- menu start -->
              <nav class="main-menu">
                <ul>
                  <li class="current-list-item"><a style="text-decoration: none;" href="/"><i
                        class="fa fa-home"></i>Home</a></li>
                  <li><a style="text-decoration: none;" href="/shop"><i class="fas fa-shopping-basket"></i>Shop</a></li>
                  <li><a style="text-decoration: none;" href="/cart"><i class="fas fa-shopping-cart"></i>Cart
                      (${sessionScope.sumCart})</a>
                  </li>
                  <c:if test="${sessionScope.email == null}">
                    <li><a style="text-decoration: none;" href="/login"><i class="fa fa-user"></i>Login</a></li>
                  </c:if>
                  <c:if test="${sessionScope.role == 'ADMIN'}">
                    <li><a style="text-decoration: none;" href="/admin"><i class="fas fa-lock"></i>Admin</a></li>
                  </c:if>
                  <li><a style="text-decoration: none;" class="search-bar-icon"><i class="fas fa-search"></i>Search</a>
                  </li>
                  <c:if test="${sessionScope.email != null}">
                    <li><a style="text-decoration: none;" href="/history">
                        </i>${sessionScope.fullName}</a></li>
                    <li style="height: 51px;">
                      <form:form method="post" action="/logout" class="logout">
                        <input type="hidden" name="${_crsf.parameterName}" value="${_crsf.token}">
                        <button
                          style="background-color: transparent; border: none;color: #fff;font-weight: 700;display: block;padding-inline: 15px;height:100%">Logout</button>
                      </form:form>
                    </li>
                  </c:if>
                </ul>
              </nav>
              <div class="mobile-menu"></div>
              <!-- menu end -->
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end header -->

    <!-- search area -->
    <div class="search-area">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <span class="close-btn"><i class="fas fa-window-close"></i></span>
            <div class="search-bar">
              <div class="search-bar-tablecell">
                <h3>Search For:</h3>
                <input id="searchBar" type="text" placeholder="Keywords">
                <button id="searchBtn" type="submit">Search <i class="fas fa-search"></i></button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- end search area -->