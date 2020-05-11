<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<head>
 		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/application.css" />
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<jsp:useBean id="now" class="java.util.Date" />

	<div class="container-wrapper">
	    <div class="container main">
	        <div class="page-header">
	            <h1>Order</h1>
	            <p class="lead">Order confirmation</p>
	        </div>
	
	        <div class="container">
	            <div class="row">
	                <form:form commandName="order" class="form-horizontal">
	
	                    <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
	                       <div class="txt-center">
	                            <h1>Receipt</h1>
	                       </div>
	                        <div class="row">
	                            <div class="col-xs-6 col-sm-6 col-md-6">
	                                <address>
	                                    <strong>Shipping Address</strong><br/>
	                                    ${order.cart.customer.shipping_details.address}
	                                <br/>
	                                    ${order.cart.customer.shipping_details.city}, ${order.cart.customer.shipping_details.state}
	                                <br/>
	                                     ${order.cart.customer.shippingAddress.pincode}
	                                </address>
	                            </div>
	                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
	                                <p>Shipping Date: <fmt:formatDate type="date" value="${now}" /></p>
	                            </div>
	                        </div>
	
	                        <div class="row">
	                            <table class="table table-hover">
	                                <thead>
	                                    <tr>
	                                        <td>Product</td>
	                                        <td class="text-center">Price</td>
	                                        <td class="text-center">Total</td>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                <c:forEach var="cartItem" items="${order.cart.cartitems}">
	                                    <tr>
	                                        <td class="col-md-9"><img class="float-left mr-2" src="${cartitem.product.url}" style="height:300px;width:auto;object-fit:contain;"><em>${cartItem.product.productName}</em></td>
	                                        <td class="col-md-1" style="text-align: center">${cartItem.product.productPrice}</td>
	                                        <td class="col-md-1" style="text-align: center">${cartItem.totalPrice}</td>
	                                    </tr>
	                                </c:forEach>
	
	                                <tr>
	                                    <td></td>
	                                    <td></td>
	                                    <td class="text-right">
	                                        <h4><strong>Grand Total:</strong></h4>
	                                    </td>
	                                    <td class="text-center text-danger">
	                                        <h4><strong><i class="fas fa-rupee-sign mr-1"></i> ${order.cart.grandTotal}</strong></h4>
	                                    </td>
	                                </tr>
	
	                                </tbody>
	                            </table>
	                        </div>
	
	                        <input type="hidden" name="_flowExecutionKey" />
	                        <br/><br/>
	                        <button class="btn btn-default" name="_eventId_backToReviewShippingDetails">Back</button>
	                        <input type="submit" value="Submit Order" class="btn btn-default" name="_eventId_orderConfirmed" />
	                        <button class="btn btn-default" name="_eventId_cancel">Cancel</button>
	                    </div>
	                </form:form>
	            </div>
	        </div>
		</div>
	</div>
</body>
<jsp:include page="footer.jsp"></jsp:include>