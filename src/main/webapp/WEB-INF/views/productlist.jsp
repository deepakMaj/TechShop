 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
 <html>
 	<head>
 		<link rel="stylesheet" href="<c:url value="/resources/static/css/application.css" />" />
 	</head>
	 <body>
		 <jsp:include page="navbar.jsp"></jsp:include>
		 <div class="container main1" >
		 		<c:if test="${not empty productsuccess}">
					<div class="alert alert-warning alert-dismissible fade show" role="alert">
						<strong>${productsuccess}</strong>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    		<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</c:if>
				<c:if test="${not empty nodetails}">
					<div class="alert alert-warning alert-dismissible fade show" role="alert">
						<strong>${nodetails}</strong>
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
				<c:choose>
					<c:when test="${not empty categoryMobile}">
						<h3 class="display-4 text-center">Mobiles</h3>
					</c:when>
					<c:when test="${not empty categoryLaptop}">
						<h3 class="display-4 text-center">Laptops</h3>
					</c:when>
					<c:when test="${not empty noProducts}"></c:when>
					<c:otherwise>
						<h3 class="display-4 text-center">All Products</h3>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${not empty noProducts}">
						<div class="container main main1">
							<div class="jumbotron">
								<h3 class="login-heading display-4 text-center">Searched product is not available</h3>
							</div>
						</div>
					</c:when>
					<c:otherwise>	
						<div class="card-deck">
							<c:forEach items="${products}" var="product">
							  <div class="col-lg-4 col-sm-12">
							 	 <div class="card card-style" style="border:none;margin-bottom: 10vh;">
								    <img src="<c:url value="${product.url}"/>" class="card-img-top" style="height:350px;width:100%;">
								    <div class="card-body card-body-style" style="height:12vh;">
								     	<h5 class="card-title" style="font-size:17px;">${fn:substring(product.productName, 0, 80)}...</h5>					
								     </div>
								      <hr><a href="<c:url value="product/view/${product.productId}"/>" class="d-flex justify-content-center btn btn-primary">View</a> 
									   <sec:authorize access="hasRole('ADMIN')">
										   <div class="d-flex justify-content-center mt-3"> 
										   		<a href="<c:url value="admin/product/edit/${product.productId}"/>" class="btn btn-warning text-white btn-sm mr-3">Edit</a>
										        <a href="<c:url value="admin/product/delete/${product.productId}"/>" class="btn btn-danger btn-sm" onclick="(!(confirm('Are you sure you want to delete this product?')))">Delete</a>
										    </div>  
									    </sec:authorize>
									</div>
								</div>
							</c:forEach>
						</div>
					</c:otherwise>
				</c:choose>	
			</div>
		<c:if test="${empty categoryMobile && empty categoryLaptop && empty searchValue && empty noProducts }">
		<nav>
		  	<ul class="pagination justify-content-center">
		   		<li class="page-item">
		   			<a class="page-link" style="pointer-events: none">
        				<span aria-disabled="true">&laquo;</span>
      				</a>
      			</li>
      			<c:forEach var="i" begin="0" end="${pages}">
		    		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/product/list/${i}">${i+1}</a></li>
		   		</c:forEach>
		   		<li class="page-item">
		   			<a class="page-link" style="pointer-events: none">
        				<span aria-hidden="true">&raquo;</span>
      				</a>
      			</li>
		  	</ul>
		</nav>
		</c:if>
	</body>
	<jsp:include page="footer.jsp"></jsp:include>
 </html>