<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<head>
 	<meta name="viewport" content="width=device-width, initial-scale=1">
	<base href="/"> 
	 <link href="webjars/bootstrap/4.4.1-1/css/bootstrap.min.css"
        rel="stylesheet" />
     <link rel="stylesheet" href="<c:url value="/resources/static/css/application.css"/>" />
</head>
<body>
	<div class="container" style="margin-bottom:8vh; margin-top:4vh;"></div>
		<div class="login-heading display-4 text-center mb-5">Order Payment</div>
	    <div class="row">
	        <div class="col-lg-6 mx-auto">
	            <div class="card ">
	                <div class="card-header">
										<h4 class="login-heading text-center">Payment Details</h4>
	                    <!-- Credit card form content -->
	                    <div class="tab-content">
	                        <!-- credit card info-->
	                        <div id="credit-card" class="tab-pane fade show active pt-3">
	                            <form:form modelAttribute="order" id="payment-form" role="form">
	                                <div class="form-group"> 
	                                	<label for="username" style="font-weight:500;">Card Owner</label> 
	                                    <input type="text" id="username" placeholder="Card Owner Name" required class="form-control "> 
	                                 </div>
	                                <div class="form-group">
	                                    <label for="cardNumber" style="font-weight:500;">Card number</label>                    
	                                    <div class="input-group"> <input type="text" id="cardNumber" placeholder="Valid card number" class="form-control " required>
	                                        <div class="input-group-append"> <span class="input-group-text text-muted"> <i class="fab fa-cc-visa mx-1"></i> <i class="fab fa-cc-mastercard mx-1"></i> <i class="fab fa-cc-amex mx-1"></i> </span> </div>
	                                    </div>
	                                </div>
	                                <div class="row">
	                                    <div class="col-sm-8">
	                                        <div class="form-group"> 
	                                        	<label style="font-weight:500;"><span class="hidden-xs">Expiration Date</span></label>
	                                            <div class="input-group"> <input type="number" placeholder="MM" id="month" class="form-control" required> <input type="number" placeholder="YY" id="year" class="form-control" required> </div>
	                                        </div>
	                                    </div>
	                                    <div class="col-sm-4">
	                                        <div class="form-group mb-4"> <label style="font-weight:500;" data-toggle="tooltip" title="Three digit CV code on the back of your card">
	                                             CVV <i class="fa fa-question-circle d-inline"></i>
	                                            </label> <input type="text" id="cvv" required class="form-control"> </div>
	                                    </div>
	                                </div>
	                                <div class="card-footer">
	                                	<button disabled class="btn btn-block btn-primary">Final Payment : <i class="fas fa-rupee-sign mr-1"></i>${order.cart.grandTotal}</button> 
	                                	<button class="subscribe btn btn-success btn-block shadow-sm" type="submit"> Confirm Payment </button>
	                                	<button class="subscribe btn btn-danger btn-block shadow-sm" name="_eventId_cancel"> Cancel Payment </button>
	                                </div>
	                            </form:form>
	                        </div>
	                    </div> <!-- End -->
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
</body>
<script src="/resources/static/js/payment.js"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>