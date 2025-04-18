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
        <jsp:param name="subtitle" value="Detail" />
      </jsp:include>
      <!-- cart -->
      <div class="cart-section mt-150 mb-150">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <hr class="cart-table-wrap">
              <table class="cart-table" style="text-align: center; margin-bottom: 48px;">
                <thead class="cart-table-head">
                  <tr class="table-head-row">
                    <th class="product-image">Order ID</th>
                    <th class="product-name">Receiver Detail</th>
                    <th class="product-price">Total Price</th>
                    <th class="product-quantity">Status</th>
                    <th class="product-total">Action</th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="table-body-row">
                    <td class="product-name">${order.id}</td>
                    <td class="product-name">
                      ${order.receiverName}<br>
                      ${order.receiverPhone}<br>
                      ${order.receiverAddress}
                    </td>
                    <td class="product-price">${order.totalPrice}$</td>
                    <td class="product-name">${order.status}</td>
                    <td class="product-total">
                      <a style="text-decoration: none" href="/history">Back</a>
                    </td>
                  </tr>
                </tbody>
              </table>

              <table class="cart-table" style="text-align: center;">
                <thead class="cart-table-head">
                  <tr class="table-head-row">
                    <th class="product-image">Image</th>
                    <th class="product-name">Product Name</th>
                    <th class="product-name">Price</th>
                    <th class="product-name">Quantity</th>
                    <th class="product-quantity">Total Price</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="od" items="${list}" varStatus="status">
                    <tr class="table-body-row">
                      <td class="product-image"><img src="/images/products/${od.product.image}" alt=""></td>
                      <td class="product-name">${od.product.name}</td>
                      <td class="product-price">${od.price}$</td>
                      <td class="product-price">${od.quantity}</td>
                      <td class="product-total">${od.quantity * od.price}$</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      </div>
      <!-- end cart -->
      <jsp:include page="../layout/footer.jsp" />
      <jsp:include page="../layout/scripts.jsp" />
    </body>

    </html>