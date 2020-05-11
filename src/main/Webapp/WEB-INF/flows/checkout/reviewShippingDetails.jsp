<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
 		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/application.css" />
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Shipping Details</h1>
        	</div>
        		<form:form commandName="order" class="form-horizontal">
			        <div class="form-group">
			            <label for="billingAddress">Street Name</label>
			            <form:input path="cart.customer.shipping_details.address" id="billingAddress" class="form-Control" />
			        </div>
			
			        <div class="form-group">
			            <label for="billingState">State</label>
			            <form:input path="cart.customer.shipping_details.address" id="billingState" class="form-Control" />
			        </div>
			
			        <div class="form-group">
			            <label for="billingCity">City</label>
			            <form:input path="cart.customer.shipping_details..city" id="billingCity" class="form-Control" />
			        </div>
			
			        <div class="form-group">
			            <label for="billingPin">Pincode</label>
			            <form:input path="cart.customer.shipping_details.pincode" id="billingPin" class="form-Control" />
			        </div>
			
			        <input type="hidden" name="_flowExecutionKey" />		
			        <br/><br/>
			        <input type="submit" value="Next" class="btn btn-default" name="_eventId_reviewedShippingDetails" />
			        <button class="btn btn-default" name="_eventId_cancel">Cancel</button>
				</form:form>
			</div>
        </div>
</body>
<jsp:include page="footer.jsp"></jsp:include>