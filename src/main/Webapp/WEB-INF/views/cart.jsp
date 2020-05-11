<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<head>
	<link rel="stylesheet" href="<c:url value="/resources/static/css/application.css" />" />
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	 <sec:authorize access="!isAuthenticated()">
		<% response.sendRedirect("/?loginaccesserror"); %>
	</sec:authorize>
	<c:choose>
		<c:when test="${not empty nocartitems}">
			<div class="container main">
				 <div class="jumbotron">
					  <h3 class="display-4 text-center">You have no items in your Cart. Look around to get your desired product</h3>
					  <div class="d-flex justify-content-center">
					  	<a class="btn btn-primary btn-lg mt-4" href="${pageContext.request.contextPath}/product/list/0" role="button">Explore</a>
					 </div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="container main1">
		    <h3 class="login-heading display-4 text-center" style="margin-bottom:8vh;">My Cart</h3>
		      <div class="table-responsive">
		            <table class="table">
		                    <tr>
		                        <th>Product</th>
		                        <th class="text-center">Quantity</th>
		                        <th class="text-center">Price</th>
		                        <th class="text-center">Total</th>
		                        <th><a href="${pageContext.request.contextPath}/cart/removeall/${cartId}" class="btn btn-danger btn-sm text-nowrap"><i class="fas fa-times mr-1"></i>Remove All</a></th>
		                    </tr>
		                <tbody>
		                <c:forEach items="${cartitems}" var="cartitem">
		                    <tr>
		                        <td class="col-sm-8 col-md-6">
		                        <div class="media">
		                            <img class="float-left mr-2" src="${cartitem.product.url}" style="height:300px;width:auto;object-fit:contain;">
		                            <div class="media-body">
		                                <h5 class="media-heading"><a style="color:black; text-decoration:none;" href="${pageContext.request.contextPath}/product/view/${cartitem.product.productId}">${cartitem.product.productName}</a></h5>
		                                <h6 class="media-heading"> by ${cartitem.product.productManufacturer}</h6>
		                                <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
		                            </div>
		                        </div></td>
		                        <td class="col-sm-1 col-md-1 text-center">
		                        	<span class="text-center"><strong>1</strong></span>
		                        </td>
		                        <td class="col-sm-1 col-md-1 text-center text-nowrap"><i class="fas fa-rupee-sign mr-1"></i><strong>${cartitem.product.productPrice}</strong></td>
		                        <td class="col-sm-1 col-md-1 text-center"><i class="fas fa-rupee-sign mr-1"></i><strong>${cartitem.product.productPrice}</strong></td>
		                        <td class="col-sm-1 col-md-1">
		                        <a class="btn btn-danger btn-sm" style="color:white;" href="${pageContext.request.contextPath}/cart/remove/${cartitem.cartitemid}"><i class="fas fa-times"></i> Remove</a></td>
		                    </tr>
		                   </c:forEach>
		                   <c:set var="total" value="${grandtotal}"></c:set>
		                    <tr>
		                        <td></td><td></td><td></td>
		                        <td><h5>Subtotal</h5></td>
		                        <td class="text-right"><h5><strong><i class="fas fa-rupee-sign mr-1"></i>${total}</strong></h5></td>
		                    </tr>
		                    <tr>
		                      	<td></td><td></td><td></td>
		                        <td><h5>Estimated shipping</h5></td>
		                        <td class="text-right text-success"><h5><strong>Free</strong></h5></td>
		                    </tr>
		                    <tr>
		                        <td>   </td>
		                        <td>   </td>
		                        <td>   </td>
		                        <td><h3>Total</h3></td>
		                        <td class="text-right text-nowrap"><h3><strong><i class="fas fa-rupee-sign mr-1"></i>${total}</strong></h3></td>
		                    </tr>
		                    <tr>
		                        <td></td><td></td><td></td>
		                        <td>
		                        <a href="${pageContext.request.contextPath}/product/list/0" class="btn btn-light text-nowrap"><i class="fas fa-shopping-cart mr-1"></i>Continue Shopping</a></td>
		                        <td>
		                        <a href="${pageContext.request.contextPath}/order/${cartId}" class="btn btn-success text-nowrap">Checkout<i class="ml-1 fas fa-credit-card"></i></a></td>
		                    </tr>
		                </tbody>
		            </table>
		        </div>
		   	 </div>
	</c:otherwise>
</c:choose>
</body>
<jsp:include page="footer.jsp"></jsp:include>