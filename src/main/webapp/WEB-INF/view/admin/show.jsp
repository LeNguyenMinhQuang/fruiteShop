<!DOCTYPE html>
<html lang="en">

<jsp:include page="./layout/head.jsp" />

<body class="sb-nav-fixed">
  <jsp:include page="./layout/navbar.jsp" />
  <div id="layoutSidenav">
    <jsp:include page="./layout/sidebar.jsp" />
    <jsp:include page="./${route}" />
  </div>
  <jsp:include page="./layout/scripts.jsp" />
</body>

</html>