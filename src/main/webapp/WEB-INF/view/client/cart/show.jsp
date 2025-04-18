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
        <jsp:param name="subtitle" value="Cart" />
      </jsp:include>
      <!-- cart -->
      <div class="cart-section mt-150 mb-150">
        <div class="container">
          <div class="row">
            <div class="col-lg-8 col-md-12">
              <div class="cart-table-wrap">
                <table class="cart-table">
                  <thead class="cart-table-head">
                    <tr class="table-head-row">
                      <th class="product-remove"></th>
                      <th class="product-image">Product Image</th>
                      <th class="product-name">Name</th>
                      <th class="product-price">Price</th>
                      <th class="product-quantity">Quantity</th>
                      <th class="product-total">Total</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:if test="${list == null or list.size() == 0}">
                      <tr class="table-body-row">
                        <td colspan="6">Cart is empty</td>
                      </tr>
                    </c:if>
                    <c:forEach var="cd" items="${list}" varStatus="status">
                      <tr class="table-body-row">
                        <td class="product-remove">
                          <form:form action="/removeFromCart/${cd.id}" method="post">
                            <input type="hidden" name="${_crsf.parameterName}" value="${_crsf.token}">
                            <button class="btn btn-sm" style="font-size: 18px"><i
                                class="fa fa-times text-danger"></i></button>
                          </form:form>
                        </td>
                        <td class="product-image"><img src="/images/products/${cd.product.image}" alt=""></td>
                        <td class="product-name">${cd.product.name}</td>
                        <td class="product-price">${cd.price}$</td>
                        <td class="product-quantity">
                          <button class="btn btn-sm quantityBtn minus-cart" style="margin-right: 10px;">
                            <i class="fa fa-minus"></i>
                          </button>
                          <span class="quantityValue" cdIndex="${status.index}">${cd.quantity}</span>
                          <button class="btn btn-sm quantityBtn plus-cart" style="margin-left: 10px;">
                            <i class="fa fa-plus"></i>
                          </button>
                        </td>
                        <td class="product-total total-cd" product-price="${cd.price}">${cd.quantity * cd.price}$</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>

            <c:if test="${list.size() > 0}">
              <div class="col-lg-4">
                <div class="total-section">
                  <table class="total-table">
                    <thead class="total-table-head">
                      <tr class="table-total-row">
                        <th>Total</th>
                        <th>Price</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr class="total-data">
                        <td><strong>Subtotal: </strong></td>
                        <td id="totalSubCart">${totalPrice}$</td>
                      </tr>
                      <tr class="total-data">
                        <td><strong>Shipping: </strong></td>
                        <td>$0</td>
                      </tr>
                      <tr class="total-data">
                        <td><strong>Total: </strong></td>
                        <td id="totalCart">${totalPrice}$</td>
                      </tr>
                    </tbody>
                  </table>
                  <form:form action="/confirm-checkout" method="post" modelAttribute="cart">
                    <input type="hidden" name="${_crsf.parameterName}" value="${_crsf.token}">
                    <div style="display: none;">
                      <c:forEach var="cd" items="${list}" varStatus="status">
                        <div class="mb-3">
                          <div class="form-group">
                            <label>Id:</label>
                            <form:input class="form-control" type="text" value="${cd.id}"
                              path="cartDetails[${status.index}].id" />
                          </div>
                          <div class="form-group">
                            <label>Quantity:</label>
                            <form:input class="form-control" type="text" value="${cd.quantity}"
                              path="cartDetails[${status.index}].quantity" id="cd-${status.index}" />
                          </div>
                        </div>
                      </c:forEach>
                    </div>
                    <div class="cart-buttons">
                      <button type="submit"
                        style="height: 40px; border: none; border-radius: 20px; background-color: #f28123; padding: 10px 20px; font-family: 'Poppins'; font-size: 14px; color: white">Check
                        Out</button>
                    </div>
                  </form:form>
                </div>

              </div>
            </c:if>
          </div>
        </div>
      </div>
      <!-- end cart -->
      <jsp:include page="../layout/footer.jsp" />
      <jsp:include page="../layout/scripts.jsp" />
    </body>

    </html>