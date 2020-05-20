<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <head>
 	<link rel="stylesheet" href="<c:url value="/resources/static/css/application.css"/>" />
 </head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="container-wrapper">
		<c:choose>
			<c:when test="${empty customerOrders}">
				<div class="container main main1">
					<div class="jumbotron">
						<h3 class="login-heading display-4 text-center">You have no orders</h3>
						<div class="d-flex justify-content-center mt-3">
							<a href="${pageContext.request.contextPath}/product/list/0" class="btn btn-primary btn-lg">Products</a>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<c:if test="${not empty orderCancelled}">
					<div class="alert alert-danger alert-dismissible fade show" role="alert">
						<strong>${orderCancelled}</strong>
						<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			    			<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</c:if>
			 	<div class="page-header mt-4 mb-3">
		            <h1 class="login-heading display-4 text-center">My Orders</h1>
		     	 </div>
		   	  	<div class="container mt-4 border border-dark rounded">	       
		        <div class="container">
		            <div class="row">
		                    <div class="well col-md-12">
		                        <div class="row mt-3">
		                            <table class="table table-responsive">
		                                <thead class="thead-dark">
		                                    <tr class="d-md-flex">
		                                        <th class="col-2">Product</th>
		                                        <th class="col-2"></th>
		                                        <th class="col-2 text-center">Status</th>
		                                        <th class="text-center col-1 ">Price</th>
		                                        <th class="text-center col-2 text-nowrap">Shipping Address</th>
		                                        <th class="text-center col-1">Total</th>
		                                        <th class="col-2"></th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                <c:forEach var="order" items="${customerOrders}">
		                                	<c:forEach var="product" items="${order.productItems}">
		                                    <tr style="font-weight:500;" class="d-md-flex">
		                                        <td class="col-2"><img class="float-left" src="${product.url}" style="height:300px;width:30vh;object-fit:contain;" /></td>
		                                        <td class="col-2 ml-2"><a style="color:black; text-decoration:none;" href="${pageContext.request.contextPath}/product/view/${product.productId}">${product.productName}</a></td>
		                                        <td class="col-2 text-center text-success text-nowrap"><i class="fas fa-check mr-1"></i>Dispatched</td>
		                                        <td class="col-1" style="text-align: center"><i class="fas fa-rupee-sign mr-1 text-muted"></i>${product.productPrice}</td>
		                                        <td class="col-2" style="text-align: center">${order.customer.shipping_details.address}</td>
		                                        <td class="col-1 text-nowrap" style="text-align: center; font-size:18px;"><i class="fas fa-rupee-sign text-muted mr-1"></i>${order.grandTotal}</td>
		                                        <td class="col-2 text-center"><a href="${pageContext.request.contextPath}/myOrders/cancel/${order.orderId}" class="btn btn-danger btn-sm text-nowrap" onclick="(!(confirm('Are you sure you want to cancel this order? Note: If multiple items are there in one order all will be cancelled')))">Cancel Order</a></td>
		                                    </tr>
		                                    </c:forEach>                        	
		                                </c:forEach>	
		                                </tbody>
		                            </table>
		                        </div>
							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>