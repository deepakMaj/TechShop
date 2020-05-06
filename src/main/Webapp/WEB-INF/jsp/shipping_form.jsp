<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<head>
	 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signup.css" />
	 <sec:authorize access="!isAuthenticated()">
		<% response.sendRedirect("/?shippingdetailsaccesserror"); %>
	</sec:authorize>
</head>
<jsp:include page="navbar.jsp"></jsp:include>
  <div class="container-fluid">
  <div class="row no-gutter">
   <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container">
         <spring:hasBindErrors name="shipping_details">
			<div class="alert alert-warning alert-dismissible fade show" role="alert">
				<c:forEach items="${errors.allErrors}" var="error">
					<strong><spring:message message="${error}" /></strong>
				</c:forEach>
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    		<span aria-hidden="true">&times;</span>
				</button>
			</div>
		 </spring:hasBindErrors>
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
              <h3 class="login-heading display-4 text-center mb-4">Shipping Details</h3>
              <form:form action="shipping_details_form" modelAttribute="shipping_details" method="POST">
           
                <div class="form-label-group">
                  <form:input path="address"  type="text" id="inputaddress" class="form-control" placeholder="First Name" required="autofocus"/>
                  <label for="inputaddress">Address</label>
                </div>
                
                  <div class="form-label-group">
                  <form:input path="state" type="text" id="inputstate" class="form-control" placeholder="Last Name" required="autofocus"/>
                  <label for="inputstate">State</label>
                </div>
                
                  <div class="form-label-group">
                  <form:input path="city"  type="text" id="inputcity" class="form-control" placeholder="Email address" required="autofocus"/>
                  <label for="inputcity">City</label>
                </div>
                
                <div class="form-label-group">
                  <form:input path="pincode" id="inputpincode" class="form-control" placeholder = "Pincode" />
                  <label for="inputpincode">Pincode</label>
                </div>

                <form:button class="btn btn-lg btn-block btn-primary text-white rounded-pill mb-2" type="submit">Save</form:button>
              </form:form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>