<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <jsp:include page="../layout/lib.jsp" />
    <html lang="en">
    <jsp:include page="../layout/head.jsp" />


    <body>
      <jsp:include page="../layout/loader.jsp" />
      <jsp:include page="../layout/navbar.jsp" />
      <jsp:include page="../layout/breakcum.jsp">
        <jsp:param name="title" value="${product.category}" />
        <jsp:param name="subtitle" value="${product.name}" />
      </jsp:include>

      <!-- single product -->
      <div class="single-product mt-150 mb-150">
        <div class="container">
          <div class="row">
            <div class="col-md-5">
              <div class="single-product-img">
                <img src="/images/products/${product.image}" alt="">
              </div>
            </div>
            <div class="col-md-7">
              <div class="single-product-content">
                <h3>${product.name}</h3>
                <p class="single-product-pricing"><span>Per Kg</span> ${product.price}$</p>
                <p>${product.description}</p>
                <div class="single-product-form">
                  <form:form class="d-flex" method="post" action="/addToCartFromDetail/${product.id}">
                    <input type="hidden" name="${_crsf.parameterName}" value="${_crsf.token}">
                    <input min="1" style="width: 80px; height: 41px; margin-right: 20px;" type="number"
                      class="form-control" name="quantity" value="1">
                    <button
                      style="height:41px ;background-color: #f28123; padding: 10px 20px; border:none; border-radius:20px; font-family: 'Poppins'; Color:white"><i
                        class="fas fa-shopping-cart"></i>
                      Add to Cart</button>
                  </form:form>
                  <p><strong>Category: </strong>${product.category}</p>
                </div>
                <h4>Share:</h4>
                <ul class="product-share">
                  <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
                  <li><a href=""><i class="fab fa-twitter"></i></a></li>
                  <li><a href=""><i class="fab fa-google-plus-g"></i></a></li>
                  <li><a href=""><i class="fab fa-linkedin"></i></a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- end single product -->

      <!-- more products -->
      <div class="more-products mb-150">
        <div class="container">
          <div class="row">
            <div class="col-lg-8 offset-lg-2 text-center">
              <div class="section-title">
                <h3><span class="orange-text">Related</span> Products</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aliquid, fuga quas itaque eveniet beatae
                  optio.</p>
              </div>
            </div>
          </div>
          <div class="row">
            <c:forEach var="prd" items="${list}">
              <div class="col-lg-4 col-md-6 text-center">
                <div class="single-product-item">
                  <div style="height: 270px" class="product-image">
                    <a href="/product/${prd.id}"><img src="/images/products/${prd.image}" alt=""></a>
                  </div>
                  <h3>${prd.name}</h3>
                  <p class="product-price"><span>Per Kg</span> ${prd.price}$ </p>
                  <a href="cart.html" class="cart-btn"><i class="fas fa-shopping-cart"></i> Add to Cart</a>
                </div>
              </div>
            </c:forEach>
          </div>
        </div>
      </div>
      <!-- end more products -->
      <jsp:include page="../layout/footer.jsp" />
      <jsp:include page="../layout/scripts.jsp" />
    </body>

    </html>