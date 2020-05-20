<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<base href="/"> 
	 <link href="webjars/bootstrap/4.4.1-1/css/bootstrap.min.css"
        rel="stylesheet" />
	<link rel="stylesheet" href="<c:url value="/resources/static/css/signup.css"/>" />
</head>
<body>
  <div class="container-fluid"> 
  	<div class="row no-gutter">
   		<div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
    		<div class="col-md-8 col-lg-6">
      			<div class="login d-flex align-items-center py-5">
        			<div class="container">
          				<div class="row">
            				<div class="col-md-9 col-lg-8 mx-auto">
              				<h3 class="login-heading display-4 text-center mb-4">Shipping Details</h3>
             					 <form:form modelAttribute="order">
           
					                <div class="form-label-group">
					                  <form:input path="cart.customer.shipping_details.address"  type="text" id="inputaddress" class="form-control" placeholder="First Name" required="autofocus"/>
					                  <label for="inputaddress">Address</label>
					                </div>
					                
					                  <div class="form-label-group">
					                  <form:input path="cart.customer.shipping_details.state" type="text" id="inputstate" class="form-control" placeholder="Last Name" required="autofocus"/>
					                  <label for="inputstate">State</label>
					                </div>
					                
					                  <div class="form-label-group">
					                  <form:input path="cart.customer.shipping_details.city"  type="text" id="inputcity" class="form-control" placeholder="Email address" required="autofocus"/>
					                  <label for="inputcity">City</label>
					                </div>
					                
					                <div class="form-label-group">
					                  <form:input path="cart.customer.shipping_details.pincode" id="inputpincode" class="form-control" placeholder = "Pincode" />
					                  <label for="inputpincode">Pincode</label>
					                </div>
					                
					                <div class="d-flex justify-content-center">
								        <input type="hidden" name="_flowExecutionKey" />		
								        <button type="submit" class="btn btn-primary mr-3" name="_eventId_reviewedShippingDetails">Next</button>
								        <button type="submit" class="btn btn-danger" name="_eventId_cancel">Cancel</button>
								     </div>
								     
									</form:form>
								</div>
        					</div>
        				</div>
        			</div>
        		</div>
        	</div>
        </div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>