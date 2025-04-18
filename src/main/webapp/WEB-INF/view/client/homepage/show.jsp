<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <jsp:include page="../layout/lib.jsp" />
    <html lang="en">
    <jsp:include page="../layout/head.jsp" />

    <body>
      <jsp:include page="../layout/loader.jsp" />
      <jsp:include page="../layout/navbar.jsp" />
      <jsp:include page="../layout/hero.jsp" />
      <jsp:include page="../layout/feature.jsp" />
      <!-- product section -->
      <div class="product-section mt-150 mb-150">
        <div class="container">
          <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
              <div class="section-title">
                <h3><span class="orange-text">Our</span> Products</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid, fuga quas itaque eveniet
                  beatae optio.
                </p>
              </div>
            </div>
          </div>
          <div class="row">
            <c:forEach var="product" items="${products}">
              <div class="col-lg-4 col-md-6 text-center">
                <div class="single-product-item">
                  <div style="height: 270px" class="product-image">
                    <a href="/product/${product.id}"><img src="/images/products/${product.image}"
                        alt="${product.name}"></a>
                  </div>
                  <h3>${product.name}</h3>
                  <p class="product-price"><span>Per Kg</span> ${product.price}$ </p>
                  <form:form action="/addToCartFromHome/${product.id}" method="post">
                    <input type="hidden" name="${_crsf.parameterName}" value="${_crsf.token}">
                    <button
                      style="background-color: #f28123; padding: 10px 20px; border:none; border-radius:20px; font-family: 'Poppins'; Color:white"><i
                        class="fas fa-shopping-cart"></i>
                      Add to Cart</button>
                  </form:form>
                </div>
              </div>
            </c:forEach>
          </div>
        </div>
      </div>
      <!-- end product section -->
      <jsp:include page="../layout/footer.jsp" />
      <jsp:include page="../layout/scripts.jsp" />
    </body>

    </html>