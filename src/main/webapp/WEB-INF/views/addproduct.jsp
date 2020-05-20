<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<head>
	
	 <link rel="stylesheet" href="<c:url value="/resources/static/css/signup.css" />" />
</head>
<jsp:include page="navbar.jsp"></jsp:include>
  <div class="container-fluid">
  <div class="row no-gutter">
   <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container">
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
              <h3 class="login-heading display-4 text-center mb-4">Add Product</h3>
              <form:form action="${pageContext.request.contextPath}/admin/product/new" modelAttribute="product_detail" method="POST">
           
                <div class="form-label-group">
                  <form:input path="url" id="inputurl" class="form-control" placeholder="Url" required="autofocus"/>
                  <label for="inputurl">Url</label>
                </div>
                
                  <div class="form-label-group">
                  <form:input path="productName" id="inputproductname" class="form-control" placeholder="Product Name" required="autofocus"/>
                  <label for="inputproductname">Product Name</label>
                </div>
                
                  <div class="form-label-group">
                  <form:input path="category" id="inputcategory" class="form-control" placeholder="Category"/>
                  <label for="inputcategory">Category</label>
                </div>
                
                <div class="form-label-group">
                  <form:textarea path="productDescription" id="inputproductDescription" class="form-control" placeholder="Description" />
                </div>
                
                 <div class="form-label-group">
                  <form:input path="productManufacturer" id="inputproductManufacturer" class="form-control" placeholder="Manufacturer"  required="autofocus" />
                  <label for="inputproductManufacturer">Manufacturer</label>
                </div>
                
                <div class="form-label-group">
                  <form:input path="productPrice" id="inputproductPrice" class="form-control" placeholder="Price"  required="autofocus" />
                  <label for="inputproductPrice">Price</label>
                </div>

                <form:button class="btn btn-lg btn-block btn-primary text-white rounded-pill mb-2" type="submit">Add Product</form:button>
              </form:form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>