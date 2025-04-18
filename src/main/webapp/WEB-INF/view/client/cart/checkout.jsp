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
        <jsp:param name="subtitle" value="Check Out" />
      </jsp:include>
      <!-- check out section -->
      <div class="checkout-section mt-150 mb-150">
        <div class="container">
          <div class="row">
            <div class="col-lg-8">
              <div class="checkout-accordion-wrap">
                <div class="accordion" id="accordionExample">
                  <div class="card single-accordion">
                    <div class="card-header" id="headingOne">
                      <h5 class="mb-0">
                        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne"
                          aria-expanded="true" aria-controls="collapseOne">
                          Billing Address
                        </button>
                      </h5>
                    </div>

                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne"
                      data-parent="#accordionExample">
                      <div class="card-body">
                        <div class="billing-address-form">
                          <form:form action="/placeOrder" method="post">
                            <input type="hidden" name="${_crsf.parameterName}" value="${_crsf.token}">
                            <div class="form-item w-100">
                              <label class="form-label my-3">Name<sup>*</sup></label>
                              <input type="text" class="form-control" name="receiverName">
                            </div>
                            <div class="form-item w-100">
                              <label class="form-label my-3">Phone<sup>*</sup></label>
                              <input type="text" class="form-control" name="receiverPhone">
                            </div>
                            <div class="form-item w-100">
                              <label class="form-label my-3">Address<sup>*</sup></label>
                              <input type="text" class="form-control" name="receiverAddress">
                            </div>
                            <button type="submit"
                              style="height: 40px; border: none; border-radius: 20px; background-color: #f28123; padding: 10px 20px; font-family: 'Poppins'; font-size: 14px; color: white; margin-top: 24px;">Place
                              Order</button>
                          </form:form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

              </div>
            </div>

            <div class="col-lg-4">
              <div class="order-details-wrap">
                <table class="order-details">
                  <thead>
                    <tr>
                      <th>Your order Details</th>
                      <th>Price</th>
                    </tr>
                  </thead>
                  <tbody class="order-details-body">
                    <tr>
                      <td>Product</td>
                      <td>Total</td>
                    </tr>
                    <c:forEach var="cd" items="${list}">
                      <tr>
                        <td>${cd.product.name}</td>
                        <td>${cd.price * cd.quantity}$</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                  <tbody class="checkout-details">
                    <tr>
                      <td>Subtotal</td>
                      <td>$190</td>
                    </tr>
                    <tr>
                      <td>Shipping</td>
                      <td>$50</td>
                    </tr>
                    <tr>
                      <td>Total</td>
                      <td>$240</td>
                    </tr>
                  </tbody>
                </table>

              </div>
            </div>
          </div>
        </div>
      </div>
      </div>
      <!-- end check out section -->
      <jsp:include page="../layout/footer.jsp" />
      <jsp:include page="../layout/scripts.jsp" />
    </body>

    </html>