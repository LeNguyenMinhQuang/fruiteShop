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
        <jsp:param name="subtitle" value="History" />
      </jsp:include>
      <!-- cart -->
      <div class="cart-section mt-150 mb-150">
        <div class="container">
          <div class="row">
            <div class="col-12">
              <div class="cart-table-wrap">
                <table class="cart-table">
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
                    <c:if test="${list == null or list.size() == 0}">
                      <tr class="table-body-row">
                        <td colspan="6">History is empty</td>
                      </tr>
                    </c:if>
                    <c:forEach var="od" items="${list}" varStatus="status">
                      <tr class="table-body-row">
                        <td class="product-name">${od.id}</td>
                        <td class="product-name">
                          ${od.receiverName}<br>
                          ${od.receiverPhone}<br>
                          ${od.receiverAddress}
                        </td>
                        <td class="product-price">${od.totalPrice}</td>
                        <td class="product-name">${od.status}</td>
                        <td class="product-total">
                          <a style="text-decoration: none" href="/history/${od.id}">View</a>
                        </td>
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