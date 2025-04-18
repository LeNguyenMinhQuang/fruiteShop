<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <jsp:include page="../layout/lib.jsp" />
    <html lang="en">
    <jsp:include page="../layout/head.jsp" />

    <body>
      <jsp:include page="../layout/loader.jsp" />
      <jsp:include page="../layout/navbar.jsp" />
      <jsp:include page="../layout/breakcum.jsp">
        <jsp:param name="title" value="Fresh and Organic" />
        <jsp:param name="subtitle" value="Shop" />
      </jsp:include>

      <!-- products -->
      <div class="product-section mt-150 mb-150">
        <div class="container">

          <div class="row mb-150">
            <div class="col-md-12">
              <div class="row g-4">
                <div class="col-4 d-flex flex-column align-items-center" id="cateFilter">
                  <div class="mb-2">
                    <h4 style="font-weight: 600; font-size: 20px;">Category</h4>
                  </div>
                  <div class="d-flex">
                    <div class="" style="margin-right: 48px;">
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="Berries" id="flexCheckDefault">
                        <label style="opacity:0.8; font-weight:400; font-size:15px" class="form-check-label"
                          for="flexCheckDefault">
                          Berries
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="Melons" id="flexCheckChecked">
                        <label style="opacity:0.8; font-weight:400; font-size:15px" class="form-check-label"
                          for="flexCheckChecked">
                          Melons
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="Tropical Fruits" id="flexCheckChecked">
                        <label style="opacity:0.8; font-weight:400; font-size:15px" class="form-check-label"
                          for="flexCheckChecked">
                          Tropical Fruits
                        </label>
                      </div>
                    </div>
                    <div class="">
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="Citrus Fruits" id="flexCheckChecked">
                        <label style="opacity:0.8; font-weight:400; font-size:15px" class="form-check-label"
                          for="flexCheckChecked">
                          Citrus Fruits
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="Stone Fruits" id="flexCheckChecked">
                        <label style="opacity:0.8; font-weight:400; font-size:15px" class="form-check-label"
                          for="flexCheckChecked">
                          Stone Fruits
                        </label>
                      </div>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="Pome Fruits" id="flexCheckChecked">
                        <label style="opacity:0.8; font-weight:400; font-size:15px" class="form-check-label"
                          for="flexCheckChecked">
                          Pome Fruits
                        </label>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-4 d-flex flex-column align-items-center" id="priceFilter">
                  <div class="mb-2">
                    <h4 style="font-weight: 600; font-size: 20px;">Price</h4>
                  </div>
                  <div class="">
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="10-" id="flexCheckDefault">
                      <label style="opacity:0.8; font-weight:400; font-size:15px" class="form-check-label"
                        for="flexCheckDefault">
                        Smaller than 10
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="10-50" id="flexCheckChecked">
                      <label style="opacity:0.8; font-weight:400; font-size:15px" class="form-check-label"
                        for="flexCheckChecked">
                        Bigger than 10 and Smaller than 50
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="50+" id="flexCheckChecked">
                      <label style="opacity:0.8; font-weight:400; font-size:15px" class="form-check-label"
                        for="flexCheckChecked">
                        Bigger than 50
                      </label>
                    </div>
                  </div>
                </div>
                <div class="col-4 d-flex flex-column align-items-center" id="sortFilter">
                  <div class="mb-2">
                    <h4 style="font-weight: 600; font-size: 20px;">Sort</h4>
                  </div>
                  <div class="">
                    <div class="form-check">
                      <input class="form-check-input" type="radio" value="ASC" id="flexRadioDefault1"
                        name="flexRadioDefault">
                      <label style="opacity:0.8; font-weight:400; font-size:15px" class="form-check-label"
                        for="flexRadioDefault1">
                        ASC
                      </label>
                    </div>
                    <div class="form-check">
                      <input class="form-check-input" type="radio" value="DESC" id="flexRadioDefault2"
                        name="flexRadioDefault">
                      <label style="opacity:0.8; font-weight:400; font-size:15px" class="form-check-label"
                        for="flexRadioDefault1">
                        DESC
                      </label>
                    </div>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" value="None" id="flexRadioDefault3"
                      name="flexRadioDefault" checked>
                    <label style="opacity:0.8; font-weight:400; font-size:15px" class="form-check-label"
                      for="flexRadioDefault2">
                      None
                    </label>
                  </div>
                </div>
                <div class="col-12 d-flex justify-content-center">
                  <button class="btn border border-secondary rounded-pill px-3 text-primary" id="btnFilter"
                    style="background-color: #f28123; border:none !important; color: white !important; padding: 10px 20px; width: 120px; font-size: 15px;">Filter</button>
                </div>


              </div>
            </div>
          </div>

          <div class="row product-lists">
            <c:forEach var="pr" items="${products}">
              <div class="col-lg-4 col-md-6 text-center strawberry">
                <div class="single-product-item">
                  <div style="height: 300px" class="product-image">
                    <a href="/product/${pr.id}"><img src="images/products/${pr.image}" alt="${pr.name}"></a>
                  </div>
                  <h3>${pr.name}</h3>
                  <p class="product-price"><span>Per Kg</span> ${pr.price}$ </p>
                  <form:form action="/addToCartFromHome/${pr.id}" method="post">
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

          <div class="row">
            <div class="col-lg-12 text-center">
              <div class="pagination-wrap">
                <ul>
                  <li><a href="/shop?page=${currentPage == 1 ? currentPage : currentPage-1}">Prev</a></li>
                  <c:forEach begin="1" end="${pages}" varStatus="status">
                    <li><a class="${(status.index) eq currentPage ? 'active' : ''}"
                        href="/shop?page=${status.index}">${status.index}</a></li>
                  </c:forEach>
                  <li><a href="/shop?page=${currentPage == pages ? currentPage : currentPage+1}">Next</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- end products -->
      <jsp:include page="../layout/footer.jsp" />
      <jsp:include page="../layout/scripts.jsp" />
    </body>

    </html>