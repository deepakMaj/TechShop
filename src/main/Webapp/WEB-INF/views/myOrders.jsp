<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
 <head>
 	<link rel="stylesheet" href="<c:url value="/resources/static/css/application.css"/>" />
 </head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="container-wrapper">
			 <div class="page-header mt-4 mb-3">
		            <h1 class="login-heading display-4 text-center">My Orders</h1>
		      </div>
		    <div class="container mt-4 border border-dark rounded">	       
		        <div class="container">
		            <div class="row">
		                    <div class="well col-xs-10 col-sm-10 col-md-12 col-xs-offset-1 col-sm-offset-1 ">
		                        <div class="row mt-3">
		                            <table class="table table-responsive">
		                                <thead class="thead-dark">
		                                    <tr>
		                                        <th class="col">Product</th>
		                                        <th class="text-center col">Price</th>
		                                        <th class="text-center col">Shipping Address</th>
		                                        <th class="text-center col">Total</th>
		                                    </tr>
		                                </thead>
		                                <tbody>
		                                <c:forEach var="order" items="${customerOrders}">
		                                    <tr style="font-weight:500;">
		                                        <td class="col-md-6"><img class="float-left mr-2" src="${order.product.product.url}" style="height:300px;width:auto;object-fit:contain;"><em>${order.cart.cartitems.product.productName}</em></td>
		                                        <td class="col-md-3" style="text-align: center">${order.customer.shipping_details}</td>
		                                        <td class="col-md-2" style="text-align: center">${order.cart.cartitems.product.productPrice}</td>
		                                        <td class="col-md-1" style="text-align: center">${order.grandTotal}</td>
		                                    </tr>
		                                </c:forEach>	
		                                </tbody>
		                            </table>
		                        </div>
							</div>
					</div>
				</div>
			</div>
		</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>