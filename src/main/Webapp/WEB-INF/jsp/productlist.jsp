 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
 <html>
 	<head>
 		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/application.css" />
 	</head>
	 <body>
		 <jsp:include page="navbar.jsp"></jsp:include>
		 <div class="container ontainer-sm main1" >
		 		<c:if test="${not empty productsuccess}">
					<div class="alert alert-warning alert-dismissible fade show" role="alert">
						<strong>${productsuccess}</strong>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    		<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</c:if>
				<c:if test="${not empty alreadyadded}">
					<div class="alert alert-warning alert-dismissible fade show" role="alert">
						<strong>${alreadyadded}</strong>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    		<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</c:if>
				<c:if test="${not empty updatesuccess}">
					<div class="alert alert-warning alert-dismissible fade show" role="alert">
						<strong>${updatesuccess}</strong>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    		<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</c:if>
				<c:if test="${not empty deleteproduct}">
					<div class="alert alert-danger alert-dismissible fade show" role="alert">
						<strong>${deleteproduct}</strong>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    		<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</c:if>
				<c:if test="${not empty accesserror}">
					<div class="alert alert-warning alert-dismissible fade show" role="alert">
						<strong>${accesserror}</strong>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    		<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</c:if>
				<h3 class="display-4 text-center">All Products</h3>
				<div class="card-deck">
					<c:forEach items="${products}" var="product">
					  <div class="col-lg-4 col-sm-6">
					 	 <div class="card" style="width: 20rem;border:none;margin-bottom: 8vh;margin-left: 4vh;">
						    <img src="<c:url value="${product.url}"/>" class="card-img-top">
						    <div class="card-body" style="height:12rem">
						     	<h5 class="card-title" style="font-size:18px;">${product.productName}</h5><hr>
						        <a href="<c:url value="product/view/${product.productId}"/>" class="d-flex justify-content-center btn btn-primary">View</a> 
							   <sec:authorize access="hasRole('ADMIN')">
								    <div class="d-flex justify-content-center mt-3"> 
								        <a href="<c:url value="admin/product/edit/${product.productId}"/>" class="btn btn-warning text-white btn-sm mr-3">Edit</a>
								        <a href="<c:url value="admin/product/delete/${product.productId}"/>" class="btn btn-danger btn-sm" onclick="(!(confirm('Are you sure you want to delete this product?')))">Delete</a>
								      </div>  
							    </sec:authorize>
						      </div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		<nav>
		  <ul class="pagination justify-content-center">
		   	<li class="page-item">
		   		<a class="page-link" style="pointer-events: none">
        			<span aria-disabled="true">&laquo;</span>
      			</a>
      		</li>
		    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/product/list/0">1</a></li>
		    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/product/list/1">2</a></li>
		    <li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/product/list/2">3</a></li>
		   	<li class="page-item">
		   		<a class="page-link" style="pointer-events: none">
        			<span aria-hidden="true">&raquo;</span>
      			</a>
      		</li>
		  </ul>
		</nav>
		</body>
	<jsp:include page="footer.jsp"></jsp:include>
 </html>