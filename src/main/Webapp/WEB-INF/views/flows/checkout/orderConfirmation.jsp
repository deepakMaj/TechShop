<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<head>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<base href="/"> 
	 <link href="webjars/bootstrap/4.4.1-1/css/bootstrap.min.css"
        rel="stylesheet" />
     <link rel="stylesheet" href="<c:url value="/resources/static/css/application.css"/>" />
</head>
<body>
	<jsp:useBean id="now" class="java.util.Date" />
	 <form:form modelAttribute="order">
	   <div class="container-fluid">
		 <div class="login-heading display-4 text-center mt-4 mb-3">
	            Order confirmation
	     </div>
	     <div class="container-fluid main main1 mt-4 border border-dark rounded">	       
	        <div class="container mb-4">
	            <div class="row">
	                    <div class="well col-md-12 ">
	                       <div class="text-center mt-4 mb-3">
	                            <h2 style="text-decoration:underline;">Receipt</h2>
	                       </div>
	                        <div class="row">
	                            <div class="col-md-6">
	                                <address>
	                                    <p style="font-size:18px; font-weight:600;">Shipping Address</p>
	                                    ${order.cart.customer.shipping_details.address}<br/>
	                                    ${order.cart.customer.shipping_details.city}, ${order.cart.customer.shipping_details.state}<br/>
	                                     ${order.cart.customer.shipping_details.pincode}
	                                </address>
	                            </div>
	                            <div class="col-md-6 text-lg-right">
	                                <p style="font-weight:500;">Shipping Date: <fmt:formatDate type="date" value="${now}" /></p>
	                            </div>
	                        </div>
	                        <div class="row mt-3">
	                            <table class="table table-responsive">
	                                <thead class="thead-dark">
	                                    <tr>
	                                        <th class="col">Product</th>
	                                        <th class="text-center col">Price</th>
	                                        <th class="text-center col">Total</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                <c:forEach var="cartItem" items="${order.cart.cartitems}">
	                                    <tr style="font-weight:500;">
	                                        <td class="col-md-9"><img class="float-left mr-2" src="${cartItem.product.url}" style="height:300px;width:auto;object-fit:contain;"><em>${cartItem.product.productName}</em></td>
	                                        <td class="col-md-2" style="text-align: center"><i class="fas fa-rupee-sign mr-1"></i>${cartItem.product.productPrice}</td>
	                                        <td class="col-md-1" style="text-align: center"><i class="fas fa-rupee-sign mr-1"></i>${order.cart.grandTotal}</td>
	                                    </tr>
	                                </c:forEach>	
	                                <tr>
	                                    <td></td>
	                                    <td class="text-right text-nowrap">
	                                        <h4><strong>Grand Total:</strong></h4>
	                                    </td>
	                                    <td class=" text-danger text-nowrap">
	                                        <h4><strong><i class="fas fa-rupee-sign mr-1"></i>${order.cart.grandTotal}</strong></h4>
	                                    </td>
	                                </tr>
	                                </tbody>
	                            </table>
	                        </div>
	                        
							<div class="d-lg-flex justify-content-end">
		                        <input type="hidden" name="_flowExecutionKey" />
		                        <button type="submit" class="btn btn-primary mr-2 text-nowrap" name="_eventId_backToReviewShippingDetails">Back</button>
		                        <button type="submit" class="btn btn-danger mr-4 text-nowrap" name="_eventId_cancel">Cancel</button>
		                        <button type="submit" class="btn btn-success text-nowrap" name="_eventId_orderConfirmed" >Pay<i class=" ml-2 fas fa-credit-card"></i></button>
	                        </div>                
	                    </div>
	            	</div>
	        	</div>
			</div>
		</div>
	</form:form>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>