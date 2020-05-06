<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/application.css" />
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
	<c:set var = "product" scope = "session" value = "${productview}"/>
	<c:set var = "delivery" scope = "session" value = "${delivery}"/>
	<div class="container main1">
		<c:if test="${not empty added}">
			<div class="alert alert-warning alert-dismissible fade show" role="alert">
				<strong>${added}</strong>
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				    	<span aria-hidden="true">&times;</span>
					</button>
			</div>
		</c:if>
		<div class="card" style="border:none;">
			<div class="row">
				<div class="col-sm-5 border-right bor">
	  				<div><img src="<c:url value="${product.url}"/>" class="card-img"></div>
				</div>
				<aside class="col-sm-7">
					<article class="card-body p-5">
						<h3 class="title mb-3">${product.productName}</h3>
						<p class="price-detail-wrap"> 
							<span class="price h3 text-warning"> 
								<span class="num"><i class="fas fa-rupee-sign mr-1"></i>${product.productPrice}</span>
							</span> 
						</p>
							<dl class="item-property">
	  						<dt>Manufacturer</dt>
	  						<dd><p>${product.productManufacturer}</p></dd>
						</dl>
						<dl class="item-property">
	  						<dt>Description</dt>
	  						<dd><p>${product.productDescription}</p></dd>
						</dl>
						<dl class="param param-feature">
	  						<dt>Delivery</dt>
	  						<c:if test="${empty delivery.address}">
	  							<a style="font-weight:500;text-decoration:none;"href="${pageContext.request.contextPath}/shipping_details_form">Add Shipping Details</a>
	  						</c:if>
	  						<dd>${delivery.address}</dd>
						</dl>
						<hr>
						<a href="${pageContext.request.contextPath}/product/list/0" class="btn btn-primary ">Back</a>
						<a href="${pageContext.request.contextPath}/cart/add/${product.productId}" class="btn btn-outline-primary"><i class="fas fa-shopping-cart"></i> Add to cart </a>
					</article>
				</aside>
			</div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>